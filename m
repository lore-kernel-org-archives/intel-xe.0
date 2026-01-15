Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDF0D4662F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 21:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964AD10E7C4;
	Thu, 15 Jan 2026 21:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrfxjbHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7D110E7C4
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 21:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768514008; x=1800050008;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=m2STH27EK/mkCPYd9pG4cmYNgPprwVQD3gujRoxpgQg=;
 b=PrfxjbHjTOl0tVMFbkvHU1blsN81n80PVyI4QGEMc49qdN5pvGn3G3c5
 XKdpN4Xd1R4nSSayDTVbMLo5Lu/+hhsPxR8tx8GHsfBn4KHR0kVSLy62Z
 bifealzr3uOzPNUVebazGqDyeI3pJ9X08iTP50sbR6LdMM8Xo8X5C49Qb
 gCUioeSOrtra/zOvfXZomFsexaHh8iB195L/RwtH/tkjb8rGTv4OIfhIa
 cyWsPuaOe/R0pA2UslZUf0Q3K3pUbLbCGz7gV75LHq1YY5rgdGC9BNSTL
 MIvREtRNgddEZlsImIuVKXGtzwYBvoMM2unawNtY7j8l3i7k9RBOU/rRd Q==;
X-CSE-ConnectionGUID: mdzb4HVrRWG77f/WmIc//g==
X-CSE-MsgGUID: tahrak8oRDe1EKRpVAiqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="57385650"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="57385650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 13:53:27 -0800
X-CSE-ConnectionGUID: f0Qc6KfeQQmJZz74jse5fA==
X-CSE-MsgGUID: lFLtt2/xRNye73S9D52oiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="236313072"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 13:53:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 13:53:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 13:53:26 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 13:53:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2+Wc+HQ/UzyhvfoFqYj2mdzsM357Rth4QFABLntLvcAxbZyrtPq9YkAvyLIYzZFgPvCQwJd/OGvcHQEG6s3GpOuARrQSR78ZHOMYM2NeK33kBI0m9tpfBA0LIPKXVXMjIYeBUpZGdX9PZBtNsrtTuokQbaeRb8tf2KGYE5ehrA3XIqZJ27LGarAR/YOYFtSvnrK/s3lNLVvSD6QEXfsZa8V5IosdyD/jwKzaNJ2oYViK8HaGa+YnLLvl/Vl39/D2FV70NMb69Gt544+B51IHiLXFVUXvA8n8j3sxYoIcSdSKg+Y0tOlzFO0PcnMVWhvv/l9lHHb6/66Ny82gRHw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBpRZPtnQXRdDgv87iAnqYl+0ZOB6E/SSq6e6T8irPc=;
 b=bLYbE/+cP/iDhgQI6Oj1C3pIY38jwEGMHQ1ntjZo0AvsVJyXnsFwXtYlfPnm2G9iUOOVnhTqHr44Ry3wJBjmGBP+jcSo00cc8giWZHlG0aRN4pQGFaplcBbiMOhyUa9addWQeg+M4IKqk55hgQDkwWcbUUuSfKEJywI9ZYhUdvGRoDaw/wP2Cg3RUZRNRXTW0PdAgNb+zk++Q6XvENatJcyUw7hRrx4DzRy+o+pARjyvPStjFqvP07bKnAKj3NGPxAYRIrA3OgodgIWHAsMdwk07cfBHpmJBJipId/6oQ77DhDZHRlTncqHypwHWf/ay+V+nHOxneENZG6QWOSo/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 21:53:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:53:20 +0000
Message-ID: <f77d816a-f76e-4bc9-b89e-244a4fe5cc2d@intel.com>
Date: Thu, 15 Jan 2026 22:53:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251128123843.2763356-2-naresh.kumar.g@intel.com>
 <20251128171030.2774942-4-naresh.kumar.g@intel.com>
 <20251128171030.2774942-5-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251128171030.2774942-5-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: b82262a0-7256-4945-2610-08de54807f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDcybFRIQytZMFIxeCs5ZVNqTnJZTExFQkNheXZ1N2FkSlFHV3dBTkh4S3hW?=
 =?utf-8?B?Y0xyR3VSVEZtQW1kNXZrb2VHMkk0OGRwbVhUYWI4T3pIQmQ1cEhFRktRaG1Z?=
 =?utf-8?B?MS9oMThFbjMza2FHa1FDc1NmcWYwdUQ3aGJ1MnpsaW9EQXBLc1ljYWN6MDFB?=
 =?utf-8?B?NjRiMEl4MTVPMWdGUWhQQ0R2ZHVvclcrZk5UbjMyRHh6cC9xcHR5UHQ2bklB?=
 =?utf-8?B?eG04bTFiSUs1UEZmMFlnWDVsdTM5RFZzZzlYTnI4VFBoVkRGUUMyM2dSUEhZ?=
 =?utf-8?B?cTZzM1FLVjdwdURpMXllRTZYSy95KzQ2WVJ5TXRYMHNRazVRYmhIOHF6Z3Nu?=
 =?utf-8?B?N0h2VW9rTEYzOXhEL1VIbW9KVTZqRmVRdVlaWkY2Mnl4UDdqZHBVK21qS2Er?=
 =?utf-8?B?Z1V2OTg2VUp4dzkwbVBCcVArS3NYa05XYUhsVy9GTlF2ZkR1VE1BeDJXdlF2?=
 =?utf-8?B?RzV2TjBHekZOMzM0elRzWjZLcGw5RTBsYnArVEw0aVNldm9UVHgvYkNOVHJS?=
 =?utf-8?B?Z1VxSVpNSG4raFl6bS94cWVScXQ1eWZ4RHlVZ0o3UDlSNXE3VTgvd0l4NVor?=
 =?utf-8?B?cjlxVFRPTGQrQi9lZHkrNVAwWUxrbXBPTHZzNGx3WHJmVFVaSWpRNDFXYUJa?=
 =?utf-8?B?Y3BsOTVGYkV5eS9xVFdWdXpsMXltT0FMQ2MvVEFRaWhHUysybS9MSzVSNzNK?=
 =?utf-8?B?Nlh6RHdpNWtHQnRFVEZVaVZnWm1vM0IxamdHYzBOTUxiMUVvalhlTmpadmk2?=
 =?utf-8?B?eVNmQXZDU1pua1drcm85VFBybE1LTFpXUER4eW0xaWNxTkJuaFZkM3pWRlVw?=
 =?utf-8?B?MnFVWTNSbml4bVVnemU5RlR3VmdMNkZoeUNaMGE2UU0zWHpCbkJqVGtydHc3?=
 =?utf-8?B?RWZ0dGovUWk4V0labTVvOFdaK3ZTaWcrL01DTU1QR2JhSG9QL2syNnBCa2NN?=
 =?utf-8?B?MW1JWjZBOU1vRDIzeEM4VDRzaFVTOFkwVVFndUdFMU5STnI5WWd4VENnQmhS?=
 =?utf-8?B?WFNlTHltdmM1ZXNGQ2FiS3BoVHFQcDAwQ0pMeDZLT1Qra05LT29LZmNTT2VO?=
 =?utf-8?B?K205eTZUVGdOcFQ3aUxpaTZuWEtwc0hyRHd4YTV4T1g4Y09xUldBTGNTdC80?=
 =?utf-8?B?bFlZTjZ4V0pjSXV3amwyMVMxQ3pwL2I2dDNPb1FWaVFkeHZtNVh4T3pJNmpF?=
 =?utf-8?B?YksrWVltV05vV2QxN05PajZpVkNuS1c5UmlmMVRiZTg3Sy9jV2pIanl3UWlK?=
 =?utf-8?B?TmhkKzNpRHVNNUZNQ3UvdUUvYllXalBTV1doeGR6a1RQN0tkVlVFVWIyZ241?=
 =?utf-8?B?dnp1WjZsQjYyNVdBemNLYkc3bjFDV0l3aEp4dEZJNHlWMGR1OHg1NVczV0pO?=
 =?utf-8?B?dFR1VDQ4OUZiVW1hWHhBZHU5WjRzWWNnU1BXUzNxdEo5bnZsWGFlbjRqakIw?=
 =?utf-8?B?WS95VEhkRkRNVDZ0Y2p3Zk95SmYwdUt3cm1aTWtnaWtFZkhEN0kvb3NHRlpn?=
 =?utf-8?B?YStDOXZuc0pxdkFxd3JwdHNlbnhvc0xwTXBQeFNkKzBTbnBvRTRGY0FxOTVW?=
 =?utf-8?B?N1QzYjFaeHR6dHZMS1Q0bVZUeUMvTUsvam82QWQ5V1Y5UnlGMmdRWHlHb2VM?=
 =?utf-8?B?bWY1em5xK2Ftb21SMWxvclBvOGpVKzAvRG1CUnpRTVNnbnlQTUVUWjRZWGN6?=
 =?utf-8?B?THJkc2UyRC96dkZYcXd4bjZLdXRWam54UTUwaXVrYlBJbUZybUpnWit4N1c4?=
 =?utf-8?B?Z1ZxeEpBUHZiMUtrYzNhQzMwMVFZaGIwOEh6K0tuc3lzQmFhV2xremlIdlFF?=
 =?utf-8?B?UlhUNFd6N3JKb0xsRU9BeWV0ZmJEQStCOG9GdlFWOVpaNmE1U0p6NTBUWkh3?=
 =?utf-8?B?eTVEREt1MlR1ZzJhY0dVUmptb29mMUR6K3ZMN1NnWHorMG5MTFJ4Wi9abFdW?=
 =?utf-8?B?eEhuRnlGQmJ6Qm9GNzZzUE9pQTd1MjlSZ3lNbEgwTHM1WVVmVTh3WUVPVXFC?=
 =?utf-8?B?bVpHYU5pL0ttOHhzQjU1bDlVMkErZUF5aFRPL0hwMFZGWDRUZkd4QkJpTkpN?=
 =?utf-8?B?MjZlNjdFekNzR3FWVGdLODBkVitaUjQ0MEsxWFU4dTF6Vkpob0N0d0hoL2xi?=
 =?utf-8?Q?rKw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1JZbzFySG12Mm56NWp1cmdWU2VueVI5dmJyUXRTVTk0eEd2N2l5S0F6bW9M?=
 =?utf-8?B?eFJ6cTJVRnFGMEpWcmM0dUIzU3huVFFzUVhYR0Nlb1puV2s3eUhLUUtTYXk0?=
 =?utf-8?B?N010SG5LZWFUNG11WTNRUDAxV1pQNkpvaWd3d0xhMml3eXZzSXZ2dzNTWlkz?=
 =?utf-8?B?NHBXRGJ0UGRUV1ZBQ0tDZmJvejJyYmlBZ3pnbkduMU41TTRsbStvNFJDMDZK?=
 =?utf-8?B?Nzh6VFl3YlVsQiswOVA3YVZMMVFieFlLL0gvZWV5MzJmTkI0T2puVzYvL2dT?=
 =?utf-8?B?WjlJS09lcHJIRWUvWm5UYjhHZVhDMmZPcVNHMmFKaXFGSnhTOVVzM3A5NDdq?=
 =?utf-8?B?Z3dac1VDaXh3Ny9iMDBSb1lNRVZyYkM5OWRIVkxXRGZBNnNWSWhKMDNGLzZI?=
 =?utf-8?B?c05iNk81a25wU2ZCUkdIWVZ3d1RsaTR0NHl6SHM2dmpNWUlqbmlVZWRwQUhP?=
 =?utf-8?B?R2ptOURrbXRYVnkyamJQWFh1WURxNkNWanl0amVwMEpzZ25Ka3d1SmoxNDVP?=
 =?utf-8?B?SjB2UzFzOHkxYkNhNEQxUXI4QTVFZDN5WEZOSmVTbGd2cVBJbldqZ214aUhz?=
 =?utf-8?B?UjhFdS9Pc25BWUtFVlVValBPdm1rYVVKRTNVQ0VmK1plTFJ6SHlJUWsyclVG?=
 =?utf-8?B?ak5YTHA2WTE0WDljZm1XZzlKN3NDYjRrMUhxUzlXN09WL05SeHVCTXREQ1U0?=
 =?utf-8?B?eTl6bzlpUDlWV1ZMZ1RhTHR1K1l0R1hlNkY5TXZId0ErRXYyWkhOdkRHZGI5?=
 =?utf-8?B?RHZRZnJLTmMyUFFObXVPUXNoTXplSjVSS3FvVEl3US9UMFcyRU11VTc5K0Fy?=
 =?utf-8?B?dmk5a29hUmQzc203b015YXFXVXJXWXNtdlc3T2dXeGUvZlMwb2l3V2F0cVph?=
 =?utf-8?B?Q3hyemF6dUdHQ3RZZHZ5Y1FzNGlXV0lTbG81Um4veFo5OW8wYURRMG9JQTU1?=
 =?utf-8?B?Z0Rna0x5U21wWXNLeFExb1FmRjBJYWpSTUVYT0t3MUpxSnU2djFQRHpvQmRV?=
 =?utf-8?B?dVFUcjIxYlFrUjRTcmxRdXIxQWlzbGhmbDJPeXdGekVXelhpTituZ0xEMGxP?=
 =?utf-8?B?c2xaR3REQmxrNHhoREVlQTBpZVdSRndyUlJQWGlMNWJwaWxTdlhIeUVzam9W?=
 =?utf-8?B?TkxNL1U5bG5TTjVjNldLWXFSV3k4enFHUS9DZFJvTiszbW5IR0FRMmM2WFc1?=
 =?utf-8?B?Ly81U1piV1YvSUFDcldrZ3I5c3UwYk0vVzMxekRXR05yYjNtRnd2ck5IbTBj?=
 =?utf-8?B?WDZhakliSjZsZnRGQWRmYi9aUURFMjA2SDhPQy9meU9WK3QzTkNsV3IxUlpj?=
 =?utf-8?B?MUwzNE5GTGIra3FzYnpEYjB6UTVqaDQ5bUw4SnBhOU42V29WMW9pZmp3bmlN?=
 =?utf-8?B?L2xUait4NDFKVEtRWW5IRVZyaWxaQzdNVEVNbWVzWWZSOXgyMGx0bnF4aGY3?=
 =?utf-8?B?bzhIL1d0cFZnMUR6RXlONFVQamdHN1plOXRlSHpBcmJWK1MzUDJQNWZhZU5R?=
 =?utf-8?B?dGZhNSt5OUQxOUx1cVRINzRpMDR6cjRsSkwwV2lNbHJJZ2VsWGJYQWtSOHdT?=
 =?utf-8?B?Vld3T2d2QWhWRitoMkhVSklkZDg2cXNYRlV0SDZnbnFLYk5WOHR1N3h2UzdG?=
 =?utf-8?B?RkdHVXJFbForeUtDWEpDM2tPc2NmZi9vdFhZVE81VDl4TlRpU3Z1emJSTTdh?=
 =?utf-8?B?RXpuSlcwWGhSS1ZJMXFpTkJZek02ZmxHQUhXTm1qL3dvMXJRNzBoY3lhT2pz?=
 =?utf-8?B?OGhrWjhTRTlXUTlMb0h2WkFiRXZURHBGNnoveTczT1M0MDJCbGpsMGF2MWZ4?=
 =?utf-8?B?V1hYMGFBMjhDYW5IejFwMUcrV0ZUZGpUeEN6VkxOd2NGblFVZ0M0bVcvNFFo?=
 =?utf-8?B?UHFiU1JZN0d1UlQvd1haTFdZTVpOUXJYV2tlVGo4QldpQU5TSjlHYnAxaVNJ?=
 =?utf-8?B?elR5d05kbm5xUVhDaTgzSW0vS0hrdWZsZnpONmlqdFpaTXA2UUM4aldmdnlM?=
 =?utf-8?B?VUZXUlhCUXJ3em1zYnc5bnBlaFNnSCtjanh4L0NhVmhtcCtROWI1b0IwdGxz?=
 =?utf-8?B?dW9CTGlrTzdlNjdZS3hIZWxSMXludCtNcnlDSnBCRmYycTNxN0VRWG42Z3dZ?=
 =?utf-8?B?cWVvOWpURWJ4dlZlOUZ5M2N0RFcxTXZyVjNXZ0JEL0hjU1VobWxBc3RSYnhj?=
 =?utf-8?B?REdXdktWODgxQUozVmg4aEhsV2ZsRlhMTWEyTW1TZGQ5VTZFK3AwZGlxSFo0?=
 =?utf-8?B?L2U1THR4dzFFSU5RY0xCTThkbVNVeFVYVEp5b2xFOFoxazJwZ1J2ZTlHc085?=
 =?utf-8?B?MkN3WG9mQTV5Rm9PN1piTG53RFgycHRjZ25jOXAzbkJ5Y2pLZjNuUEwvTUhX?=
 =?utf-8?Q?BVAHA7Ajfip+GsBo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b82262a0-7256-4945-2610-08de54807f2c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:53:20.5863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQY0KI/1flqVpljhhloLwraW438XzbzPTeDygj3XHxn4K+gTUxqil4PbL8xkXRcEAA7bgdDSA/+vvWYkqpWli8Tv9PQvwakvYd+EAYtaVi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
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



On 11/28/2025 6:10 PM, Nareshkumar Gollakoti wrote:
> Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
> CCS mode changes
> 
> Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

changing CCS mode from the VF never worked and since CCS config is fixed in case of SRIOV, there should be no users that would like to read it back, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..e146e00b0ca2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	if (!xe_gt_ccs_mode_enabled(gt))
> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>  		return 0;
>  
>  	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);

