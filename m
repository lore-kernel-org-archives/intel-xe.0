Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC973E7C4C1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1F110E10A;
	Wed,  4 Oct 2023 14:27:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B5010E10A;
 Wed,  4 Oct 2023 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696429652; x=1727965652;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E7XAv5YlcVzXltK3OE4jzTmcfJbwkTBY8MO3LR9d0qA=;
 b=n6gpcLlvGTGhOpA098n0cKWNjj9eb8SXoW0I5gnCItbCRy0eduOv2uoK
 uj3GSEbL+zu0LdAhpSYarX3xKDupAWCfyAro52kUB9yBJOJ9LdeoBRLfS
 jEyWJwxgC+qQbBaMqReGSgPZSPeafWJts37ZWBDOglKe5Y8jLmWHAkUcU
 zZbMeSsPWMHWvolt7zqWQSArt+pwR42NJEI2jGO1VU5gG1CfmXIW3/JQX
 xcbJ/dlHTi5NRUIGQcObBr59qUEtd7FR9NCbbHWQnj0ntdk6pTTvvssQZ
 pgAyzV8U/lApMnwv8NUjjLuIim6f6MWz3iCAFWBrQNcZqhKPubYLSwAl2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4744366"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="4744366"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="744993907"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="744993907"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:27:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:27:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:27:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:27:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JICC/3MXJiKn7y+C+U5alulFYj8vlWJuBHr43/yKMBOmSSHeiPMESTz+g9ySG0J7RYKQEzeroXwRlEtiFKTc8A1OJ/HzepPXuDrje7oPFYsEpsxnuejX8n5wUl71zBAtiZDyt4oApuGu4NFLEb+D+ZXZ8AxsRsVR8mxvRYQq2alsf81GSIp6k7RP5dtHsgBm3wfs0C/ILTEZZ0tR2cdLX4eKkTfxa6eUCRNHvLuK0qyXhZM2KF/oLrhzjEvjez8c2HZw8vO7uGn7NnRnNxfn/VI8bKy3N22q64pT8eKaCqlPu5nH1uYZr9Kt0AurGn3crWhacO1wv8Ujizs6C5Z1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubMDGV00DJ0wwSSoqZ4NCvV724t7SV2A4VxGeqVP5HE=;
 b=SybNWKpRJGgW2IoeIdG0x5g/G/VIJoXE7HzXTBeCnzk2cbDZH6Tx5yM2ium3qKTiymF+wpseRq+wLHd+YHBZ6zohoUR6SSZck/V69BXcrbFnid/sJHQ+DR8lMLbGXAN9EpxwQs5BJrhnt/7aYGiFlGoN/YnpUO/Q63NKK8smx+iCw49cdWnrAbpNPivVqlYJOkb3JArivYw+9NqiSY/XxVJ05+r1UWSxv7WWMEN1aERTdq5nqgt4rhNTtx6zCr1pAkZhfGZ0E/i7F4UPI4twsrMz7btzeBn+3P/0/K/Ey7JmMq5c7HpOrCu/ScQH+lU5IFCwiU0z0P219PmQ0LiVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 4 Oct
 2023 14:27:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 14:27:28 +0000
Date: Wed, 4 Oct 2023 09:26:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <7oqovb356dx2hm5muop3xjqr4kv7m5fzjisch3vmsmxm33ygtv@eib4jielia35>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
 <20231004031023.3444455-9-lucas.demarchi@intel.com>
 <20231004043130.GA53570@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231004043130.GA53570@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: 944b513f-42c8-4f57-a808-08dbc4e60973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iteyqMWuoGbiV4FyBHyN6yb4P0pDFBBPW/V1NwBo7IqS5Oe5/c9bH1CTczUZ6hhWdUGlSc79fivhonxh5FWD1wa9z6VigXEKmCBWi9mYbmSo+yiUbu0pyESUZaihDMCtUjkelrF/XssRS2UsP8etvFI/MW2wHPo9UL/g04yxepVpom6broX0Te0NEVqS/6u2i3Vnaq9VKmNiSbiisRlVEv5Qyraa/eCFWEDg+BY+4QwfXNUiruob6CtsAq8T6WGBZRQ6pSbs7/bClttzebrmrr1Ju12KTY7CILbNaQG0xlFxZOIUncOVRRrroY+34mrEnd9qwdYFAAecwxoURv81K01+OvJ7mbMzEujtOVLwu1Yd7EITeS3qgc2xLq926Z31hdoUf9Mf5dqt5CbUxp95zn3lRiAdE40XcRRm1js7PhzlGYQTOmSthzW9oz0aS646nom6LH8BL3IdYh1TSqJF8aatKKAncXVRJMAKzOv1tuDJLIT5jm2TKvsL5qRt/i1N5codmUw/bgobzCIp7lDF9006mGlTSmtcsK0Vt/SxiCcyk52tBhk+oNEUZ0tMYPeX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(83380400001)(38100700002)(478600001)(82960400001)(316002)(6486002)(9686003)(66476007)(6512007)(8676002)(66946007)(6666004)(6506007)(66556008)(6862004)(4326008)(8936002)(41300700001)(5660300002)(26005)(450100002)(6636002)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XE97aqG7ur1oyoknvWjpDHJQSJh4L/oTdJJwrCOmKJEiS4vIJbt76SqORTOv?=
 =?us-ascii?Q?UF3Y2kl5gIMpODZAkjLhNWHTIpSajzFmdzNBbmDOYzOl6B3fVyKD5bd2ELr7?=
 =?us-ascii?Q?v3N8Fd0+Wy2cjvgRrxX82Wj7BKg0oVsQfG0U8RRwBIPNYF1DKjwGi4uD5lwG?=
 =?us-ascii?Q?/pQMh8FU1uaOPz9YROCHeHNNzew/jjWmTshj49Jg51dU4ebj/4X/Ia81BOE7?=
 =?us-ascii?Q?Qu4jUZuWUG8ONOA/NT9xNTmwrG1rrLZfFU+Pv1m+Lj2K8t/NaYZo2AGnfTIk?=
 =?us-ascii?Q?0LnZ05FiQ91sDHfXywCP5z9wNqNGlrvYm5+AOjRNr8pm7srpRBIuFg08Iktg?=
 =?us-ascii?Q?SiEnAVXjAzMd8gpN5RhXNqlkyNtM6mj3fX+9NAgxiqkLeKF/K5tBJIaM6ydK?=
 =?us-ascii?Q?7DEMlsvC0rJrlj8dpOwAwTckFSMsYthbQdE+ely0ba9dIyWZ7L7vRXFJH8nQ?=
 =?us-ascii?Q?3nMOEI7RO+U5Wn1KQRaTa4cuG8KNgiJkiKgwNIglbE4CF5Eleg08/tS3pwvc?=
 =?us-ascii?Q?7CMU4en/VDUie1JyZiUwipnc1Ew1jXKRZ4oftLpbkTGaDvFmkKYf20JUCwMc?=
 =?us-ascii?Q?q3tmksaKkJYTKHjyRvLsZOpj8ocyKkNpDM/205DxYFzNPBx5x0yGfPRJ5bcF?=
 =?us-ascii?Q?/NnvuIpiKnkzvYK4Um31n4SZSvnOaMNzepeEMZbm70Og2V7K5ShNK1/uGMpG?=
 =?us-ascii?Q?vzgjQ8E7u5+tRRlDksM9hnP1Pi8fN/zlZV3q/APppV4LWZdHAH1+88f7WsZG?=
 =?us-ascii?Q?QjXAMD7KafH4O8QVIi2Cx7jX76mCs1nDsPSzIKD/j9tWHi9fL7zkZKD4dT8v?=
 =?us-ascii?Q?v17uQOit9iJS/D61wmxdwypl8C3kUnkyTR6VQ+6giufIrV2nXyHwnHbYzqHJ?=
 =?us-ascii?Q?CGQC5pTB7RZx9KGIE2JYyiGruCKmURohq3l+QS7Fvly+nivXxaJUzqup27XR?=
 =?us-ascii?Q?pr9tCmkSOElBw3+mvm1HFF/d2CINpSHmeDL9DbW3Bb4tVPB3thRV7JfNNPnc?=
 =?us-ascii?Q?GJZ4Gus50wxJ3xxKRQLOVY8F8gmXMBzG9JwxobfIYKPncjXHYaU47dAqG1ig?=
 =?us-ascii?Q?plRwoqJPXk8L4oa3YM3+tZ3QudliuGAKtUAJvjyZZz6nMiru/HdCDRei7SVy?=
 =?us-ascii?Q?v4tLmYtczqjEC71xw/B4U7jBX1gjJLetlokx55kZWixICc++k+H4nUiDmgu2?=
 =?us-ascii?Q?zFrpyJjhqlyA5BTLJcmLPcRFiUO9PioTlTMhSVj1Gzl4yinvo67t+//iLFyG?=
 =?us-ascii?Q?GPhbaW5vHA8ndRXEv4umhzMCZrZNx43aF62A4XtTr5iXUg7HusY7Ap6u/ZsY?=
 =?us-ascii?Q?JmDd/MCFST5w86k1Xy6kpXY5yrY0EkuRyDsPWGGdVD252tvrggUuYR+VNiGb?=
 =?us-ascii?Q?jX827lmfFcP9F1LZsbE1eEdKSGydC2QnopBJTicdDJJM3SUACSxp69o1I6Tu?=
 =?us-ascii?Q?oAbbui0658jLcQmSGIBsbg5hR21ujjGmDHXZj/JwScNQ1jHyGFUNZmHQxRRs?=
 =?us-ascii?Q?lPdac+NPX6Yst0zMRA3RB04MhQ5L1ZeCcv6ZnPTCqMZ7NwsNZz7z0b2YXnLQ?=
 =?us-ascii?Q?DB4c99eF8TOwCj2Ev8HKEB/k13hYBc4KA52xuMUreFwQ1mxwDZABCbxO0DMy?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 944b513f-42c8-4f57-a808-08dbc4e60973
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:27:28.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sy2kxc/o7LP1hfrXbjhSkgeB6OtUbZijQqWn1sosllN0Zz1EpvOR7v/D6EodM4F/dciMiNbuA/K591lVhQ7vbVzNvMotAIWYi+bd95D6zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t v2 08/13] lib/intel_mocs: Add
 Xe2 mocs indexes
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 09:31:30PM -0700, Matt Roper wrote:
>On Tue, Oct 03, 2023 at 08:10:18PM -0700, Lucas De Marchi wrote:
>> Add WB and UC mocs indexes for Xe2 architecture and later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/intel_mocs.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
>> index 6a4ec25e4..d9de16932 100644
>> --- a/lib/intel_mocs.c
>> +++ b/lib/intel_mocs.c
>> @@ -14,6 +14,8 @@
>>  #define MTL_MOCS_WB_IDX				10
>>  #define GEN12_MOCS_UC_IDX			3
>>  #define GEN12_MOCS_WB_IDX			2
>> +#define XE2_MOCS_UC_IDX				3
>> +#define XE2_MOCS_WB_IDX				1
>
>Wouldn't we want index 4 here (WB in both L3 and L4) rather than just
>L3?

I think we were always using the same index as used on the kernel side.

If we are going to use index 4 here, then we also need to update the
kernel side to actually program it. Right now we are doing:

	static const struct xe_mocs_entry xe2_mocs_table[] = {
		/* Defer to PAT */
		MOCS_ENTRY(0, XE2_L3_0_WB | L4_0_WB, 0),
		/* Cached L3 + L4 */
		MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
		/* Uncached L3, Cached L4 */
		MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
		/* Uncached L3 + L4 */
		MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
	};


Lucas De Marchi
