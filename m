Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8837C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 10:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91310EC4B;
	Thu, 16 May 2024 10:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJhrrDGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBB710EC4B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715854799; x=1747390799;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+UtiKIKRlCRqjMX4IVELCCsZZajyrv7xR1S77zDfrdo=;
 b=AJhrrDGx8a/qVMmWchZOCoqvYSHHuVjmFSMTJQKQPcKBWwvppn00zYdC
 twzrk0Xno6EWTgzqNkDI7j+AOZnTpCwL7Zkpx0m7/qTAtLDSvcp0irROR
 O0Ho7DEGp6u/msbeMg4AYNx47JAMzl1LfDILUYzokRlTPNHk91bfkDQBI
 6a4EVCzL42XqEGGTrU7bLFBGj1eD6N4lRxBEclmg6q7COOgMaIDVzv4OT
 6m25gbQVBi4rMHdNfiHi2zC9xD3BqugonBn1qGPnqZPG0ialq27f5D+4K
 222Ce5ogm2I9nQu9hoyGhhIuy5hOQSGhCswTCpl0IPhq2BF//3LCE1d90 A==;
X-CSE-ConnectionGUID: LNfwRQfjTI2MwW8DLCTrrA==
X-CSE-MsgGUID: jclCtFboTqS3YxjKCpK/jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11765706"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="11765706"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 03:19:58 -0700
X-CSE-ConnectionGUID: d/D2/YuPSQWcHo7h5wsxHQ==
X-CSE-MsgGUID: vBqMyCmpQweKWrbHrM/idA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="62218570"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 03:19:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 03:19:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 03:19:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 03:19:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOqVGRj8x4qtUdvqYyFmW9c7gAF3cgfh2VcDtmJlxnNkUGiXWqVkgGdSSGVoOHTJSyhLrC7P2kOzKBzm7+wjn6bPXV6WK4Z2S2/MfDwDANlhl/Fjkos/zvy5Yyc9BS0Oa0SftlXwpA9DZy0k4qWoZj1gsNBpOmPuhXZ2EVZK8xXCVOjS1ZZ9Ibi6qSY01XPpryy+JMoxTT6aYfjd4R4Q9ZWl5MxcVSkyG9DdS7xZUMOoghTHQ7EZVNnlxncRP+dtUkRtkeF39GLIQtFcLYKRrbuZQq+8+X8X8lXlv8nTE0ZoWY8gS/Yzm5/PH5uhZk3Pw8j6xyr2nVcORw7aztPugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME9iEXq87nJOTjyHTR4IQwcvTh+huUFxshFwFH/Hock=;
 b=UuHVD36/OlXjwB1Gxxd0u1ek/uHmSICWVBXMpFWUdLsNmspG1jIAo0AgdKZ9e6AFOPrcS4nMDyIjvn+pUDIZd74Qbt1ch4TMP8Pi+1e6CxwfbR0zaMy2IXpmo6GW9K/jhZhEwepcXMwbp+jIvatvwAj9hGx2HtB+Ye4DkyKzTNFoxRB2vIhF2avAYU7QrYzvIKHYjz8SgCzE/oFfd/iS0FTQp5iZni7FLFQT0C7enI3TfI+k1PvxiM4LxiiVbhFeE/mw0x0diWGxSyQtGIfZTfP8V8MOPRf/LPTTnFF8/7F5GOhS7dqJz+t9LOL2NKp1Z5JO91iXlt/TdG7V744n3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Thu, 16 May
 2024 10:19:55 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 10:19:55 +0000
Date: Thu, 16 May 2024 12:19:53 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
Message-ID: <20240516101953.gclq6bsq4rvaedqy@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512154915.2040-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR2P278CA0082.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a438ce-1842-4c2c-fbef-08dc7591bb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWJrSFZTSDFXQWtZNkZnbXpUSEFtdnRVVWkyU1NXd3pyRmVwQytnZE1iOG1E?=
 =?utf-8?B?TldqSytYdnVPdGNseHpFdjZKN0g1OEFsM3NqdWJQUUgxOHRJUUREeUZLK3U1?=
 =?utf-8?B?NlFLOUlta2xlQVJPaFgvWEdCNC9UdlY5V3loSHMrb2owV0lmV2x6REZuYWRE?=
 =?utf-8?B?RCszMUplQnhtajlwblNCZFp0c3hFaEZROWt0bVloZVJjREh0YkdFVWNkS3lv?=
 =?utf-8?B?cUNCYmdib0UwWkpZVmlLckNqK0F4akhpcFJGTVdoa3d3dS9zMVMySzFzQkF4?=
 =?utf-8?B?azlWdkY2WDY3aVI0R3JacGk4czFiclhhRFBPTFR4dks2QWlDZ0p5T0dRZC9V?=
 =?utf-8?B?U00yRE5IZHJpV3czcytWU3czS1QvK0ZoRkFnQ0JQNnNxUC9Fc3FheUVRblk2?=
 =?utf-8?B?VHFkdkFURTdVMzlzM2d3VFpXMlFOdUZXQ1p4anBPUUVKaXJhSll3S0tqaERu?=
 =?utf-8?B?SUUrWUY3MzlYcFJ6QzN3Vm80bEFERkV0MGdJOTlJWFdGOW9qT3creURvYkJq?=
 =?utf-8?B?QWZsLyttNXM0MnBIWlU3TkdhN2FXeHd5T1ZQL1ZKZUFzR3JVNVp0djlROTkx?=
 =?utf-8?B?MkZ2Ry8ycnpJaW1XMnRiT0xUTXZxbzZkWXdXTXFVV29DcWcwYjFRYWsvQjFS?=
 =?utf-8?B?ZkQzUEJKWjZ4TnU0RGJjcWVVaFRjZkhjLzJOQ1hlcWlYdjM5aDVmeVUva1p4?=
 =?utf-8?B?TlNMemgrT2NCSDlTcksxbHBWWTJYVVFaKzZOK3JSL0pLWnFBbElKQ3dNRDZ6?=
 =?utf-8?B?TGJ6U0cxN05qYmo1YlA1TzJNSnRvL2E1ak1oR2ZLa3VOMDdRQ2M3Q3lZdEhE?=
 =?utf-8?B?czh2dE9QS2Qrcnc2S0ZrcGtOL0Y2SW1CenNuS25YMzJhbEppZ3lLbTR3MEp3?=
 =?utf-8?B?TjhjNEplbGQxT3dEUThZcFZIYU1oZWQvUkRlTkNIQzMwb1ppN0JVYkdLeWhx?=
 =?utf-8?B?K24xazZmM0FOVkZIdk9TTnRZaFdFL3h2OVYwZmFrRndtRytJcFdJT2UxSmZp?=
 =?utf-8?B?YlI3aDZseXpjeFROTTJ6OFV1YWtHOWV3ak9rcWx4bTQ0NWZCU0VQbjQwYzg0?=
 =?utf-8?B?dHM4QVVQQURwZVV1T0gyNWZnZjRBRFA1MEp0MzZLZEdJZHhNM1FaYzdBMDVi?=
 =?utf-8?B?aC93TysyT0JWTHBLOTFEZm4vT1VQL3g0cGg0b3lSSWZrOXA3RlhuNVkrdGV4?=
 =?utf-8?B?S3huS0pkT081eUorU3VpRUpEV3ZQZk5Wa0FsUk5LRXZER3o1MGFveDBTbGNw?=
 =?utf-8?B?RTdBL3o0UE53ODlBWithN081QXZLY0JVd2tWWVBUV3dwQWRMWUYzaDd4bURx?=
 =?utf-8?B?dUh1SDVSbGJseFZKOGQ3TXRQQ0I4SzJPQzhZb2xTdXNPNE81bUVRaU1ZaEFl?=
 =?utf-8?B?UWxJZW9jZ0d4RXFxVXNTcXlQbzh4d0w1VktRbktjUzEyQ25xWW5JRmJDbGZa?=
 =?utf-8?B?VWQ2RURkdGRlamx5ellnWkJRdStNWWxNUGFMQ1pId2ViTll1YUFlNUhyWTZZ?=
 =?utf-8?B?RUdnaGZwalpJUE5TVWtBK2tCSTR2NTRsNGd6WGw1NE5LT1ZLL2UyTG5LclFY?=
 =?utf-8?B?ZFZSMFc3amJFNXVTU1crYmF0a2t6bzJTV1NTazJGTjFWQ0dFMjhUYTBrTVVF?=
 =?utf-8?B?UGlzZTg4UG4rWjJBaUlJTnpXd3N5QzZGM3VESmhSZFhsaDJYcjNsa1NuWExr?=
 =?utf-8?B?MXdxUEtsTEVCSnBLemtqbjJKL3RDUVhXanF1RzRKS3FkMjV0WSttblhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXo2UDBkQ1JKekpha0Fkd1dtTEVQTE5GSVF0WENlR0RlQk5zeFVlWFlJUHpC?=
 =?utf-8?B?aHdoVGNvMVdZZkV5b1VUQjhyTGdLTFZNZHlNOWk0Si92NkZVTDNEM3RONXpQ?=
 =?utf-8?B?dldQTVk0QnEvTWtvYkxyRTRwZHQ1d01ZYkxqSUN6dVRJVmdhdjlzSGM0VTRy?=
 =?utf-8?B?QVFJWm9mQjVETE0rdFpySlJOZlI2UGQvRk9Da2IyT0VxS1l1YUJ3OXN4bVpv?=
 =?utf-8?B?aVAwc0p2VjFiRHNVK0psZkIydVNYVEJxODhpU3Z1bUhITVpZN1czNEl1SkV4?=
 =?utf-8?B?b1krNTFTcHNiaGZzNVpheXc3dEhjZnYyb1RaQmNsRysvZjFzSVJtUEdCSzda?=
 =?utf-8?B?MlEwcjJ4U2JYTFRXbGZpQjNBVDVHdWEvZ1FNRUpVY0dmNUtNRFVYTUJMYmgz?=
 =?utf-8?B?ZGxHN0Q2K29mYUhqUktLSUJQQ01WTXhqa29vOHBBUFg4TE1FNVd3ZkFmNXVN?=
 =?utf-8?B?WGFqbjV3alVGajlTck5NbXRmZmVVVWNaOHZ3ZVRHSGxSdExYcVluV1M5R0RJ?=
 =?utf-8?B?TTRZY21nZThIY2IwcWY3Mmh4ZWNPODBMZjN6WkZmQnZ1blovNFAzeEZoaHh6?=
 =?utf-8?B?dExjZjdweTUwM1VTWVlDRzJLLzliZityRzFKTE1PSWlXRStZU2pHTDZwMHBD?=
 =?utf-8?B?S1NDZFByeUE1T0x6KzdtTWpLZlJ3b0NuTEpIRzdNVUhkdkpENXNXLzIrdk1h?=
 =?utf-8?B?OThrWEFTM3BJS2dvbXRHNkJtRnErbmllaSsxeTVaUTBaOWgyVVo3Vk5ycjRJ?=
 =?utf-8?B?YVhJbWMxSzVNQWxNMUowbHlxVmNhM2J6VElTVElJMHVWeGNFN29acXA4bFpj?=
 =?utf-8?B?cTZNaGlPc0F2K2ZFWldsS2gyb0ZUM0tlREhISDVtckJNa3UyZ1JrWEErOFc5?=
 =?utf-8?B?cE95S1lmcnA1S1FZcmxnYkgyd0hPVG8yU2N1Z0hvbk5GUVJBcGxKZ093V0xN?=
 =?utf-8?B?cmFRRTFXMmhUZzJzNENZQVNpRFBYcExVVU5TL1ZxQ1p2ZXVDN1U4VWlCUDhj?=
 =?utf-8?B?NDcrcU1STGFZS3I1aG9GbXRVbURjbHMrNUxvcGJ0RW1Ma0hmdGRJbVd6QkZl?=
 =?utf-8?B?ZmcrWXluN29mWnhWNEJRNkI5QXFMbjBNS09wWGZFc3hDOUh1QXRrbWpwSXRE?=
 =?utf-8?B?bG4zR04wenB1enlZbDRlWUg1ZXd1QXZUbkZzVGVyWG5Md3RLb0wrMkg4YVdI?=
 =?utf-8?B?QnZOdm01bkVkaHJBaExCaHBxb0wweEkrV2szeFFzRlJOWGIrVlJRNVE1eHly?=
 =?utf-8?B?K3UzUmQwb1V5cXNGdG9vb1g2NmEzM0l5aVhUNVB0Rm1YYTZkSFJWK2pHc1dF?=
 =?utf-8?B?UUZscjZodVRueTZoSFBQcGk5LzYyYUtRT1psNERUa3MvM0FrVXJTMERsTEJk?=
 =?utf-8?B?THFISGJtdXQ4bTNJbCtiM2s2TGV3YUJucDc5Y0NHSUdhOGFxNDZXRTVBSnNm?=
 =?utf-8?B?b3NmYmptU2dBUC9CaGpLbERRcXlZODFwZUFGZHRiVjRyU2haMHRmcFpuQ0pZ?=
 =?utf-8?B?aml5WFMxbldnZzZHT3lyK0dGbWdDemJ5aXRzTlI2T001dUVuQVp4SUI3L2pE?=
 =?utf-8?B?WDJicXhZYjZxZjdvNUdNTVF3dHNzSGVVZTJHYWNDQ0daVnBhdUdSaGdZRXVP?=
 =?utf-8?B?OSsyV053ZEpOQnF0aS9aM2JIanFHSCs5WU9Vck82aWhMRnFFcGtlSW5DbGFQ?=
 =?utf-8?B?MDFzSERsclhkL1hpeS9pdkFaMjJJdDBoMk8rWGdnVXdBU0haSGFZdjdOTWh3?=
 =?utf-8?B?eWhIK1d5bWtPR3FZVTdQUUFuUVFnOWxFQitia0RRd2JBb1VkQTQzNW9JdFNI?=
 =?utf-8?B?Ny9meTN0N01zeDEzOFlaMFliN0ZyNm8xVHE3RC90UkZ4YzVhNE93ekp6K1pw?=
 =?utf-8?B?UVM1UzBmcWxLQW9DRnJZczNZaE9KSzZGcTV2QUxXZ1o3ZFlEZkdzeExkZDFz?=
 =?utf-8?B?SWFvN2xSbWxDK3lyYjNLOUpKaEdHR0g0QzNrOVdGb3lMRWFvdUN6SkFFSmlD?=
 =?utf-8?B?YzE0QWVSenFwMkRFSkFPZXRBQ3VxNlNLbUtTWmZHRktBb1NoNDNPYldBKytZ?=
 =?utf-8?B?eUN0cXRRVVlDek5TMDVzNkU0T1VVV3Q3bUtJb1hUTFg5cmxOTXYxVzNVcFVM?=
 =?utf-8?B?WHFkSGhOVU43TlRaMDRmcVRDQ1Z2RkRBMDRJUC9DTStzeVM5eXhPaTlKbWlo?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a438ce-1842-4c2c-fbef-08dc7591bb48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:19:55.4739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vIpqLaQRdvqfA0vsCm3aB5k5qQpW+16WZ2m9NyJLV2M9MOkU1LiSYX5lPO381BmrAdG+5bf8rs8rpx82zXTmTaHzK3eRutjo1zXQ/hAsgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:15 +0200]:
> For debug purposes we might want to view actual VF configuration
> (including GGTT range, LMEM size, number of GuC contexts IDs or
> doorbells) and the negotiated ABI versions (with GuC and PF).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                 |  1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |  3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 72 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h | 14 ++++
>  4 files changed, 90 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index aaa3bce7390f..04c94629b349 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -156,6 +156,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
>  	xe_gt_sriov_vf.o \
> +	xe_gt_sriov_vf_debugfs.o \
>  	xe_guc_relay.o \
>  	xe_memirq.o \
>  	xe_sriov.o
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c5e562e143fd..66f897a9b6ca 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -16,6 +16,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
> +#include "xe_gt_sriov_vf_debugfs.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -306,4 +307,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  
>  	if (IS_SRIOV_PF(xe))
>  		xe_gt_sriov_pf_debugfs_register(gt, root);
> +	else if (IS_SRIOV_VF(xe))
> +		xe_gt_sriov_vf_debugfs_register(gt, root);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> new file mode 100644
> index 000000000000..f3ddcbefc6bc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +
> +#include <drm/drm_debugfs.h>
> +
> +#include "xe_gt_debugfs.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_gt_sriov_vf_debugfs.h"
> +#include "xe_gt_types.h"
> +#include "xe_sriov.h"
> +
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── vf
> + *      │   │   ├── self_config
> + *      │   │   ├── abi_versions
> + *      │   │   ├── runtime_regs
> + */
> +
> +static const struct drm_info_list vf_info[] = {
> +	{
> +		"self_config",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_vf_print_config,
> +	},
> +	{
> +		"abi_versions",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_vf_print_version,
> +	},
> +#if defined(CONFIG_DRM_XE_DEBUG) || defined(CONFIG_DRM_XE_DEBUG_SRIOV)
> +	{
> +		"runtime_regs",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_vf_print_runtime,
> +	},
> +#endif
> +};
> +
> +/**
> + * xe_gt_sriov_vf_debugfs_register - Register SR-IOV VF specific entries in GT debugfs.
> + * @gt: the &xe_gt to register
> + * @root: the &dentry that represents the GT directory
> + *
> + * Register SR-IOV VF entries that are GT related and must be shown under GT debugfs.
> + */
> +void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct drm_minor *minor = xe->drm.primary;
> +	struct dentry *vfdentry;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	xe_assert(xe, root->d_inode->i_private == gt);
> +
> +	/*
> +	 *      /sys/kernel/debug/dri/0/
> +	 *      ├── gt0
> +	 *      │   ├── vf
> +	 */
> +	vfdentry = debugfs_create_dir("vf", root);
> +	if (IS_ERR(vfdentry))
> +		return;
> +	vfdentry->d_inode->i_private = gt;
> +
> +	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
> new file mode 100644
> index 000000000000..b2cff7ef5c78
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_VF_DEBUGFS_H_
> +#define _XE_GT_SRIOV_VF_DEBUGFS_H_
> +
> +struct xe_gt;
> +struct dentry;
> +
> +void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root);
> +
> +#endif


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
