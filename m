Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC42EC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C1810E640;
	Wed, 31 Jul 2024 14:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WebZPghv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8487E10E640
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437717; x=1753973717;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HsBAcvw9OE4Iup8aADkdDzaI7QpelWzhutFd+yDh+xU=;
 b=WebZPghv1ElHbauLIuL+BFUeZs/1XsVL5yA+e305s9CX7De1jqc+TU34
 flynkL3BdbPTt3zNP79KAZPrNVnECVq/I5frFEBKtd/3uQ8MdsGCSzuyH
 DsZL6QmJXPGv76fgxEnl5N4dEMBfU226TLpEcIg9Qt0nEz8cLDuUEiGD/
 q3kmiaBPVP0k9FMis63HH2Mz3SiLaUOnAuIkD7Dt691UEgAiI+I3vE3ot
 mj1GvoYXAJVb+koVuvXUue0bLTU/aZbA4J+1j0IRYF0k971daq2khRypn
 fmh+nEx57oadeJwikRa3gThIk98ocKumPkYZpTLw7xeY2alCxSNj7LPmc w==;
X-CSE-ConnectionGUID: vwdHd02tScWNOHVJyrJDgA==
X-CSE-MsgGUID: lkxluV0GS1yCIszgYmO8XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31730046"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31730046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:55:17 -0700
X-CSE-ConnectionGUID: dAvkS23bSoGXPRYxBhqrpg==
X-CSE-MsgGUID: vAR0YXQHSOStin2kyiwrdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59507933"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 07:55:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 07:55:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 07:55:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 07:55:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 07:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0X+nr2+utW4XjaUedJCGcqAOhupXauROfePhxQ9m/VYA71q8saiEzibIFItaKnaIp/V7pUsw2BNmZm7/FHOY4iV5oI8EuaE7cknEjRMaD1hfyLYk0HfQ1GGlVNANyadDVa6D0C5kC/7Es/jNYaBNoi8aWvCN1n+CCgG44SOqqGOXe4jWmwKAmn0mQyDuFgnT9NOih2fJsUXmLn410IbtwYLQg+P2CCxHD0vfTt5KS5zd7OTBRbaUgShcRBqcb1zSWvlRjg2KyWIDoodbwOuD1alIQSrH7SC1DlEaGOvjDFAKGeRDn5ymxFKnckbG8NVeYP7snmQWnc7lMFH2+L8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9waTDeCfE8QjdA/y8+BajfTjaYCKY315M6UHo+FWcI=;
 b=qoC4m+Tw00Yuf1mzc+YPFW4OGrVBzJUtC1lH3pj1DbbjmXg+0af0FRd2cvmOqiOQRKJsAPOcByYMKAMTrpe4GiycT+2FVjbx7ym/M/TIRX3/rPJrtVsyve6djOsXhRBKnqoqbkdmTQwHuQeMPVWK21e3uDFiNMc1KkhyZeDPR5xUFQJ+tXpwaLq2xDIvvuZ5DY4P/sjG/hhpryOR6N5a/1Q1bJntMb7zi5rRz4aaql5lsod1KeJivMJA/HV9zbRVvtBl1c3+6prREKwiXTAGt23p4hbun0Co0HlsMNUzAcRmktmZpfUIq+TZ4KQskJFuU+rdaJuSUjEDri0wP8lHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL1PR11MB5318.namprd11.prod.outlook.com (2603:10b6:208:312::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 14:55:13 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 14:55:13 +0000
Message-ID: <72b94bae-cb96-41fb-831e-76565673e427@intel.com>
Date: Wed, 31 Jul 2024 10:55:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/5] drm/xe/guc: Add capture size check in GuC log
 buffer
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240724145130.522668-1-zhanjun.dong@intel.com>
 <20240724145130.522668-4-zhanjun.dong@intel.com>
 <6aab19284ab6d27df960493808ba880084e9c79c.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <6aab19284ab6d27df960493808ba880084e9c79c.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL1PR11MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d50ef8f-5fb9-4ac1-6863-08dcb170c84a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2lNdFVXR25YM2hrVE5VOVJScHZTOUFJTk14T3NvYVQ4VmE3bks1VS9PNWZx?=
 =?utf-8?B?bUZYYVI1SklJRVZsOUtpSEsyYW5LU0o0MzlseVIweHFvTUw4ZG85Z2xzUkR6?=
 =?utf-8?B?UmxmeVFCZUJwaWJlNDR5SGJnUFpYMjA2cyt4ckRLTy9YR1hBSDd2dG5FeTZV?=
 =?utf-8?B?NmRHN1dZR0lTWUxLandhYzkzYk5TOUlCSVlKd1JrN21FZUVoU0pHemlaeTE5?=
 =?utf-8?B?empIUmlkUDVHdmRXTVptckdJNGp6ZG13VTA4U1cwTFFiaXYzU2NMYm5PTHVM?=
 =?utf-8?B?ZFJNQ0E5MHh3Nk1ldHluOStqeXMwaGJLeG5XTnkzUFNnRjZKR3RrbFJuRlU2?=
 =?utf-8?B?QnlSMWtpSkM0RWhtSkRoNEp4RDYzZUk5b1lVWFZDb3dITy9NWERBdjl4bjZw?=
 =?utf-8?B?dWxQU2o5b0VDcDFGZnkwM3ZNK2pHQW9mOTJIaEJoWEZnWkxBa2d1U0RyY0V4?=
 =?utf-8?B?T1orTGhDYSthQ1YwMmxiZEoycVJQZ2t3ZHFtbk1qQlhiWnVWbzBySzFCTjlo?=
 =?utf-8?B?K0tRTEE5UkNqMTIzaWpzeVJ6N3F4bUEydlI1WllDOTA0UmRPcStOemRVbWdl?=
 =?utf-8?B?VEJjUTE2WGh4U1BWNjZQS2hlU3FTVGVsR1ZQdEVDT1p5S3FlektjODErTzlo?=
 =?utf-8?B?eklwREp4aW1WSGo5UCtjT0dxWjJiN0Vtd01Xc282M1M2Vy9pZFRNVVhZZUJ0?=
 =?utf-8?B?WlllMXk1NlNza2ZxWVN0eG1rWUhydkQ5c2pGOE9nZHM5dVJNMWNrZG51a2t4?=
 =?utf-8?B?YWY1MlhoNzAzaElqZ2RURENjMWVMTGMwaEYxM1R5MmRhU2I0VHFvQ05Jbjho?=
 =?utf-8?B?N01JazYyWTkwMXhkS3ZlVEtzRVg4cGcxSUw4VklUejZjZVhXYTRHSHlqTm9Q?=
 =?utf-8?B?LzBtRTR3dUJnVzhzSU1vRXdrNUU1OUxyc1dpVWVXQUpWclY5TmJOeEFRMHJv?=
 =?utf-8?B?VGhVOTZaallzbCt3UzdmKzVKVzZuS05WbDVBRnloeERkdjdRWnNKaHlkcmtF?=
 =?utf-8?B?TWZzQ3l0S1k5Ni9oZ011SXJrR0NkRkQ3ay83alAwQWRJclR3RWRSczZmQzg0?=
 =?utf-8?B?Sll2OWdxR2NDbnl2S0JNYUJQTEJtcUhZZ2FXNTQ0aXFrclJ1M2pueGZyQVdm?=
 =?utf-8?B?RzdGMUhiNERnSVRzaGxzQmc1cDBLQXZhMVVhQnVUQ0dnSlVrNkl3ZlFaN1cy?=
 =?utf-8?B?K3pwU2tvcjczMy82ZDlDeHllTmFqOEkvU0FpYmlKSG9lNHU5UTVxTUh6VExT?=
 =?utf-8?B?M0d4QWE2ckZuTkN1dEJWVWl5UHF0WkVTaGU4RldLZk9qYkJiWkcwM3dVWEkz?=
 =?utf-8?B?S0Y1Q0dNYm1kQjVta3lucDVzT090NHBxcTNKS0RlNzlHL0dGbkZXa3F5Z3o1?=
 =?utf-8?B?dmVDbmU3cUkzcFQyQWJ4eGhlTW9BZkZRVWQ4NXNHL0VNNzZzQ2plajVCZ1Zw?=
 =?utf-8?B?RFM5MGRxVW1QZTRWSzNzSlh1M0psMzU4c1hYU2NOTnJXUDF2SFpGcjV2Z0NU?=
 =?utf-8?B?RWRla2R4Q1lYUXdKV3BKQW1yZkhjOUpFYTk2L1JwQ043c2FIa0Z4NyswdCtL?=
 =?utf-8?B?UHZKU1dyOTEyVFJVM3JZOXBTZHQvckRjQkUvKzh0NjlPa0lDMW5TTndiRnM3?=
 =?utf-8?B?V09xdnp0MkdRUC9VQW9ZTUJvUjA2VkFzWVRyODl4cml5WFVKbmNqaDlyRGMy?=
 =?utf-8?B?a2FidzQ5cXkrTGNDN3NmZlYvaWlMK1ZrNjU0WFNZc05kVW54UXZsWjZ3dW1J?=
 =?utf-8?B?Wmk3eTBUSnJWdnkvdGIwd3RkZDVJOHBZbnNTMFJYV05TZnhOUTYzTW5ZMnNp?=
 =?utf-8?B?dXFndEppQVZyQUNIYkN5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFYrbnQ0ZEN4dkpjVWtzNVRZcm5HUkpNdmNubXRNb2dRVWErdlFpK2RjRHdZ?=
 =?utf-8?B?SUI1aGJ2bVlrMDA4dUptay9xYmFpMnVqcHBpRnBVKy9lUHdCNkdFNk9CK3Iw?=
 =?utf-8?B?SWxadzdwMlpYS1F2a3BHWHpMVU5XNlR5WlZEVko3T0Rkc1pwSC95MCtOR3dk?=
 =?utf-8?B?SGp2azBjc3R1ZTNrVGpldytYek9OQkhtK3BodkNTdzlZMldHdE5weVlvR29G?=
 =?utf-8?B?RG9QdGo3UHVNRzZHRFVzNkJKVWtHbzhjQ0QyeDhHdlNDZVIyVWRJeEMyTjZo?=
 =?utf-8?B?enJZU3l0QWo1SThoVWpCSks2bG5QZFk3bTRuVHZMeEdJMlpEYnh3R2JNSEFE?=
 =?utf-8?B?eWVENzl4UUoxbldFeWdZZSthblBwZ2xZRC9KYkVYVWNjcElOczdaWDlNV3Nt?=
 =?utf-8?B?ZGJSN0lZUjJRWEhIVTBuT2tEclByYnQzWEMwdlkxRzJveTdoQjNVbHpXR1Rj?=
 =?utf-8?B?VXArZ0UvdjNIREE5WVp2ejBpOWpZQjRKVmtZdXdYRnhPQ1VyYXJZZDU4dENR?=
 =?utf-8?B?aG16dEhGMUs0NDRyckFtWEM1VXlxZTJueVlLNEEwY0JCQ0EyYjR6MWdKeWp1?=
 =?utf-8?B?cUpOOGJFbkRBbHNUS2Rib241TjRQZm00RWJteDRHVDZnVEFtbU9reldGWWts?=
 =?utf-8?B?YVhRalRydGpIblZFcEo5MFg2RjJYSEFsY1oybU90Tk1xYUJoRzZETG5NazJH?=
 =?utf-8?B?eUdNcHAzb0tTdzFkUXE5b1BmaEZKM0Uwd0NBTjFXUnRDU3J2SEFQdi85bHhn?=
 =?utf-8?B?eXVQUDk2SnBKTTJRbGxRWHZ5VlVRd2lWNG12MWM4dEZUTStWYmljZ0NlR1Nv?=
 =?utf-8?B?aGhPMk9hSnQ4WnI5bjRmZFB5K3E2Y3dwTkdpVFh6aXZwcTRtZXdKMGtjT1Fr?=
 =?utf-8?B?MnNIT2hDUnA4Zm5GRkxyeGtyQTFScm83YUdMbVgyWnBiNkhsRTdTODAvNUNy?=
 =?utf-8?B?UGExMkRkcGZVTzlqN0MwVVg1Zk5PTlYzZHZ6aGNNcjhsUkhzOCtyc3U3OFdM?=
 =?utf-8?B?YXZ1aUdDTUNwWWRRV28vT3lob1YwTXZ6QXhYSmwreVBQc3dPMVA5aGhXU2lx?=
 =?utf-8?B?NTZNdWNqR1NHNnRxS0VkK0U1amlmcWVScHNHSFBJK0h6UmxXRTN2YTZZNEsz?=
 =?utf-8?B?YXQ3VzlBZGtkL1FOblJOekVhK2lYemZxZ3JkRGsyK2VaQlhnbFlqNkhFYnBZ?=
 =?utf-8?B?dkI4UFdIQ3VHUHZ6Nzc1YlFFSis5aEdqOUtEME45RG5XZ05NbCsrVXpReE5V?=
 =?utf-8?B?SnB5Smp5QzlGa0FScFkxZ1dFaWhsN2tFWXVzbElEa253ZTVRZDhCbDRFaXFT?=
 =?utf-8?B?Q3BpNHFnWjQzUDRCVHBHcnlXY2RwZTd2aE5aT21qUEo5VEdJQXdoNVh4akJS?=
 =?utf-8?B?cDFXWkxzTkQrQ0NiREhyL25kTk1Kd3lUMUZiZEI0NFhMOWo0QlFKZTNFKzhY?=
 =?utf-8?B?b2NSYjAwdzdvRm1ZSnZ0dERsR25lcHpkd3pLaTROdEZqVnNMRXduY3R6UlVo?=
 =?utf-8?B?YXBuWDdZZURFS1ljczNqY2w0aWVqQ1lXbG9lMEg0Q0p6azJlRURiSVVjZ080?=
 =?utf-8?B?Y0VvTXozSHcyUmRYRE5zc01IUWdFbzNKMjc2QmpEOE1RaW5nY01panh4RHZj?=
 =?utf-8?B?bCs4UDI5dDV5RFFVMldRR3l6Ym5YMGhUMVlNTnNwM1laMkVwNmtsOEpFR2lW?=
 =?utf-8?B?eVJ1RDhQNlQ0Tzh6T0dpa09jbVNZeDVLUWN0WmkxV2I3VktTY0FHUVY1Y2Ew?=
 =?utf-8?B?WE02Q3JtOGFlL0R1bnp3TFg0QVRSRzZuV0FFUHYxZmtOdW9uMytGWlhPYWR1?=
 =?utf-8?B?QXhpTUJ0UWNhOG5pSlAzVHJ0WTgvR3NEUWJEcFd1ME1DODUzbXZvSlVOUFdj?=
 =?utf-8?B?UkNTSW1YeWtSYUJzRjlkaUx5RUJhL2I4L1RUOXFYbmFQUnduS1lBaDFuamh4?=
 =?utf-8?B?VWxZbmY3Y1lKVGJSTDh0SDZ6SzBjSHUxMzNNVS9FSEwyQjB4VUJONE9NT1Rx?=
 =?utf-8?B?UXhkNzBLaHFhSkxKL1FzaDFVY1hFRW1kN2Z0UDd2NEtidS9OM0NOdCtvUE5L?=
 =?utf-8?B?WlVnZnhjcXhMOUVkNG5ic2dUNlNBZ2RxbXR1bktON1QwOEdYWkRWT09IdVUz?=
 =?utf-8?Q?kj8IR/fYb3r+1tpkMxknUamb6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d50ef8f-5fb9-4ac1-6863-08dcb170c84a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 14:55:13.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SG0bZc7dYNBtAyw7JGRlqxaC873YUtg7/OEsYDENxsNhJXXo0Dy6LhvTNa1/VyyJF6839a9aF26vZ10YK7uJNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5318
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

See my comments below.

Regards,
Zhanjun Dong

On 2024-07-30 3:20 p.m., Teres Alexis, Alan Previn wrote:
> On Wed, 2024-07-24 at 07:51 -0700, Zhanjun Dong wrote:
>> The capture-nodes is included in GuC log buffer, add the size check
>> for capture region in the whole GuC log buffer.
>> Add capture output size check before allocating the shared buffer.
>>
> alan: I think the use of the term "capture-nodes" above is not very clear,
> assuming the term "nodes" is per the meaning in the extraction patch.
> So perhaps a tweak to above first line:
> "Capture-nodes generated by GuC are placed in the GuC capture ring
> buffer which is a sub-region of the larger Guc-Log-buffer.
> Add capture output size check ....". >
> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h  |  20 ++++
>>   drivers/gpu/drm/xe/xe_guc_capture.c   |  83 ++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 141 +++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_log.h       |  12 ++-
>>   drivers/gpu/drm/xe/xe_guc_log_types.h |  15 +++
>>   5 files changed, 268 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
>>
...
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..23512870503c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,9 +9,47 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_map.h"
>>   #include "xe_module.h"
>>   
>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE      CRASH_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE      DEBUG_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE    CAPTURE_BUFFER_SIZE
>> +
>> +#define GUC_LOG_CALC_UNIT(size)                (((size) % SZ_1M) == 0 ? SZ_1M : SZ_4K)
>> +#define GUC_LOG_CALC_FLAG(size)                (((size) % SZ_1M) == 0 ? GUC_LOG_LOG_ALLOC_UNITS : 0)
>> +
>> +/* Size is +1 unit */
>> +#define GUC_LOG_CALC_COUNT(size)       ((size) / GUC_LOG_CALC_UNIT(size) - 1)
>> +
>> +static const struct xe_log_sizes_type log_sizes[GUC_LOG_BUFFER_TYPE_MAX] = {
>>
> alan: i believe you are still not getting me, apologies for not explaining
> clearer, I dont believe you need "xe_log_sizes_type" at all, i dont believe
> you need this log_sizes at all, all you need is for the function
> xe_guc_log_section_size_capture to return either CRASH_BUFFER_SIZE or
> DEBUG_BUFFER_SIZE or CAPTURE_BUFFER_SIZE based on the type. Even if you want
> a static lookup table it might only need to be as simple as:
> 
> size_t guc_region_sizes[GUC_LOG_BUFFER_TYPE_MAX] = {CRASH_BUFFER_SIZE, DEBUG_BUFFER_SIZE, CAPTURE_BUFFER_SIZE};
> 
> That said, you dont even need any of the #defines above for GUC_LOG_DEFAULT_*_SIZE,
> GUC_LOG_CALC_UNIT/FLAG/COUNT, GUC_LOG_COUNT. You are overbloating this patch unnecessarily
> because you keep pulling in i915 code that was used for the init time dynamic calculation
> of region sizes. None of this is requred. I dont see you even using any of other info
> besides size which is bascically CRASH/DEBUG/CAPTURE_BUFFER_SIZE
> 
Thanks for provide more description. Yes, as we moved from dynamic to 
static, all of those defines no longer needed. Put into a structure is 
not needed. Sounds like for C compiler, even all info within the 
structure is constant, the compiler still dont treat the structure 
itself is a constant. Which doesn't optimized out equal to your suggestion:
size_t guc_region_sizes[GUC_LOG_BUFFER_TYPE_MAX] = {CRASH_BUFFER_SIZE, 
DEBUG_BUFFER_SIZE, CAPTURE_BUFFER_SIZE};

I will remove all defines and structures and switch to your suggestion 
in next rev.

>> +       {
>> +               GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
>> +               GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE),
>> +               GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE),
>> +               GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE)
>> +       },
>> +       {
>> +               GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
>> +               GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE),
>> +               GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE),
>> +               GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE)
>> +       },
>> +       {
>> +               GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
>> +               GUC_LOG_CALC_UNIT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE),
>> +               GUC_LOG_CALC_COUNT(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE),
>> +               GUC_LOG_CALC_FLAG(GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE)
>> +       }
>> +};
>> +
>> +static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
>> +{
>> +       return container_of(log, struct xe_guc, log);
>> +}
>> +
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
>>   {
>> @@ -80,7 +118,8 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   int xe_guc_log_init(struct xe_guc_log *log)
>>   {
>>          struct xe_device *xe = log_to_xe(log);
>> -       struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>> +       struct xe_gt *gt = log_to_gt(log);
>> +       struct xe_tile *tile = gt_to_tile(gt);
>>          struct xe_bo *bo;
>>   
>>          bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>> @@ -96,3 +135,103 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>          return 0;
>>   }
>> +
>> +static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>> +{
>> +       return log_sizes[GUC_LOG_BUFFER_CRASH_DUMP].bytes;
>> +}
>> +
>> +static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>> +{
>> +       return log_sizes[GUC_LOG_BUFFER_DEBUG].bytes;
>> +}
>> +
>> +/**
>> + * xe_guc_log_section_size_capture - Get capture buffer size in log sections.
>> + * @log: The log object.
>> + *
>> + * This function will return the capture buffer size in log sections.
>> + *
>> + * Return: capture buffer size.
>> + */
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> +{
>> +       return log_sizes[GUC_LOG_BUFFER_CAPTURE].bytes;
>> +}
>> +
>> +/**
>> + * xe_guc_check_log_buf_overflow - Check if log buffer overflowed
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + * @full_cnt: The count of buffer full
>> + *
>> + * This function will check count of buffer full against previous, mismatch
>> + * indicate overflowed.
>> + * Update the sampled_overflow counter, if the 4 bit counter overflowed, add
>> + * up 16 to correct the value.
>> + *
>> + * Return: True if overflowed.
>> + */
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
>> +                                  unsigned int full_cnt)
>> +{
> alan: I dont see you using this function at all. This function along with the "stats"
> sub-structure you added into 'struct xe_guc_log" right at the bottom are both
> only used in the extraction patch so these should be in that other patch.
Sure, will do
>> +       unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
>> +       bool overflow = false;
>> +
>> +       if (full_cnt != prev_full_cnt) {
>> +               overflow = true;
>> +
>> +               log->stats[type].overflow = full_cnt;
>> +               log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
>> +
>> +               if (full_cnt < prev_full_cnt) {
>> +                       /* buffer_full_cnt is a 4 bit counter */
>> +                       log->stats[type].sampled_overflow += 16;
>> +               }
>> +               xe_gt_notice(log_to_gt(log), "log buffer overflow\n");
>> +       }
>> +
>> +       return overflow;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * Return: buffer size.
>> + */
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       switch (type) {
>> +       case GUC_LOG_BUFFER_CRASH_DUMP:
>> +               return xe_guc_log_section_size_crash(log);
>> +       case GUC_LOG_BUFFER_DEBUG:
>> +               return xe_guc_log_section_size_debug(log);
>> +       case GUC_LOG_BUFFER_CAPTURE:
>> +               return xe_guc_log_section_size_capture(log);
>> +       }
>> +       return 0;
>> +}
>> +
>> +/**
>> + * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>> + * @log: The log object.
>> + * @type: The log buffer type
>> + *
>> + * This function will return the offset in the log buffer for a type.
>> + * Return: buffer offset.
>> + */
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> +{
>> +       enum guc_log_buffer_type i;
>> +       u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>> +
>> +       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> +               if (i == type)
>> +                       break;
>> +               offset += xe_guc_get_log_buffer_size(log, i);
>> +       }
>> +
>> +       return offset;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 2d25ab28b4b3..1d3b123cebd3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_H_
>>   
>>   #include "xe_guc_log_types.h"
>> +#include "xe_guc_types.h"
>>   
>>   struct drm_printer;
>>   
>> @@ -17,7 +18,7 @@ struct drm_printer;
>>   #else
>>   #define CRASH_BUFFER_SIZE      SZ_8K
>>   #define DEBUG_BUFFER_SIZE      SZ_64K
>> -#define CAPTURE_BUFFER_SIZE    SZ_16K
>> +#define CAPTURE_BUFFER_SIZE    SZ_1M
>>   #endif
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -45,4 +46,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>          return log->level;
>>   }
>>   
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> +
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>> +                                  enum guc_log_buffer_type type,
>> +                                  unsigned int full_cnt);
>> +
>> +u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> index 125080d138a7..3da7d5262601 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -7,9 +7,18 @@
>>   #define _XE_GUC_LOG_TYPES_H_
>>   
>>   #include <linux/types.h>
>> +#include "abi/guc_log_abi.h"
>>   
>>   struct xe_bo;
>>   
>> +/** @sizes: Allocation settings */
>> +struct xe_log_sizes_type {
>>
>> +       u32 bytes;      /* Size in bytes */
>> +       u32 units;      /* GuC API units - 1MB or 4KB */
>> +       u32 count;      /* Number of API units */
>> +       u32 flag;       /* GuC API units flag */
>> +};
> alan: as mentioned above, you dont need this structure at all.
>> +
>>   /**
>>    * struct xe_guc_log - GuC log
>>    */
>> @@ -18,6 +27,12 @@ struct xe_guc_log {
>>          u32 level;
>>          /** @bo: XE BO for GuC log */
>>          struct xe_bo *bo;
>> +       /** @stats: logging related stats */
>> +       struct {
>> +               u32 sampled_overflow;
>> +               u32 overflow;
>> +               u32 flush;
>> +       } stats[GUC_LOG_BUFFER_TYPE_MAX];
> alan: as mentioned earlier, this "stats" structure along
> with function xe_guc_check_log_buf_overflow needs to be
> in the extraction patch.
>>   };
>>   
>>   #endif
> 
