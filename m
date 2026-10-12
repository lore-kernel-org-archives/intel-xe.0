Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E6ACA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 09:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9137310E451;
	Mon, 12 Oct 2026 09:02:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EC310E408
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791795757; x=1823331757;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GYnEYCLqzEU3gz7u3Bnw4CTRepstDy+oAWjGZtwcnUE=;
 b=WJwcww6J5to0Xp/fW+lbXk9rwfXib3vBVrRkGGx8jVZEoRnRzc4SnnKI
 1U9qwnfsfl7tbhJTN3fiJIqSisUBvDe2NvNE3dZbu/mqnj4DhjjSVP0/E
 qZ/9LghcjcbuQ5iPk3d0GxsH05Cn2m6/V4ElKPKqFLjgqXnk6RJc6eaKL
 kPvsHBwWFF82rVT3WXZjRm2P8d/4vMhu+3GUKdrJoBF//7rfL9ORXhhUa
 LZDuF9cps+LMC+IxClRQOR4mpHwqvYLjGdSR5Ydg8ogYNaRD57soodg6x
 J9yi1NYVEr7JrJWp/ZRcv+rLcICmbqm2ArfdVH+Y41PwN2f8GG0Er4gMW g==;
X-CSE-ConnectionGUID: e8BhOlv8RHKgzAv54G3WKw==
X-CSE-MsgGUID: /8Ry+RZUSxWxrLngEDINlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="514637"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="514637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:02:37 -0700
X-CSE-ConnectionGUID: xPnVCZHaTZO/Z1HC0v+UtQ==
X-CSE-MsgGUID: owZQLCnjTeaS0lWRlDRe6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1180376"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:02:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:02:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 02:02:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMFGyFhgKTNMyhU6sUYysX/7RqnS/NixrfYNTjq8XgV/w7I6LY3SITctUzmwCWZh5vg5/4dmZ2IfpntVq7rtY+IA6ySSMnVcp3c04USJQG8X2+2M6XVDKkvEJ0WqwqdV8lB9k9iXxI+JcBk7hj8mVQfVzOOUgThStGMk+WJDw87BrwRNtv320UWdx2tZjnlVM+cKjgA6m1vJj52TXpP1mRk3UE1nL8KB19mmNiLbarKMcX9l0H8ogp/d7yxT76JhLhkk9phMsH0rXH57q7wTzNxWNYZxmsoEbPZu5wz0KQO09oRCD+1dzMj4AEodZPfVFYPjPnABKxGj/PejosmTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLoNehcocx1Rpn2XpG+Vl9EFVbSKr9Ro/fV35YA8ado=;
 b=gTfN7hD7xA5vIhUstE7pEgsuJcyoYqQ1TSo5Rw7KshJoKMBNR+QvseZuev0YSci9pYIVocFaCzRyBekyhmP6YTyKV+3A8TMkyTpFwzT3PvB0ncIC9dpFvvvTzS9GgQGVxzQsol01wU9TkHAZhmp5Eo6GU3Em0Gwl5R7cotOGxHTuM/pNKub7x/d4kk1FMV2QJQONxGBHfsiM5UhNZkp5AvBa9OklkWrSolIkVA6SQ0HRe13tYRtGn3KEaVdNXxbxkiE3QWob+YQSEj1/GWhGpp5GOQRxpzUfqlx6YAm31WxsROoFDq45qwF/1gRwsv+cmxhYNPgJBsLR48fwSyUaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:01:50 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0496.019; Mon, 12 Oct 2026
 09:01:50 +0000
Message-ID: <932904bd-1232-41d2-b7f3-c3f8997c3499@intel.com>
Date: Mon, 12 Oct 2026 14:31:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/12] drm/xe/vram: Report tile vs device VRAM
 visibility errors
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
 <20261012051823.2201360-12-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261012051823.2201360-12-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0245.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 98969df5-2e92-4571-e0e3-08df283f73d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|5023799004|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WMmaq4UxF8PojV6s2HFWd7NDtaZ0B9anCE9vsIk1x+vKUZN/b/IjP+3URPGEN+q+VhF9pYO+4pbo3ViCPDhtWTWYxoG4EQF4102SGR2orVDPGNnJEzkvxjfwaKSGMeH/Mxtl2BhX/EE6R9Cso7aDFZdTQPjxufhxYNRqk5r/rU1EkffL7Q2JhpUfqTEbix/1+wROrJS+0v0Nvl44vCgMwYH4l1c61Qq/W+IFNmDuPk3woID0bzjFf9NfN/beHqUCiihlvnJ0DoLutod8Yx8Q+3zpCJdldz+Ul7z5J4off4Gp6O1Fe4/47hs4IOAeK3qDcJGZTDsIW6FX/B1WyWedjCE+G1S/KVbN4uUgNH3F0ENHsPKj1ucFL1OtOMg3VvkZcrIUGWosQKt3fNfZf54QaniOjfmI+rqPascc1X8Casf2eTuD+Z2n2w9nZw+hHMWjYxbmg4+eXeT2dj1L/lS1C1V/PG2zBWI6piqS0LnXuK7HMMpVivA6+stFsPyX4KnxssBnc44YnRQLJS8CxWB4uyIqV88jqSX6QkU8r1jqXPCwxB7twaxrZi4vDL/GW+6KMlvTNH2lzevlDknU4h1KOFDGnRqBf20F7UhE3SQqITjn8GTSOnAsMsFAF22SksHx1qOH2HnT3OobGoI/2NLqilrJcEy/p+mazSOeYtkbXqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(5023799004)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3oyaWk4ZTJsMFhidzg5a0ppTCtFR1Z3cnF0VGEzQ0VrUnY5YWF2c2pvUzlm?=
 =?utf-8?B?cWlHK2szOHVoejZ2ekpGaU05cDRZQlRsZVFqQXdzSmxrYzVVNkY1b2pRNkVo?=
 =?utf-8?B?dTBGZWQ4SlBZT21Ua0pEVGc1RVl2ZFA3QU9VTnlOazEycGtxRVhwYndFSitX?=
 =?utf-8?B?T3AyRStrMTNXWHdLTzduTzJwSXJibk96RFE5ck5NeHRoTENHVUU1NHhKZHl0?=
 =?utf-8?B?bjJnVXB0dlI2Uks3RlAyajJhRzNlc1ZyMDloS1QwWWJpQTN2S2UxTGNENk9P?=
 =?utf-8?B?TUREMGVXQk1KQ2RiWlBqNno1WU9ZYllXSlRnNzVYbE1Seklab1NLeFUxRmF0?=
 =?utf-8?B?UzloYnJVVG1DbjRzSGRJdW5SaDkwYzVTUjlkTGlLMVpJSWhIZ25NTHhnRXcz?=
 =?utf-8?B?RFFuL0wxbk5qNHorT01pTkkrWmg0RFNVSGZSd09NVTdhay9sNFJNSkdzbkdu?=
 =?utf-8?B?RVVGL1QyTk9BczNkT09ybGhvVlRsRmRPSzZZVUY2MnFJaEJ6TmwvZkc5RVUv?=
 =?utf-8?B?Yzl4bnJoRzZnRWZXVEsrT3RvNXoyN3dYdlU1NlNSK2JHemlxRVBxc0dZYjJW?=
 =?utf-8?B?T1NLTWh6RVUveUh2TlVMMGJKMlZWdHN3Y1QvWE9NTWtsaVE0ZkRVM29UY2or?=
 =?utf-8?B?U3FCWFZWUVN6NTJMY0IvemdSVy9CUDkzcU1hYWh2NTREVkp1T1hDKzBTRnIw?=
 =?utf-8?B?RXA0RnFqYllOU2pnZHRFeG81TzlqNzJES2dnZFVXTUZqYWRMTXJQVGxVM0g3?=
 =?utf-8?B?cG9UU0tzMzhweFpLU2F6QmE3dXRMZFZNZk9ZSlhmd3d6cGRvVURLUXl1RS9N?=
 =?utf-8?B?SFExNy9YT3ZYVmVneSs5eExYenIva281MXVzcllZeU9GMi9XelNIbmwrM25X?=
 =?utf-8?B?WkVFSy9FU084VHVsYjBBM25lYkpoTnVqMWxJdnJ5MFFOSTR4bEM4YnAyRm9T?=
 =?utf-8?B?dGtLV3VFOGkvZVdUSEMyUWpFNENnVG4xUXVpWVBNbms5WmNzSktWUm41Szgw?=
 =?utf-8?B?S3FnSlJPZVFhLzJRbThrUjl0SmJBRURkMm9ueXoxa21Fc2VtK0JOMXVsYW5r?=
 =?utf-8?B?SFl4ZHp6S1ZSdFZ5WnAxQ0xvQzFiSElvL3RaVHp6VWl0Z1pqM3c0eHdwK21R?=
 =?utf-8?B?dUlDQ3g3ZFY1RTVWZHRoVFhzWmhqSzNSUkhreUhkeXdoZ0tISTlhUGpKTFBJ?=
 =?utf-8?B?dEdUQ1czZzlYQkVVdlZyeERCZk4vUTViZEl1RHdpOHlYRGhBYTViamJBOEdV?=
 =?utf-8?B?QlljVkU1Y2NaaHU4OVVhUm9sTjk5Q2VKUitaWXRUVXFSemlEUHJzWVJsT0Zj?=
 =?utf-8?B?R2VzVGVEd25UWmM5b3dncmVERm1jUUM3b1dTdms3QXArNmd3K3JOUjEvOWxJ?=
 =?utf-8?B?ck9RMU9JV2lVYlZMRi9zYndSUVVvdGtpQkt3U1RPZkN5ZlNub3VyWEluVWZT?=
 =?utf-8?B?NjdQMXIzRlU2bU1wSUJWQzc1bWgrTnVPWkVwTUpjZy9JU1RqcnUvNjlaaXdz?=
 =?utf-8?B?R2tVNEFWVGJOejhLMGl5ek1JQlJFcmdEMWlWSUMzY0xYY01NbTI3UHBqcFh0?=
 =?utf-8?B?MUFCTFQ4OHZ0THFHV01Qc2NqY2pHdW9xcHZjWGt1MFFZYUtsN0tBLyt4YmNF?=
 =?utf-8?B?NXhQWHdXWEE4Y2pEMmVrNXUzZFRJdnEvWDZsQXczYUsrZ3lTT2VDblhyU0tt?=
 =?utf-8?B?Y0M2V0dJNVEwcHNtckhHTWtPZC9ueWVNWllHVWVwejlLakJPdm56TGV0eVlo?=
 =?utf-8?B?ZnoyMDdsRlJ5RDV4YUFUVXp4MEFXZ3VtVi81dHcwejNaV3VXd3IzajJEYlB2?=
 =?utf-8?B?YzZjQWlNb3RTOFo1bnp0QXBsWVpOWFBPQmtmK2xCZFBLTVE0b1hCK00yTzVr?=
 =?utf-8?B?QnRRYjJGdEdLNkFKU3FMU1hPVnJIbldCQlNJcEZJbnp3bkZRMEgxQ1BKQlgz?=
 =?utf-8?B?TmNiZ0lQenI3L3pna2duM3RZbitmU1o5VjZycm5GMytPQzZXNEZraDkyZWJ6?=
 =?utf-8?B?RDZhb2orME0yZnVWTTIxY01sWDRIMTlydjZOQ0RmNFlOcXpRcytNWkpPdGZO?=
 =?utf-8?B?OVpDTGdiRHA3VWFzK05ML3pxS013K1BVYUZpVXBRT3dTQjlsejAralA4WUlx?=
 =?utf-8?B?K2pDZ2plRFR0Z0NTZHhvOWRod1NOalZCM2Z4U2tqbjAycGRFVlB2Myt2MHYr?=
 =?utf-8?B?SDY3VFdKMTFNU25RaDVFL21MblM3V1JsR1gyUHdJZDFOVXI3NFJQaithODli?=
 =?utf-8?B?bWFxNGZHVW0rWWtsV2Zob2NaeVZ1cExXV3BLUERLaFRSeUhIcHgyUURSWmZo?=
 =?utf-8?B?TVVJa0J4VElqalNUS0hNcFY1Sk9nVUJkWHBKQlNCU3RYaU0rUHZDU3VNcCtt?=
 =?utf-8?Q?+o/rxfp6/VaAu56w=3D?=
X-Exchange-RoutingPolicyChecked: AZDsRic4nwMQlE1oBOBCUCaMnto9afdmVmaLgb5JHS/dyISEWYXfBkqmgF09Lf3ZrMlw5YdDU57NNVs/+6Iwp+uWmkpxrKa6A5ZN6C0RHu3LHk35Nx4YvKxzPcH6bOnnAHr6YcUzaZ9m4fRxsz4cxRAwR3FjYVElfG66JMr06Dgz81n2qXw/Q25RL+OCSmp5V78HoKWO7H9hfMRcCgzbG5ZoLwU0z/8jf5EwlaoZdhjYtlXndkA5xSf+PM2Rs2TdYeZvfiBZHece7pSSzHculSzmE8HDQkjyktkeruj8kVPFk8WdR4ygXP69rHZSh/nyHqfoQP3ht+DBxqFRZrLX5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98969df5-2e92-4571-e0e3-08df283f73d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:01:50.4717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FVbbldXWJyvtSEEMdCRQ6VWnsTb3BxCEAtCl6Ldgn2v6XqHp9WNEJWLhUplWZINnFnw2rzt4R+uuxj+9o2PDBOlaS3s8jLAUcrslCgkdp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
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


On 12-10-2026 10:48 am, Dnyaneshwar Bhadane wrote:
> Derive the owning tile of a struct xe_vram_region inside
> vram_region_init() from vram->id, so the "no CPU visible VRAM"
> error can distinguish a per-tile region from the device-wide
> region without changing the function's signature.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vram.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index dcedd8cfd731..73aef047eb38 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -244,6 +244,8 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>   			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
>   			    u64 region_size, resource_size_t remain_io_size)
>   {
> +	struct xe_tile *tile = vram != xe->mem.vram ? &xe->tiles[vram->id] : NULL;
> +
>   	/* Check if VRAM region is already initialized */
>   	if (vram->mapping)
>   		return 0;
> @@ -253,11 +255,12 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>   	vram->io_size = min_t(u64, usable_size, remain_io_size);
>   
>   	if (!vram->io_size) {
> -		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
> +			tile ? "Tile" : "Device");
>   		return -ENODEV;
>   	}
>   
> -	if (vram != xe->mem.vram) {
> +	if (tile) {
>   		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
>   		vram->mapping = devm_ioremap_wc(&pdev->dev, vram->io_start, vram->io_size);
