Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37176C88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 07:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DAD10F250;
	Fri, 18 Sep 2026 07:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNixRF1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0C710F24E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789717867; x=1821253867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yWi5RRvNaXJdOn0UylLWNtiTCzLOGJby/W9LJbF4a8E=;
 b=aNixRF1f/epkoPqcRQtMwiriRWafLIXZ6RnLCErbeps5BYB+9Gv2XQx5
 GbjII02P/HBGMzn68Y1miWHE0lMGZ7zJaAVkX6ad5V0nXgZLzJtk5lrrs
 tN0rVk6XbfjpqEjtPUARYIoDrojIPcwhMyruQhrwVeRujDjqNkOMm/v/F
 rCMSoRC2Xa/gLeer/BQS5Yob0J/OMb7BTABmBY6gUIgyyl/AgbckRhLTF
 TP8Qv2yFUiFB9xe5qFFaGrrBCuncT6KV04AHg/Bgle98o2GpVrsGl+3os
 e1Lqn0ipTZ65zKCuClRKbSyDc7E1EOCtKLwBb7FFvKnCMjqhZwE6fKCIg A==;
X-CSE-ConnectionGUID: nrc03VETRueSK6Z64n+GIw==
X-CSE-MsgGUID: aN3cjMLdSR+clyHxieb8JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89341625"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89341625"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 00:51:06 -0700
X-CSE-ConnectionGUID: Qs5wZcO5SjGoMmZZPlefeA==
X-CSE-MsgGUID: Xuz9XBkPSoOuROw82v2LCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="297735120"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 00:51:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 00:51:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 00:51:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 00:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKj2gqiHcb8t2tL2uHJj3ErLvg2QzflEGfl7RMMKwt8Kh7uqFLgWfo0lpFEI+KT5GXzuJl0oySOeZC2b9GWj+nlc7/e0+bi2B9xyN/ShO4ZxS1tJg/NPL/KQ75aFzz8FEFgfzaocCX7Lt/pXAi57ojJvB3Urmew1JIDKGwtxdwxP0Ld/1CmL1uziulrhZQK/AnxniUY8FBdBA6GNOF5mZUEwXgO4Hg9BApPSoZz8itZugEZ10eIMn7eOh95YaFQd9UqO9ZnFjz1YkntOro2Rw2rnRzyk4hTu+mYOEGIFJG6IzcgGO96xWeJTwOywzF9OlFwmesAQpP0PCGWghoxvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qo11kiMp2+rLbqelvYQxNnN4GCkYOewXlLKwLDrat04=;
 b=KdnuC9UlHJ0FLcmbxPeWFGYFi3os/2fS4Jj7G5wSmcd8BmntF3Tae0renq9EpOMYDVzD23loyb2dlrATQBEwW+xpCx1Oh7TsVgqoLJTyUNtBxW2Zxuq1HQT+SDU38znouS0xjYuZcAS1UqDw2aFnZq0s0s7UP1dz4iSuTrVu9tawxZN2KUq/mfku9SZ2HtUiMEHZ7TJNQftxGrqqFvYXccsO+5utcdJbRJ+kN2z7k9fqioi6AQD81/JaxVs9uCwABYX8sZaZBlq7zRSOMu2GVetDTLyhRAbgu3kKMYfXEsxiC+MzuF3R7Iyt8SgBPQpvrkMiImPYug/HZ2qRcyFedA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 07:50:52 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0428.009; Fri, 18 Sep 2026
 07:50:52 +0000
Message-ID: <f49686d7-826d-4715-b04f-8818d6efc8d9@intel.com>
Date: Fri, 18 Sep 2026 09:50:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to
 info
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <zhanjun.dong@intel.com>, <daniele.ceraolospurio@intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20260917135310.3590412-2-varun.gupta@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260917135310.3590412-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::9) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c54d45e-c3a1-4bc3-effe-08df1559901e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: lP5qxRKykrQqRkdH/DIsTQXqmbUgCnOv8sR+oATLvj54GGRWLdypbAlq5L2WY8HQKIIpILN/9iZRsvp1TCJv203HDvXRx/yKnlbHbset0pK38gj2iLg92hvCtf3PNmr1I3IhNAFzHuBkTFgvAR7U7jV6pkreW5Y4kvMJD/6PVwTJUNWUoICqJ7wgTMzSNxDUVo1mbcbxP5zDlF7iMHgNhhWty7ccnJ/Lg/evFORUWSlOJXSsuMrEPEYKK+3W5vMogrlVVIApLV81tG4M11Y1aqboEvaZcjoyX/9aMg3NjoFAmAhiv9eTtsyTNWyZSAKpZbdKHn7aXQW7WR6AMyqjDzLZjsm2F7LalXszi0kNkJkKod7bx0vVkVkrz4av545HkxHCS1XmXMbePggr5BimOwVEW9WeGR/I+Iz97tZyjTPtAAVHHwUly1VrTNZ4oTkMXvbCvmjHFnJdUs1p3NF4EHBPuz86Lcvz6O+wDc+lo0i1qAPkdCy3aQqccKdYVwLk8DqlaY0Tjt+J9b3cahq6PkDNmt+ziyqqvzHrv85Wxxa6+6hCTpoZuBsvvVQpw7CSvZk8XX3OHgK58nh93gyA+jDeND3/XYePjOwyf2mmUQOereOiY8aFKbeWeCOK1UEtfySi9ml/pM5Jjb3TTFqCkoRieyegjsso9GrJlisbMRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEhnNll5K1VNVjJDSUxQQjY3Ump3d3FrcU85WWdnUkhnQmsrTEdBblBVUytS?=
 =?utf-8?B?ZjM3cml6QnhpTklZcDF5QTlVSkhpMlBYS1ovbWtuME83Z25lR3ZVYlhWMDZP?=
 =?utf-8?B?N01va2FRVXdpcGZOWStLM1A1TFlMZjNBVFo2dSt3eUxnTDZHQWIwRko5Z0o0?=
 =?utf-8?B?Rnd6NkY3K1VOSnRPMDlYZXk3bzdROGtQSldGc0xlZlp3dHg5djd1cWFoZjZN?=
 =?utf-8?B?QitaalU0ZzRSM2p4OG1nVUFvU0p1UHpxbmVzNW1tL1l0WlNOWUZpa3RXQ0JL?=
 =?utf-8?B?UW5QWVh0MTJ5R01heFAyZlNIeEw5YXhWdGNxL1lBcWM4bHViWDZ6MFZBUG93?=
 =?utf-8?B?SWFLWHRUQ2JGL3N0VjdyU0VYOCtTbjJYOXMyRDJpalJzU3RlT2FRemRiUW91?=
 =?utf-8?B?dFpVc0c4cVZvOStDbVBCMUFxemRrK0paNU1zaURTaGNQNW9PTll1bWR5S3l1?=
 =?utf-8?B?L0MwNU94L2pIMVpIeDV3NUVRK1lldUp4RCsxc0F4bW5uTlY3QWM2Y2ZhbHgz?=
 =?utf-8?B?aDZVcmZic09mRUEzcGNIVWRpQVoxOE1PSDA5MEJCRjRUZW9GSFhFVURDNjhk?=
 =?utf-8?B?c3ZPSVhGVVdKVy9IZGFJekt0bDFwNWhjNk1ldnMyeWVIbVRJanEvWS9WMS9F?=
 =?utf-8?B?L2VEWEZjdU01dXpGOEYvL1kzWHUxNS9qV3NqNWFvWWE4aXNKOGExU1dkQzhh?=
 =?utf-8?B?ZmhoR0p3NllSeHdhSzE4ckwzQi9oVmdXQ1ZHOWtXclhrWEx1U0o0eHN1bS9p?=
 =?utf-8?B?MjU2L0NLbkZubkM5UUVJNmtkTHE3YlF6TW1LSzBiWXRCUTcvUUpyN3I2MUZz?=
 =?utf-8?B?ZTFZVUFUM2xCZk5neWZERlpXZGVwK0pCdG5GTkFNcWdyN25oeER0TkdiZitZ?=
 =?utf-8?B?aHZqWlZGZldxb3VXZ0plNDFxRDhFc0sxdnBuVTh5TXl3V20zZG1KRkNLS2pJ?=
 =?utf-8?B?S3dVMTViWHBpcURtMm5pVmlMZ24xU1lNcVpKVitscU9vaWZwVUhkbnJ2NXdF?=
 =?utf-8?B?NjR3NjFuYXdMNHFESmpGeURCTjM5T1BuS3loS0FpNHV0V3BYd2R4dTlQUVFw?=
 =?utf-8?B?cWVEdjJTaEhscnNiZHE5MkVTcW5TdFlwTmVTMmh3YzRtRDJPcSt1dzN6c3BV?=
 =?utf-8?B?Z0hlUlBxbmV5Sjk2NWtRTEVWZnp5cThGUVI4QUxUMXBRYWFFSFZTVE1zWVc1?=
 =?utf-8?B?Q1hWOTBFUk1UaFJxY1djQm90TGVVS0cxZVZJZDlSNDBGMFFXU2tURXE4amNo?=
 =?utf-8?B?WjNJVDI3eW5FcmtvR3ErR05laGF5UVRTeDlhVHd5Mm1OK3IyeG00S2p2UUpN?=
 =?utf-8?B?bTJEWVh6WkFtaGhRc01LcCtyekRkVmhyTUk1REVPU2laVXdRRDJuWFYyK2Ra?=
 =?utf-8?B?ajVKWE02YkNvQks5ZFpRSGhnK2pKVHRLTkRyZzl1MTNkYVdBdmtmRWZyaHVv?=
 =?utf-8?B?aDFHbDBDY1pqK0NHd1lST0NrSkE0WkxicTJwbDVRbFJWVVdxZFphZk42cVJZ?=
 =?utf-8?B?bW0vMlJSaERkcEthbmRhWWxjaDhTYXh3YXNReG11SjhWalVlMzRvRWp2amZt?=
 =?utf-8?B?a1VBRVEvZDk2NlFFRGcvcUZvQmlnVzRmUk1CNEY1ZnJiVnJJaVVqZ2d1aWZm?=
 =?utf-8?B?S0V0cjhXTnBsTVc5RFlmTk1DQnhwTHdBSjBVcUVTVjhIaHRGbFluVWRpdmpK?=
 =?utf-8?B?TWhlNXArOE9KT2t3RnJGN21PUnNyMGpjS1ZpOWw1bVJsWTR0SlQxSWF3eXpl?=
 =?utf-8?B?aS8weE5NLzlrb1g4WGI3bmFoOUlBVFJWNFA3S3paYWZKaGlLSHNYYldaU0Fw?=
 =?utf-8?B?K0dWY2t1VDRkRUdMeVVCRlZ4Snl1VHJsbC9DK29LYXlOa0gzU09HSy90UStL?=
 =?utf-8?B?aWpVWjJiS3hDRFRKbWZPM1VFZ3BxTmtjeGd4blRwa2lhT0VUc1BCMEhtcHEv?=
 =?utf-8?B?QWpRcW4zMVlGY0xuRkwzNHJSdjE4STh4L3VldXJpVmUxUTZseG91bHpwYUFJ?=
 =?utf-8?B?N3NuK1ZyNHZUWWV4cEx0cU53MTltSCtwUnk0MVJOMzhhdE5uUUJKR1Zzcjhv?=
 =?utf-8?B?WkhRTDV4WUxTaGdWL1pHb1gvYkRJeDkwYkU0T0U2aTM1cTdBVnVPRDg2VGpt?=
 =?utf-8?B?NWdSTWFMRE9BUVBoZURwOWsvcS8vQzRDandyZVBrdVZlRVBWK1p2alRReXZO?=
 =?utf-8?B?bmRNK2hPbks5YUN3Z0EwQjZ4VWN2QWVtaUJ4eHFuMmNLUG1PSEloRjE2VUhR?=
 =?utf-8?B?UE5jU2xTSURXU1VXWEpZaEhIYnJsbmk3d3RyWVJiMFFxNWN4ZlRWcm04Mjh3?=
 =?utf-8?B?TDhFMVBDdTByZ0t0Ti94cnZGeGNXaHVTZWhEazMrT2VoWExZcHpJZ3VGcXRi?=
 =?utf-8?Q?smBJQjeHwW2iNGGc=3D?=
X-Exchange-RoutingPolicyChecked: 1vefNDwXklb7k77Me9fG0kC/m0/dhWlDdEKudklusTCTLGQ8tKpZULAfZf9B8rCiypK4KsjDX744ubMn3ve3sv+8S+z4DFmtHK55m59K05oPkRfvMYxIeE7SMd5qUKiMLA5IU5UYL9Ohwrn1Um9GRYa6fBe9CD/hZ/v6xjB4W6nYfxccAklYxrqIc6SABMsTu+6UvUFqMx5k2a9aIgRra1aAAL29UlWIzMWCD4B/W6SuLCl9SQOwv3JgKgHBCsWvhAA7xpxtWJzxu/ev4XwqSpJ9yOxl++ELfRXzLrtv4xs0wsUgGjiRCDpcdMJ25vNLSm36YSSnxHmPcI7g3t7yTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c54d45e-c3a1-4bc3-effe-08df1559901e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:50:52.4983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGpR8m5DjAGO0RMrAwzOPg9+BKZe/GI4jljVLm9Kt3Rhvrw2My+N3zwakx1cxjDie24fBe/DTHkFqif4yoSa3A2jE9SVB+OhIROgDO8aeok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
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



On 9/17/2026 3:53 PM, Varun Gupta wrote:
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or
> driver failure. This can be triggered as part of expected recovery flows,
> including intentional fault-injection tests.
> 
> Printing this at ERROR level is too noisy and causes false-positive
> dmesg-warn failures in CI. Switch the log level to INFO, matching the
> adjacent CAT error handler.
> 
> v2:
>   - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>     (Himal)
> 
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3ba8abfc228..6144a1767f10 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3487,7 +3487,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	guc_id = msg[0];
>  
>  	if (guc_id == GUC_ID_UNKNOWN) {

btw, shouldn't we check for guc_id >= GUC_ID_UNKNOWN?

> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>  		return 0;

if GuC shouldn't ever pass invalid guc-id here, as spec says this action is for:

	"Notify the context which caused an uncorrectable local error to KMD"

then IMO instead of ratelimiting this error, we should rather escalate this
to -EPROTO to force the error dump and reset from the CTB layer, no? 

>  	}
>  
> @@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	xe_gt_info(gt,
> +		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>  
>  	trace_xe_guc_uncorrectable_error(q);
>  

