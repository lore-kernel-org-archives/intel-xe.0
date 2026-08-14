Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6275CC5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 07:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D30510EB1F;
	Fri, 14 Aug 2026 07:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngbP8xKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2C110EB1F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786691213; x=1818227213;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0QhODzL//IX5bNcCbN1+qrNXlx49sBY+C5KtmeG1VtQ=;
 b=ngbP8xKYUk05p9gNdTnXydibThWiCcMDBWl21nXHIXOn+nMhhCS4z223
 Vc8PwhLtrk+D6tJiPJ/IJgbribFdgdEDe7ZSWLgFbGinI2OFwCwI6szSY
 Xrf8sGjB1YPiES37P47x8779pX9gNFnnh48OrHaeWiI5mhy3UwWGF5zqY
 30YgxYrMDRX1Ou8/bchtFsGX2WigGUEFDAgsPVpKiCIOGhUzftosSww3J
 HO1oM9K0snZHDcPwZIMsDrspYj96zXmoo9hW4ZCdFtwMJusQpP3TtO3cX
 4DuzpmkzbLoVVVtuvD9JvMxbH9W12PI16JT+aW3zWKC/y9SlxMAk5nNK3 A==;
X-CSE-ConnectionGUID: N/Cp60TLR+OOzQKbATmM7A==
X-CSE-MsgGUID: GCpcGlUGRBWgrZiIVGxEpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104803118"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="104803118"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 00:06:32 -0700
X-CSE-ConnectionGUID: DPt8t41lQlCQ/J4g/Pknhg==
X-CSE-MsgGUID: CGkTxgtbRA2vvpuTT2kAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="269342020"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 00:06:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 00:06:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 00:06:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 00:06:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ij6cjUPWkOd+CaGb2MxwXwO9Fh5n7S3RTzxsnKCCoS/5G3b+fsZeDEwAMTgSqwnrHULrpteG7Krm2ceY92K0o4fsjHvv+tHjvRgjI8WU3AceMt/e9F6mi2TfDr8inmFaWoKWAnDi3Lr45YRKE7Mfh/p6PV+Yh3y3U2zZdlbxuMM3V9QDpxqb6u3+5lVZbXIJSPOuD3XtWEPn4aMyrJ6LlyzfpYcG9k9UmjDz8thlg+GW6okG4uHDM4woWwNZJbYnf2455FrduV99abzhGrSa+fh+NLXC/OvHz8heh8pImEh3zZsRu8aPfpn5tm9w49ZK7NqwomnoF35D+k56omJ4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+3Y4xzLqqiSEPc5Zh3vxjLjz07Fouq20b07Lzese9Y=;
 b=S4Jt8Nrq8WUrl0CYnJjvXu/cSUrLisNV7U6c67q7dlPaSNjRuLIgM3WKKRFGFRWZiohUKvcgbbCynfKq4BVrQOgAOhi/wn6TdQ2eKQpRrWAFuuPofLoQUjbnbs9nsR5+8MYzWWgsFRxTjhzYrHomS6+vZMciNzpqYYPOznEaokrQ0Ta/1GKEHUhzAdYY6h5Tt0DcTadukoGG6r+6RFKqFdXVGGmtmbctKwMnvzsI6sqrBqvV+3QpHgJAlU/2syOOuGg35PD+cQ0+IvClL9hVa0NaWoYUl/6TxwBn2Ic+E9uPF55I2mURqCR8O/eAh/cXp0vY1T+1O/joZxwV8Bhl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by DS0PR11MB7787.namprd11.prod.outlook.com (2603:10b6:8:de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 07:06:28 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:06:28 +0000
Message-ID: <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
Date: Fri, 14 Aug 2026 12:36:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
 <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To CY8PR11MB7947.namprd11.prod.outlook.com
 (2603:10b6:930:7a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|DS0PR11MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c53e18-4daf-4429-e0f0-08def9d28edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iyk2b0BfBVTFPsICCB9yopio4cufWWSAnthZ6L844rd4jspdvNoyVgISJx9EY8dExsTQw+1eVPxbew8AzJKBj9dm2euahNlS3QjN/Nmu1xZxUwbNWFmARtRN9cfzm4q4P/IAxIadCSvQW4zjDyX6fz3tNZwdw1C02/AaEm3RCWlNSaXQWmZt9ReRgeh7eKcO71Lf3m40hq4JjqZCHqJZSqljAFWTgUQLeFTzvuaB0i2w8jZRZzWCQYodQChHp/qH0B3aO+lSJaDEuaaGtdOrAmnz25gwr8sKiNajOYYkAMpR7hIbvESG1Cw5VQUWwof3DvnDtOp14MS3gcm+VrqNzpnmTG7VB8eTo6E2tnCGxVyIXQJJbNM+Z3ucEukG5lW1pyYgFTk/Re3oyCS/+unCXZmOjflz9MNl9HW0XhPdyW4Ro3K3ysMkBo9JmoloQcIjCsx9Pc6SxGtfUpni7IekFdaJqO6xCjRNVZArB6+LgNdqJOCAVnvhhHe8YZ0m39C+9EwXxiAp78+/dIbZuBVfAEgAsZnQNqrTsounKhh+3ZUWsLgzf42InN9I6uazrhShzj4F07Qd55fEokKVZEtGZASIEt08yYaCk4J2Pa++J24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVJFWWJJZnpXRlJma2p6R2d0RlVsMStXbWtCWVBnRExWTENwUWJURGNoVFhJ?=
 =?utf-8?B?WENBdnpSa0wrOEdEbVhEaGdzcFd4MVBMQTRHSVNPZ3JyVzBGbnR4cTJTT1Mx?=
 =?utf-8?B?K0dhbVJ3YlB0bUtLYnplT3BVekFVbnljYVZSeSs0K0lHY2N6Y0MwSisyTGt3?=
 =?utf-8?B?eWJwbTk5VWVsR2VaY1FxcTVDdGxBQ1ZUU3Z0RHRVc1NONEZ5M0NJb0hyZ2ox?=
 =?utf-8?B?K292SmVLY0tJTXZlbGlRczY5cGc0TkE5NG9HNTUxRHpEQXpQT0tjalZsS2Uz?=
 =?utf-8?B?R1B3eEQrQVh2M1dhYzN5bGlUdmY3TWJTWDI4TFlPcnlzb0I3VzlTenF4L3di?=
 =?utf-8?B?aXdtcjUwWGlYZStkYnNjSW50cVVrYzdEUzlORWhuM3JYVzJYSXV0ck0xSE13?=
 =?utf-8?B?MHc2bTQ0N1BoaFN2ZDBsOE9TUklRRFRVMCtETGQ0bU9kend6dVJaRk90YlVK?=
 =?utf-8?B?ZnpZb0lleXZDRUJiVmE4NFRrcHZIa01PMVh2VFJQQXNNYmtoS2dtYWVpbDl3?=
 =?utf-8?B?KzkrMm05SUJCdzdLVmZ1U1NjcXIxNXZZMHhaU3F4SFFUa28yZm9Bak5VT05a?=
 =?utf-8?B?MERyODExNWw2QlZYQm5EYmQwbWNaSTRzbHhXVjZxSmVlTEtXUXlyRnJNZWtv?=
 =?utf-8?B?dksrcE82Mkl1WjZVcXI4dURoMXU5dDYyd0wvM3FuRFpRMEJJNEtmWFk1a0pS?=
 =?utf-8?B?cVI0WGpKcW9aVS9scWdVYi9RbnlqSGVvbVZFbGJ3eGJQbjY4dkNYYTQxSGxH?=
 =?utf-8?B?eGx3Y3hkckYvQnhuenZYSFA2NGVZVUdkVGdsY29waEtQN1VoZGtaTHRqa1lk?=
 =?utf-8?B?a1NXQkJLSUVQcGc2MEFZOTdxQzRuUW9TVjBIV0ZONTl5MzZDYjc0MWNIdUJB?=
 =?utf-8?B?RWtlbEgyRXd2NVdCdlVaTWFLMWwyYjl0NHFLM1J2K3RRZzlLL3MvNEhpcEhE?=
 =?utf-8?B?cDg2WXUwT2pFbGhHK1dUOHZYMFJ3anI0ZTdtWCtsU3ZDMlF2S3krZG8waGcw?=
 =?utf-8?B?Y2ZmQTQzMm1yZS96b3Y5Rms2SmFEeGV6OXNxUTVUdUpORkpPSHRyMW1yUzEz?=
 =?utf-8?B?ZDd2SlFuc29LTzJhZGJCU1dVRGdscXY2STJoZW9QR3Rld0diaVJTL1I5cFhZ?=
 =?utf-8?B?bkJpZzhVNFlYVDVFOFYzNjVZcVlIck04Sjd0UkN6ZkNMZjJRV3VZM2hhWTZO?=
 =?utf-8?B?amJEdHNwdTRRZUNiTFZ3blYzZ2RsM2QwN2V3VndsWTlZS3ZmdFhFaU5JWjNC?=
 =?utf-8?B?bFlDSkZYUkFsU3I0V2h6cWppd1BRcTNIVlpsSVRsRHNuUm5heVJSc3JXcGRj?=
 =?utf-8?B?RSt6MkMxMlcvY09yc3lLZUltZUE3OVk1ekFtY1JkWGZJR2ZzcjhQMjB5ZEc2?=
 =?utf-8?B?amlVVUphWS9QNzRoZGtWcVY2bUZnODQ5RFNxQjc2OERaK1VNcGZrNWdFVUdx?=
 =?utf-8?B?eDRPWEd3MlZjTWFlajBKdm5sb2k3QWpXYlZKNS9uYzBvc1JBczl0TDhneVJj?=
 =?utf-8?B?ODdUYUI0R1o0TkhBVS8xSG5Tb2xyaTdyTm5IK1lBRmlYZUx1VnE4YnFTQzYy?=
 =?utf-8?B?V1RZVTcvWTlyeXFhWndvYWJSVzQ0STRtTW1rY2VGRStRMjFneXZnM25CY2hD?=
 =?utf-8?B?ZDRtNUgzUXVLdG1sVDU2RmUvMXd6dlNZclpLVFlHc1pYMDdoMjQ4a1ZrUlZG?=
 =?utf-8?B?OHdVcXpKZDA2QTU1RmI2VWRDZVljbVl1TkFNY2pQelV1ZzNJZnZzL0Z0dFc5?=
 =?utf-8?B?a3QxMzlya1ZSOHVpQVNnc1hiaDZpenFUS1lwRHh1bnNhMTgzZGlIeFZRc245?=
 =?utf-8?B?ZWxEbEZIMUFKM3RLNHlKdkhLVE91SW5xbEw0RGFVVjJCRDVvUHNPTVM3dnQ2?=
 =?utf-8?B?OC9pSDNBejErQ0hER2VUTlM2cTB1eUhMT2ttQlFNUk1CeHZSVE5MTXR2S0p0?=
 =?utf-8?B?RHNkb2tncnltaWVmVytTUy9iNHVoVFJtdmx2OTBHQWtNSFpCcjNaTjlYSkRk?=
 =?utf-8?B?TGNpNkpWbTR1RDh4eXRma0k1b0RnNS9UajNTR21FbWp4bzZkcjFicHFLNldZ?=
 =?utf-8?B?ZmoyYXlBd21qRlFDTWoyOVRzbHFEbmdTdmprdCt6aFU2bzRXSjRONXVBcGtx?=
 =?utf-8?B?RHpTT0xKcUd4ak9wQ3VFd2JjRUhqcDhjZWRNRDhtSURZVEh2MFIrU2lxSXE5?=
 =?utf-8?B?dnNvd2F2Zit0VGdybmhFcGtlN0VQWXRtZGVPdmcvOVg3SkRlL3V5cHl4Rll4?=
 =?utf-8?B?WERBcCtOaE5yNlNscmNhM1d1dy8ybndKeVVFcTZabXdjaXFlbHBLcVNLN2pW?=
 =?utf-8?B?Tm5iYTBtM3ZVb3VrT0lreW9GbExXdTlMQWs0Z0FyYk9MZWVFclVkZz09?=
X-Exchange-RoutingPolicyChecked: PmV8B+zR/BGfsboVbACIQWIzI9X5WxT2MNHwB04ozm5ggbera8oOocBtm18Q/I6mPHnVz47ZiR2r3j8mtDYk+VUMfBuAHmOVbogS/2QiOP2Av85TBEyWMQXQEvdTwymc0Asvu2vQCfZeA3e44mQ62x3XCrYRbEAZOlfefN4j7MTi+5oUmxbkxyoN6a7+nx6LbCehryiQARPcRGJycguvygD+NO809/PYKaMBXi1wpLQlonlxx347HaKZjqvpjqBtwexnlPUpyn2hA+RGDHKPBnn0vSZ1gjIOV96sG1G+g3Qp/FWwOWWIpdKY8vGyHqEhgyBFgMIpdVRpx8MlSxkrYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c53e18-4daf-4429-e0f0-08def9d28edc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7947.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:06:28.8273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEiBjCiMrwWeXCqUTqayJG33IwJLpNt3ibAF/JQzDUv6c6KByFjYVS4bVV6HTpdcKiUH6G5uHbCCNJ6anBIrqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7787
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



On 13-08-2026 18:16, Michal Wajdeczko wrote:
>
> On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>> Report 'Runtime Mode' status using various xe_log() helpers.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index ebd288986c11..5d3315ac735c 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -18,6 +18,7 @@
>>>   #include "xe_mmio.h"
>>>   #include "xe_nvm.h"
>>>   #include "xe_pcode_api.h"
>>> +#include "xe_printk.h"
>>>   #include "xe_vsec.h"
>>>   
>>>   /**
>>> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>   
>>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>>> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>>> +		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>>>   		return;
>>>   	}
>>>   
>>> @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   	create_survivability_sysfs(pdev);
>>>   
>>>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>> +	xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");

This should be xe_log_err
>>>   
>>>   	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>   	xe_device_declare_wedged(xe);
>>> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>> +
>>> +	xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
>> IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.

Same here.

>>
>> Already mentioned in original changes [1], runtime firmware errors cause device unstable:
>>
>> [1] https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310
> but in recent comment [2] you said that Arch team wanted that to be logged as info rather than fatal
>
> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>
> @Riana, @Rodrigo, @Aravind ?
>
> I need a decider here
>
>>
>> As I know xe_survivability_mode_runtime_enable function need to carry errno as parameter to pass into xe_log_err,
>>
>> however we need to create separate refactor patch for that in future.

Why do we need error no here? It should be 0.

Thanks
Riana


>>
>>
>> With above changes:
>>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>>> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>>> +		xe->info.platform_name);
>>>   }
>>>   
>>>   static void log_survivability_info(struct xe_device *xe)
