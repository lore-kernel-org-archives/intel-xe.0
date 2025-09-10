Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F848CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 12:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A4810E913;
	Wed, 10 Sep 2025 12:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNzw/aNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC5E10E913
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757507507; x=1789043507;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lXX5K6mFCEPzMEAYzZjoSy5r+6RUu27Ux/59XcYD3+w=;
 b=KNzw/aNIV6n6zDG8mKokDXlX2X1OGBAhO4YpYNuZ5RqFyXye8/WWebHv
 w9t16XiWRi5UsdF5z5DGtMkr+xvJwt7UbnFevhnUxQnLf50dzdzfL7LJP
 SJzvQpx8GiNs7Wfv7sDS5slNbUO6HT2DkRuBW+WxOIxVjj93X8ZeQ8U8t
 Gs5YYsKKY644yxs0BBAcJo/0EQPt2Y4jwF703pFBpU4SMqzfbRojK7o4E
 DdzTPkMqfumUupy5z3fwNspsj5RP6fODi+/6e+B0EFTsSBQMEEa5vg2m0
 GXyBx7KKzFx7RcR1FpBEOYRcF0uUiCoA5ty/zXqOAYhhPNh+RKrSbLQCv A==;
X-CSE-ConnectionGUID: Kcwf1/mbQBOE0karPaUxBQ==
X-CSE-MsgGUID: tfrHEB1nSWqot0/evR8izg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59037343"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59037343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 05:31:46 -0700
X-CSE-ConnectionGUID: lxzBtJaQTUqY0tsgrdE9kA==
X-CSE-MsgGUID: 5PD29dEbQMm6SYsR4Nuv3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="177702097"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 05:31:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 05:31:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 05:31:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 05:31:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcrCqq69jBtFiCqrtZ1FEAQfcLWnbiMBLpwX53mrpJrGesKup4AInFykb2mCYdD9w5ThdBkCsAkZhWgjKV8HNEB0Ll2UiZasoo8R0lckyBZJkqRegtIDqUyPTThZ2+WtlmTAKO1Rn5Jv52bkm2oTJEZbTfFUdL5Cide1tvoKr2EpDfhlvamfHrttTGFDvFEopnxlFwAcq+6IUdZNBx+OZvWc6q77j8YZhat09Rv/jZ3Vlgx6XhRLiM1jVeWO0wO3n1qBmENG7Wy750xBVJLfEZ+dmvMH5xj1xlZunpFvWskJWw2m8wuBE0gIxIfxCMTuJfyvVcH3GC8xLCVRSkmHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ4SA6w60QFS+/AYVq5I5aIPfoxbQqUhOh5Pbtqjxkw=;
 b=BH7TiOobfJOLBR+Ag8Y1vOe3IF6+zXRXrrMLfQepcE/XrpdZioP94TXPi5WbZSFr2cUybaq9GZho2a9XE9VJKko4+KqoirYufwCpXdEUpGYd7rkRlQ+4blVxCKUOXuzLYceaReO8Zc5f+Iwd3/oWABfNRBCHfrTSx36ZIRdprMGu3SAgQ3oRg8+Gqh1sMoChigepA2EXq7VFlORqFnipC0IYQNPEi2d0ZjYFi6DrbQ22TmYLCw8eaNHJ8k6ilhV+M4AKzDonNSVkUQTYjIC3iQ2x4paa28idsIkd+bkfzm9zM9lgVI+H053bATn5NdCBGFj3VE9fPvYog32/dPOe9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 12:31:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 12:31:43 +0000
Date: Wed, 10 Sep 2025 07:31:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, John Harrison <John.C.Harrison@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v2 2/4] drm/xe/guc_pc: Use poll_timeout_us() for waiting
Message-ID: <kktlokib26keqahk2hi6ebzoducblhja7dcqw3lbt6z5lck3oz@5onxn57vwuri>
References: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
 <20250909-xe-iopoll-v2-2-4c7ae9726e8e@intel.com>
 <28316ec5e023c7bd7196ece4dce6e467b1829e1e@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <28316ec5e023c7bd7196ece4dce6e467b1829e1e@intel.com>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a12af3-6174-42ab-d511-08ddf0660013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U/ZouGMnbkvMdthYr84JZgiuI4jSyJQdMRbGM6wAAo7Mc8G6yB4C5EmDIAg1?=
 =?us-ascii?Q?dHtErNJwt7nOrekpqzaPKEekdzAwQFrsipZD6t9J5IB7adoNJeWFtz5Rxkmc?=
 =?us-ascii?Q?f4INDahKf7O8m/OM7czk23KGu00RKQG7F9DDanpxMNiuMMsHIXdso3IF8RQn?=
 =?us-ascii?Q?b8LXtbE+/4MuduEtEMXTeRWY2vYxOeYQOxlxmBzAcQ0S1GWCWR4MT4h5OmYZ?=
 =?us-ascii?Q?odkdX+uhs5HlQ+SrKoLno/NEwBrjISjF1qhP+7aVNdQ7woDQx6lLhPp3xvH0?=
 =?us-ascii?Q?zH5V04MMa3MUaQ3aFZ3slCajBl7Hu7bLCHpAB7lSXmvlc9gMWrj9QR8r/Arv?=
 =?us-ascii?Q?OkotvYCvQADi38WUXfCapo5NtOl62RJhoA+xXyMuM2FFLrxrjiqBVbuqkEOC?=
 =?us-ascii?Q?T0MUM1wfx1ZIUWmkogAK8gKUAxy+pZF+XTDH9JqarU58Iqu+lk/EpmL7vyzk?=
 =?us-ascii?Q?Uce9JTakrBjgSrVxql7655FEgu3ooV6FYTsuWGZsqBMzsuQjk407yXNXTm0e?=
 =?us-ascii?Q?XmvxktFIuoaM3XWdMrBFAlxqmBW6qr6i2/3ZIfvY8k5+tqBo6ZIPx7+z4kCS?=
 =?us-ascii?Q?15wfNqKBoTM2sL0BZ/98ABrAHnc/d19cV1Wjt6Naf8xH6tmnc4E+jg0yTRkr?=
 =?us-ascii?Q?t67fUlrad89CiW1RYDi0A02O4LRSSnIvOHDi2jMOEWCPZMJsM/gKw7FiTSgW?=
 =?us-ascii?Q?my20NNx6HoYGjfhslGJFA6BCvOYTh2DFjQ1YJEH/xxmqKsdCrJna/CoyGlki?=
 =?us-ascii?Q?foonR6XE/TAv/e7qDXRe7GkU0eKtWmEsPV8tSuih1PYIkebDvkeZIOSj3xGM?=
 =?us-ascii?Q?C0DxFjkgKEy/LhLW12D22gF3LuqkzBXtppJirWoLkd6y6QU02bySfY/BKof2?=
 =?us-ascii?Q?CPqMuuym258p3QmGKBXzkdfq2zKretc6bcC5IbACwKeQa9W8yXOMNfvwxb/G?=
 =?us-ascii?Q?jUDzVks+N6XGE3LhuXI1GZrMQ+CxxLnNE0+KuyirmwnAWcZkvPoHJyseTZTn?=
 =?us-ascii?Q?P4Y//CmAP1akImmrq064vhIkDB5MjokdXCML/oz0HIS+Ji3PX/BqO4h0DfQO?=
 =?us-ascii?Q?oPf2icRWx3EGXxrl9MkZpBm8ENe6dLxXrvooiZHwUk/jlfsZReJvYmUpCY+Y?=
 =?us-ascii?Q?hbMp0qRVrO0DI65fcOzcFEgcIFwfsXhQbX34pIi05yZ6Bkup05Y8h4sxh45q?=
 =?us-ascii?Q?j4ij2GU4fGBYMAVfY0D8wKvZsDiRyNihhrBm6uLT7SKi0qQena1WgmqIL79w?=
 =?us-ascii?Q?SIE8KnZxotLGze/mXBOjgrwb1SwBQNxWtc/JXDu1bk6HtlTbwUUlOUl8hJFD?=
 =?us-ascii?Q?aXV+d5tTC1nIqlNYL+wsG1n+T7FWaK7KPLcZ/6kicGDJTPrLk12ruXjI76Ac?=
 =?us-ascii?Q?VKdss8EZ0CERNhmpq/f5S3Htj4e1FPmrX90KxZTGbYEjhmdrsjHcMBBM34rj?=
 =?us-ascii?Q?zL14wPm5GoM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBtOmysQOQEhygirABXKIxsOUef60xi7s5j/Ub4kK6WgOphn4OxwG4SpLzYK?=
 =?us-ascii?Q?pJ35ltOyLE+znsExurX1T3Jq5Mtt2jqWcsxjJtyRxT3qmOrMBZLixP4klO02?=
 =?us-ascii?Q?8EaWVh12zB2lpzuRtu9tpGF8Uwq+2gkRhI/E9hW+MpqD/j+fiuAtyBsAWilf?=
 =?us-ascii?Q?O65vAmLg15yQLg0A3bVh+KXXZyFdOurwq8frLzJfiOg/vl0410SW9OGBU5zo?=
 =?us-ascii?Q?nzYODBM9O2kopVpb1r1Du3szJpoj/xtqG4CkdjYUkqQBL6SlBEfSKwMbbhAE?=
 =?us-ascii?Q?MrOpp9K/CGax3qZsH70zTa6F+AczaIFm2Nj8/GVQLUa/l+tQ50s8Pu2TTAR+?=
 =?us-ascii?Q?XQpr0K2Vum7/pypnrnYdRZpTeUOD5rO/qcBLJRbQKimGr7j0Z4kM+UL47/1e?=
 =?us-ascii?Q?SjY5wKQdpEDhMX8KK2LFHZiFFhVF359A07UvhCJL1kLPELWi/xsRKUPQ3Z6e?=
 =?us-ascii?Q?vILMr/o84Y0LmR+PWR0gYuUb0yvsZJDlHcg8TAeetwabfxAlzTBNB4ANjv3P?=
 =?us-ascii?Q?nTY+p3rwyZJdxVtotYOG/wRIqUBjgZm8JaNXnJ4htrMzmyzYWGuRVyTUWzim?=
 =?us-ascii?Q?V7up591+ZgzqgAzftVYCKFHzYr1HDIqSkP2gC0FdPG8sviQ819rJj3gbK1pH?=
 =?us-ascii?Q?VN70BfSxChERB2IGRiwdtMHDd5FJSLUbd3JfzSfr7S/kn7fttm5MdJzx0hzZ?=
 =?us-ascii?Q?0ukAtAwO8KH0YKdzM9NZ6N1/rSPrvyuoKJOL6Ufr0U6/lcxM9zN5Y87pgxnV?=
 =?us-ascii?Q?4HJ+yobtrkaM3Ji2xKqCTOsDDBr72JqXrqhLQbqP0SBt9FimQUdw3qmvwvYv?=
 =?us-ascii?Q?9u/82s125Hk425DNnaz+h1jjb9nc95jd3NWronEVm5fR19FTHnNU+WHxzYOL?=
 =?us-ascii?Q?UM/sD8RuDTE89rZq4spELkootf2mcPXLFJ77Py+umGaJ548x+COAXhJIACGI?=
 =?us-ascii?Q?90yy1CLRL7LJccvG6TAxnkBV3+YlI/31BpLRywyTkfZSX9hsui8qx0J67TTn?=
 =?us-ascii?Q?HFCBHtqZHOogr9/2jRPu/sKTF4Kh5ejoQZPtoPF2IFJk2LW+kq++EpoCmUuK?=
 =?us-ascii?Q?MHt9w4RnEgDYbcwReD8f5gTfZQLGvEVPrpCfmkxBozSx4QCTdXBTZBxIZ17w?=
 =?us-ascii?Q?2of+9vpf3NI6bL1Yt7L92Jq4x7iS+1RBArJ0R8BZhu59M8LowyvR+pGBbUWL?=
 =?us-ascii?Q?CEQ/Wxy+AxcyoAClT0Bbr8pNJy2Rp45WHaGQsvnAp9k6mNCUonuWYh1wCCdz?=
 =?us-ascii?Q?qsPUfp8Rseu3BuoCvwPQtr5K9cd8cFS4k78IFus7BkLB+OomnrQMxpa2s63/?=
 =?us-ascii?Q?QhgUpxrCpDhSETNk2Sq4OrQDfOxswKvel8tvEGoJ9XDD13ZTbxooIm07BSey?=
 =?us-ascii?Q?uwmAmc7Vx6jT1iyiO6F5gc+4ADFDJ8VMsC//UfiNPoenROxlkLi/oxyOaLYW?=
 =?us-ascii?Q?II2sCkkYYH2x3kqaBfh5barMxwfvTbQqKcbilj0xxbeXaSJSgdg78UWvoEtj?=
 =?us-ascii?Q?Fr5VpS9x4I9levNaxs6l/WcDqQJXnGXhsnrAzDbWlqBBrKSsXSOcyphniHfe?=
 =?us-ascii?Q?mlbT8ssDSCr61bvFIBNtcsUnE98U6ePo76VPKJiJODT6yIg8kOgcnt5XR0Oh?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a12af3-6174-42ab-d511-08ddf0660013
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 12:31:43.6628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4acQ52Yz+RFVVl9cQ8AIPBD9dIq6BA3vkQJyktyJiSF0B/P2A5NIHjk4PbqUJI3ss3YgAPkYV9dM18bmvwBGWcG4MHAy48Spc7JLZ5Wp5oU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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

On Wed, Sep 10, 2025 at 12:31:54PM +0300, Jani Nikula wrote:
>On Tue, 09 Sep 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Convert wait_for_pc_state() and wait_for_act_freq_limit() to
>> poll_timeout_us(). This brings 2 changes in behavior: Drop the
>> exponential wait and fix a potential much longer sleep.
>>
>> usleep_range() will wait anywhere between `wait` and `wait << 1`, so
>> it's not correct to assume `slept += wait`.  This code is not really
>> accurate. Pairing this with the exponential wait increase, it could be
>> waiting much longer than intended.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: Simplify functions by removing helper variables and changing break
>>     condition on poll_timeout_us() call (Maarten)
>> ---
>>  drivers/gpu/drm/xe/xe_guc_pc.c | 36 ++++++------------------------------
>>  1 file changed, 6 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 88557e86d6371..31b291bc77543 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -7,6 +7,7 @@
>>
>>  #include <linux/cleanup.h>
>>  #include <linux/delay.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/jiffies.h>
>>  #include <linux/ktime.h>
>>  #include <linux/wait_bit.h>
>> @@ -128,23 +129,10 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>>  			     enum slpc_global_state state,
>>  			     int timeout_ms)
>>  {
>> -	int timeout_us = 1000 * timeout_ms;
>> -	int slept, wait = 10;
>> -
>>  	xe_device_assert_mem_access(pc_to_xe(pc));
>>
>> -	for (slept = 0; slept < timeout_us;) {
>> -		if (slpc_shared_data_read(pc, header.global_state) == state)
>> -			return 0;
>> -
>> -		usleep_range(wait, wait << 1);
>> -		slept += wait;
>> -		wait <<= 1;
>> -		if (slept + wait > timeout_us)
>> -			wait = timeout_us - slept;
>> -	}
>> -
>> -	return -ETIMEDOUT;
>> +	return poll_timeout_us({}, slpc_shared_data_read(pc, header.global_state) == state,
>> +			       20, timeout_ms * USEC_PER_MSEC, false);
>
>Not a fan of using {} here. I think it would be more clear if you did
>something like s/state/target_state/ on the param, and then:
>
>	return poll_timeout_us(state = slpc_shared_data_read(pc, header.global_state),
>	                       state == target_state,
>			       20, timeout_ms * USEC_PER_MSEC, false);
>
>I think this is *much* more obvious than {}.

agreed. I will change it on next rev.

thanks
Lucas De Marchi
