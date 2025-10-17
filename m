Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B53CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAAE10EC57;
	Fri, 17 Oct 2025 15:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBpL8/pM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F5410EC57
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760714210; x=1792250210;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gHd8VMccmuwjvKE9/AdxWGKomUWZPh+TDkxsSU+p7gM=;
 b=DBpL8/pMKuUbWxOmDqLBkagarGRDfgChG+EwVnmYIfCpP7SqchPYEIil
 HIHWif4rIfFsDKZcqJqSMUifmn+PN7cDZLadL1vFtOjn0C8tfqWnjYvB9
 ulL/GeOPPWWR+DJyrwAmxg0WPJN1mal8PyfZeXGDJRh9TbGrOrZeQTiYf
 siXJfH3XC4q+d54Ws14VdZrUmf7r8yv11Lr/fsDZys5pld0tsEh9+RGPr
 3PlKRcWayFaANaBJc/UTX0Oij2DnJOpkZQCsBiPYkQUT0KEEdv0taHG1n
 d+HVj5x4Or8JnVq3WWKs88Z8ryIAu0l1JIqBrobWXF9Ywa3GRGvE/rdpS A==;
X-CSE-ConnectionGUID: G8OajSQ/TU6/r4+9vcuWVw==
X-CSE-MsgGUID: j8+RNicNQm6GrgbkpgI6Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="65542928"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="65542928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:16:49 -0700
X-CSE-ConnectionGUID: KXQ1ObixTrKiSgVQ4AfLyw==
X-CSE-MsgGUID: NYXNwGIPQZCyGm415uSXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="181894366"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:16:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:16:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 08:16:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlS97fyDNNBeYHgjC3T+Wy3EtJXpn5xL5QRe+t+gg4iGgaX27SJ9Sd84CN9ikRcNI/0U9sE5HIUFIaeKvTUnWqVlcUuU/nqblLvi9rUZqcB8nLbko8NaKpZi70u32En5g4tsCFA+U9N/Qo3xefr/+e3csJCzaIIlM0iVH20lsXv8wnmoCR6KhMo+Cn+t5mtd8pKlsmJwkDssY98wcvNnoz7IJUzJZkAjQ74vN/5QW37MvCgoH/GxS6AMl/2H3K5A623PMTgQTNwKchIkjeGmAfFEzfmhw4YQkYdQ6an8n1FF6EcOYJVaXEZI1t8KxrUOHO4uhi4V4pq1uQPcJXLbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAOrmd/MzYZwUM4VVWZHLOCwZVZdi7NPHovSMny2/bg=;
 b=n+ToE0+SJ+ULDdcn0c1jhiWvWPoYKPPLsXpw5nvTjm0YI5xEMS7zDD1aaYUpV6eJUDPk+RzRRYF+6lpVm+BkF2sFxS88rcuCAWXJRml3/hI+uhHpUfraBtdxMnwH/CR82pSGtP3v69+IlJ6oVsue3HuXCDrdbyLPCVBhRadYXUaUrSckxQK2oX8NnieBtJZ/sL7mNHZh9XO9dgH4KPPkxIBqf76ExsTeQz4bIHxIhYEijp84GlEb4FD6HXNF7qQ1HAVvraIK2f6ejr04PzgCGGv8RrdetWTNHhsR4sO/6ShWJuBJR2Gsb6tEiWOKLzQGYo9t1SpaLd0ueUPGZXirnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by LV8PR11MB8487.namprd11.prod.outlook.com (2603:10b6:408:1ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 15:16:46 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 15:16:45 +0000
Message-ID: <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
Date: Fri, 17 Oct 2025 20:46:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aPJSNo8XM3cpGZCb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|LV8PR11MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ca29aa-e247-4a4c-fa5d-08de0d902f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0E1cE5FMHJqQ2YwaXlOUlEvV0hrdDNTeFhYMklqTGc0MG1rSFZzVkJ0Y2dy?=
 =?utf-8?B?bW1mTmRJcGJhb3Q1d3RDWUNmQ1hRSGc0Qm1PZk5ySEx0ZFRmc25DbzB3MnQx?=
 =?utf-8?B?WHd5WENMOXpPYmx1ZkJqYXRSUnNhd2hJRDdaTHNpb0dOYS9iNGMyc2Vsdm42?=
 =?utf-8?B?aGZEeENCQkFxOGl2dEVBZTU4MmRDbGM1M0hSd0lJNnhQWklnYk1DcVNPN0p2?=
 =?utf-8?B?NkdEWGNwT2NQOEh4ZmY1a0VQUmpKbzJEWG84VjRjSFZyY0k3WHBzamZ6VWZo?=
 =?utf-8?B?Y3FBTmU0U0lka2JnQWVjd29iT3Jrb3VpeWM2ODhYSEFWblYrakJ1cEpFL2Rk?=
 =?utf-8?B?VDZVdFFoZHJQc1VVSG8rNG9YZmxpUDhBRVViZ0VUOTdnZlJBM1FsYVZqU2hW?=
 =?utf-8?B?NVhtWlZuM2grdWczTm1nRG5nRGVLODZNUllyVHo1Vjc4bG03YmsvTUVMclJl?=
 =?utf-8?B?bTlUcDRPS1BTTzI1RzBwU2t0ZlBaSVFydHhqQUpuNWtMVDdwcDFXVHJjSXR0?=
 =?utf-8?B?M1VDVDg4MkFvZ281MW1WV3kzdTZLK3MvQUhha1dMRHJydVFySDJIYjRscFBz?=
 =?utf-8?B?cVdqUkxrV1B2Z1BOWEZ1S3FMeUxvUEdoK2pLeFhIMjVVQ3BhTnBFUGxFV1V5?=
 =?utf-8?B?RXVWNkNZcU5ZSkhFNDE3eHowaDdtd01nS1ZpcldneU9CUUFYRXhrSktiT1I2?=
 =?utf-8?B?UFJXQ3RFN0N2QzlFeXZuQVNVcTJtaU1NK082ZHNxYWtGbjNGeExkakl0RkRr?=
 =?utf-8?B?dHdRbzhKNG1KTElOakYxNVMvY1YzaDdnb0UvelBRNGZNbEh0SjZLS3QrYkFv?=
 =?utf-8?B?NlZTNUszYitVMFlSdGpqcnRlU3hpRFJGREFCa0JsbFlyeEdQVGZyaFlpb3Uw?=
 =?utf-8?B?QmtNb2p0VzBacndtU1ZMdHFJeWk4K0NGY2JFN1dZUVRBc0V4TzZ1RTUvYUtV?=
 =?utf-8?B?bXVldno4alIyVDFqRkM2T3NVa1R3d3RqWVFyT2dPRy9aSGl6SGZpSUhHYzF1?=
 =?utf-8?B?UUtjMkNGd25wbXh3clVxd2toalJiOXhtWDlJby9NVmdNSkc2ekNJV2FTTU5o?=
 =?utf-8?B?S2l0T242Ym5BV24rNS9WSllKa1JyT0dLeUMvNzJMektKS0ZCcGp6VzVmdUND?=
 =?utf-8?B?YzduTzJKOFE4RVo0Sk5GZWgrbloyakpLckVmelArc2dSeXBIemdOZ0d3YmZD?=
 =?utf-8?B?b2ZSQUxiOTBDNnNMRUVwQll4RTAvY08zWWZFdTduM1VNeDloOVk3akxRcWNX?=
 =?utf-8?B?cHU5THBxditNZzlCRmJmRVRqZ0x2aVo3ZjlxODI2RGhHM2pFRmp6NlZGdnZK?=
 =?utf-8?B?WTF1RjRXR2UweTFrc0JnZVFmWmtMcmtZd1VZZDEvNi9IN3lzZmpyUXllOVVX?=
 =?utf-8?B?Ympoa3Q4ME1uNWI2eFJnSCt0NjFGUDQ0SlhtUnlVMFlpcktmcjlYMDFCdTNv?=
 =?utf-8?B?Mld0SktuSklCTkV1dnFZOTdzR042YmpBa3NpS1p5S0Z3dFdjNmtsM282RFpU?=
 =?utf-8?B?SjlVWEtLZ1k4ZmZTcElONmpOVTJRSFpLL2JVK2xsdndLM29YZ2RaQm9VNjdT?=
 =?utf-8?B?T3l4QTVFdldzRlpIcG9WSWZuUjYxMmNXM3hUczNXQlU3UW9nN2pFUnFlbGkx?=
 =?utf-8?B?T0pkaVdYcHJIMkpEdThmMEVSWTQ1NmNoajJFbGdDWFRwSEFQTU1jZVRzZVE5?=
 =?utf-8?B?V0FXaWduY1U1elc3cGg5aUdOaXlWY2pQY0g5RTRQdW9veWJGcDNUcDY4Q3B4?=
 =?utf-8?B?UGVpQXREZTVJQVZpbGw2UGZ3NEpoa2FKRDA3eUNsZ1VicEk5MXJ2REFKaGFH?=
 =?utf-8?B?VW1VUTV2K1hrdExDWjR4a2tkRmxvbmNtMy8vVVQxTjhhWHduWGU4VFE4dnJM?=
 =?utf-8?B?eWt3V25QS2crMmhxRXllZnRXRmFMK1piYzRsYnNlY0RpNXB1SEtNNjc4YkFW?=
 =?utf-8?Q?1fRWxMbVrshyTINqiwxNyNPTuUNJThDk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1grWlROUE5qQVFiMnpHN005L1NaY2hOekVwS0ZkRW53amFQaXRqblBUeHVi?=
 =?utf-8?B?Nk5UYm1VZVhtaUFDT3h1eWRESStsQmxDVTBKdjdvak1VYTRRWldGVW9QaEVu?=
 =?utf-8?B?YTdoOG9TNHRvdzBDbUdpbWdraTlucmhRekdXNEthWitQR3QxRGtDUUFoelRB?=
 =?utf-8?B?Z1JZaDJLeXo3ZGNib000elQwcWdpZmM5ZmpMWlZtaGlxMmJTK0c1QTZlaFVp?=
 =?utf-8?B?WFJOekxqbm5MY0oyTDZwWkY3QUtYWmJXS3Foam83ZkpOWVQxSUlya1lxd01i?=
 =?utf-8?B?cGMyaEJDQmNlb0tKWkg1N1Jwdzdja2huWk1vZm9YUnBSeFZGcEg2OVkzb1lS?=
 =?utf-8?B?S2VpNXlnU1QzNy8zWkNlbmswaUhoZkphYkRnVDBMeUlOUzdjWFlDQXFkU1lm?=
 =?utf-8?B?TW81QXZsZG1sMGIrOEpMRFJ0RkVaaXEya0NoNWFYQmpUYWhTNmVhR2VQR0l5?=
 =?utf-8?B?dzNSSzl0blZPeEx6ajdjOUxlbVRMZm5Ha3J6aGRZQnhrNktRaE81YnVLb1Q4?=
 =?utf-8?B?N1ozRUorL1ozUGxreWxiZHlTV3A0dUtvVVM4ZU5hMEdvTys1TmNucVNWVWRZ?=
 =?utf-8?B?S0RqYms4N0lYUnJnOXRsb2g3aGdvbStaTmFFRzBJOGNxM2JjVU8ySU1XTXZW?=
 =?utf-8?B?Qy9jd013ZWZqS0dZc0tMTFg3WEIzZGQ2amN1aXBoNjk1NzA1eTlCVDNoelBm?=
 =?utf-8?B?Yi80VDNBK1k2d2FGSE0vWjNzcThrdEZvNWlZRjByV1c2QWF4eVpzQXVvbnl0?=
 =?utf-8?B?Y29wUWpoL3AvNDZWbW5kUTZpdVJ1VE9LNUtUSGNqTHhXa29wTTZ2Ry9IS1Fr?=
 =?utf-8?B?Q1VvYW5UK1d6VSs5d05ha2ZuUnlJbzNIcUNXQkhHTkVIWXBBSEVDL3RQT3l1?=
 =?utf-8?B?NERLbWVLODBkNGdvekdKM2NCS1BsakU2MDgzOEVXMEpqem9UUUhXQlZLbGxI?=
 =?utf-8?B?cWFQbHNMaStwQ0tlMFFwTkVyYjFEZGI2N3U2cXVzR20yalFBN0lRQy9uTk9R?=
 =?utf-8?B?dW1KNGhkdDR5Rm1tSDFkRnAxbDZDVUFrc1BCaHRxb1J6TlppWHJRRXU0QTgw?=
 =?utf-8?B?MmUwdHdVckRUY1FZTUhJcTRSMUYybjRsazFGbHlBM2JCT2U1SWh3VEppMnp2?=
 =?utf-8?B?YStYQy9hY1RFTW5pWnhBN2Y0alVMS0NEYnlhTGJiSGUvRGhOazUvbVBMbGVM?=
 =?utf-8?B?dEdQVCtza21KNzVkZnZQaGl5bmh1SFlCNktNQU5uMUtNMDVucDFvK0p4Kzd3?=
 =?utf-8?B?M1NzeC9JV1ZCTWorVDVBdVdWY21JVVhMd2RhV0dRMjdHcXh6MDE3ZkZBUWdx?=
 =?utf-8?B?UmpBOXVhMFVZZzJBZmlReWo3RGEvTjdWeFVtT2NsZVZmaTg0RERZTTNwT2RT?=
 =?utf-8?B?ZmZ5VDAydU9SUkhDNWVsZUFudEFZVTR4MzJBZlRXOEk3bXpJLy9aQ0E1aXdL?=
 =?utf-8?B?a0RhNmhrai9JSDYxV21uUTB4eU5IeHdpSkg5VGVhdDhoMnp1UW0zRmRkS0Vy?=
 =?utf-8?B?UUo1Z1V1UW5ydGtpL2dwcHVtUVk3Q2J3RzZTNVQrT3d0aE54UDczV0plam5t?=
 =?utf-8?B?bWoyLzJSZFpJVEprSGllalNSK3pGdTAxelNEWitpVDJvdzgzbElDL0RrVUVW?=
 =?utf-8?B?M0ZOY0VreTIrSHVpU3BDWlVLZGRrK3ppcjJWTHNpRDBGVlpZeVplaG5NVkds?=
 =?utf-8?B?ekVnVmxDZWlCRStvV2pvaW9LNHQ1elFVS2tzcFN5bWdqUUhxTVVmTVZpaFVQ?=
 =?utf-8?B?eUNZNHA4SE9sL0M1UklxZG9IdzVyTjRTby9OVmpObHpqaGpRZWs3SmVUS3R4?=
 =?utf-8?B?VEQ3NEhyd3Jkd1BFZnNYTndZSFIrcnZMQnMveWV2S3BGb2M2T0oyTSt5SGkv?=
 =?utf-8?B?bG9ScWhuQW8xR2ljdEhHaFBuQUk5dlZvOC9oc2JCb1JiSUUzTkpIVlRnQzZ4?=
 =?utf-8?B?OXNLVFRGWlo1TnBpOEV0V0JrOVRYZHRtQzlOV0h5Sm94UDZzejRMelBkMzVr?=
 =?utf-8?B?MDRoMUIxLzRYMHdHTGRYTEZyY3FlWTBZcm9CYUFPcEdUTG1iUUE0SENFUTZD?=
 =?utf-8?B?RWtua2tPWEEySnlOTWpqcFJYbnlqbUJhRHlvcXFyeEVqOUtrUnEyekFGam9a?=
 =?utf-8?B?cDQwVUhuTzFzdDREbm0zYjJuUUJCM0h5Mkw2RXBZVXphaWRCb3BtWHhPT3pF?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ca29aa-e247-4a4c-fa5d-08de0d902f4d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:16:45.8074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRzfKaG+biNCYQNsic3q+mszq4lamhDGywKVtqmIl6haA3leTl5gSQ2dJ2RgeqzbDY/oGRrFYgazh0vqrPnz+Ur6mpkdFdOAOQ0JrKBwvBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8487
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



On 17-10-2025 19:57, Ville Syrjälä wrote:
> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
>> save/restore while this sequence is being programmed, partial writes may
>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
>> instruction to write the sequence atomically.
> 
> If this whole thing is so racy why don't you always add a new
> BB_END after new commands, and only replace the previous BB_END
> with NOOP _after_ the new commands have been fully written?
> 
We maintain a suballocator for batch buffer management, with size 
proportional to system memory (e.g., 16MB suballocator for 8GB SMEM). 
Batch buffers are dynamically allocated from this pool based on the 
number of active workloads. The entire suballocator region is submitted 
to hardware for CCS metadata copy operations.

We cannot insert BB_END commands after each individual instruction 
sequence because additional GPU instructions may be appended later. 
Instead, a single BB_END marker is placed at the suballocator's end to 
terminate execution.

This patch ensures race-condition-safe CCS metadata save/restore 
operations by guaranteeing atomic writes to the batch buffer, preventing 
corruption regardless of when save/restore operations are triggered.

-Satya.>>
>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
>> 8 dwords instead of 5 dwords.
>>
>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
>> chunks.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>
>> ---
>> V6 -> V7:
>> - Added description explaining why to use assembly instructions for
>> atomicity.
>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
>> - Include <asm/cpufeature.h> though checkpatch complains. With
>> <linux/cpufeature.h> KUnit is throwing errors.
>>
>> V5 -> V6:
>> - Fixed review comments (Rodrigo)
>>
>> V4 -> V5:
>> - Fixed review comments. (Matt B)
>>
>> V3 -> V4:
>> - Fixed review comments. (Wajdeczko)
>> - Fix issues reported by patchworks.
>>
>> V2 -> V3:
>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
>>
>> V1 -> V2:
>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>>    (Auld, Matthew)
>>    - Fix issues reported by patchworks.
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
>>   1 file changed, 91 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 3112c966c67d..e0be7396a0ab 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -5,6 +5,8 @@
>>   
>>   #include "xe_migrate.h"
>>   
>> +#include <asm/fpu/api.h>
>> +#include <asm/cpufeature.h>
>>   #include <linux/bitfield.h>
>>   #include <linux/sizes.h>
>>   
>> @@ -33,6 +35,7 @@
>>   #include "xe_res_cursor.h"
>>   #include "xe_sa.h"
>>   #include "xe_sched_job.h"
>> +#include "xe_sriov_vf_ccs.h"
>>   #include "xe_sync.h"
>>   #include "xe_trace_bo.h"
>>   #include "xe_validation.h"
>> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
>>   	}
>>   }
>>   
>> -#define EMIT_COPY_CCS_DW 5
>> +/*
>> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
>> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
>> + * VF state/restore operations.
>> + *
>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
>> + * VF state save/restore operations. Since these operations can occur
>> + * asynchronously at any time, we must ensure GPU instructions in the batch
>> + * buffer are written atomically to prevent corruption from incomplete writes.
>> + *
>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
>> + * sections. This prevents vCPU preemption during instruction generation,
>> + * ensuring complete GPU commands are written to the batch buffer.
>> + */
>> +
>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
>> +{
>> +	xe_assert(xe, !IS_DGFX(xe));
>> +#ifdef CONFIG_X86
>> +	kernel_fpu_begin();
>> +	if (size == SZ_128) {
>> +		asm("vmovdqu (%0), %%xmm0\n"
>> +		    "vmovups %%xmm0,   (%1)\n"
>> +		    :: "r" (src), "r" (dst) : "memory");
>> +	} else if (size == SZ_256) {
>> +		asm("vmovdqu (%0), %%ymm0\n"
>> +		    "vmovups %%ymm0,   (%1)\n"
>> +		    :: "r" (src), "r" (dst) : "memory");
>> +	}
>> +	kernel_fpu_end();
>> +#endif
>> +}
>> +
>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
>> +{
>> +	u32 instr_size = size * BITS_PER_BYTE;
>> +
>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
>> +
>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
>> +	} else {
>> +		memcpy(dst, src, size);
>> +	}
>> +}
>> +
>> +#define EMIT_COPY_CCS_DW 8
>>   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>   			  u64 dst_ofs, bool dst_is_indirect,
>>   			  u64 src_ofs, bool src_is_indirect,
>>   			  u32 size)
>>   {
>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 *cs = bb->cs + bb->len;
>>   	u32 num_ccs_blks;
>>   	u32 num_pages;
>>   	u32 ccs_copy_size;
>>   	u32 mocs;
>> +	u32 i = 0;
>>   
>>   	if (GRAPHICS_VERx100(xe) >= 2000) {
>>   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>   	}
>>   
>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>> -		ccs_copy_size;
>> -	*cs++ = lower_32_bits(src_ofs);
>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
>> -	*cs++ = lower_32_bits(dst_ofs);
>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>> +		  ccs_copy_size;
>> +	dw[i++] = lower_32_bits(src_ofs);
>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
>> +	dw[i++] = lower_32_bits(dst_ofs);
>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>>   
>> +	/*
>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>> +	 * save/restore while this sequence is being issued, partial writes may trigger
>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
>> +	 * write the sequence atomically.
>> +	 */
>> +	emit_atomic(gt, cs, dw, sizeof(dw));
>> +	cs += EMIT_COPY_CCS_DW;
>>   	bb->len = cs - bb->cs;
>>   }
>>   
>> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>>   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>>   }
>>   
>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>> +/*
>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
>> + * save/restore while this sequence is being issued, partial writes may
>> + * trigger page faults when saving iGPU CCS metadata. Use
>> + * emit_atomic() to write the sequence atomically.
>> + */
>> +#define EMIT_FLUSH_INVALIDATE_DW 4
>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>>   {
>>   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
>> +
>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>> +		      MI_FLUSH_IMM_DW | flags;
>> +	dw[j++] = lower_32_bits(addr);
>> +	dw[j++] = upper_32_bits(addr);
>> +	dw[j++] = MI_NOOP;
>>   
>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>> -		  MI_FLUSH_IMM_DW | flags;
>> -	dw[i++] = lower_32_bits(addr);
>> -	dw[i++] = upper_32_bits(addr);
>> -	dw[i++] = MI_NOOP;
>> -	dw[i++] = MI_NOOP;
>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>>   
>> -	return i;
>> +	return i + j;
>>   }
>>   
>>   /**
>> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   	/* Calculate Batch buffer size */
>>   	batch_size = 0;
>>   	while (size) {
>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>   		u64 ccs_ofs, ccs_size;
>>   		u32 ccs_pt;
>>   
>> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   	 * sizes here again before copy command is emitted.
>>   	 */
>>   	while (size) {
>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>>   		u32 flush_flags = 0;
>>   		u64 ccs_ofs, ccs_size;
>>   		u32 ccs_pt;
>> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   
>>   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>   
>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>   						  src_L0_ofs, dst_is_pltt,
>>   						  src_L0, ccs_ofs, true);
>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>   
>>   		size -= src_L0;
>>   	}
>> -- 
>> 2.51.0
> 

