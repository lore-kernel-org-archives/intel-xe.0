Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9DFC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 05:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D6110E0A0;
	Wed,  2 Jul 2025 05:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YB6EVOhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063B410E0A0
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 05:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751433248; x=1782969248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rn+wmIQYpF53ktRWam3UDkIGFosUbuuZFiqK4uMYgPI=;
 b=YB6EVOhfG01zmPQ8a7h4bPUke6Ghodc39FHBPkAd1DGPrHGudYOs19fB
 +f8zBUYvfEtcXJh+OMo8rFc/gFK79mP4RwphG0UaI9rIKzRfw2knd0vx+
 OtxXnwswvFZZEyRCfvCQIPsFGwss1zf/nLkJ0m1MYFS7IftbK9ZQuO5xi
 uRLevoDiVkZSYvWKdr6inx1vpAad3VOThyKvKYN1FAn35f0jLWOp/j1Tz
 WNiDmxb5G66dn22MAsXaSC2p9sCrC4rgIWhE0D6VVeohBD15hhvNTIRu5
 HN5fzUkImAWwLwKv7GZPBNQArkS5LGr2Reu98ePxc2HV6yjL7NuNNnyaX g==;
X-CSE-ConnectionGUID: //w3eA5tTAi8/m2MecErIA==
X-CSE-MsgGUID: wrA+I9AQR7Sm+J+xtB/QNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57495182"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="57495182"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:14:08 -0700
X-CSE-ConnectionGUID: 8YFOl5piQJSuFzPICXnbZA==
X-CSE-MsgGUID: gqnRI5O0SEagFBJ2RPw9IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="185009349"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:14:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 22:14:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 22:14:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 22:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLvm5MiIVbxZ4H79kTOVKJwOZG9Hq2mhHeMynBStEiaycAljUJOodfpFwREEr9tznyVsGG/bfy8lcFc9N2zilcmaY7UWkfk5sAO0GGp67J3sThgqqGCWsMAsxLdY3QGZtyeRKyt5XUDyErJWmbncXzZe7LCq1LZ+LXlQkpfQtrSKMsLOUxTQZwKmN1zcIJKqgBhSCOX4bzNLDS3mhi4DXeUSvYrkcoQcFl5NkR8nPC1Ej/+5+qFA44IpSMisxqbfl6Q38ls8SxF8pyqvFjL1PF4UuORSxcBRDBZtquTDC3Wm8LGu0MB5bIBpz2HYt3FZGYzMfSNkbyMU2qmwZlw1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBI3Rc9RPW3igal0zeXmrDm+04uZ8s7rJaPt/KSgsxM=;
 b=Z9CoFNu6I17b7mtHTn+dlHm2FC20eKXJ5mhIx1UUCmDp0s+rullujUkN8ZOyaqmMixSSJZW+3h+fM+AvnrUUPe7v3cotY7qvRUfyfL4uA71jCmu7LVF+2pcic2/K/Hl0oU1w7dcKi4Grvt4XF/2LxomI7jkaVDwZWZRC0T4XHobMCRLL8POMkUBVUOzCCzjUTeyhafHJxEfDIiVN2ymfKd9lbyBHAfC/nWoljYsc/FG78Hkp0A6u0jpOMPGb8k9XsK/dB3SUkf2WziomoIi6Qqpmo/MPP9FLktqfc0Cn6ze0X/WMsHlvxkX+oI6cXrXEMTAp426GXzZ7nOATvU9sWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 05:13:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 2 Jul 2025
 05:13:36 +0000
Date: Wed, 2 Jul 2025 00:13:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v7 2/8] drm/xe: Generalize wa bb emission code
Message-ID: <y774muxwsly4v76txbtqrixk5zxse7dj3b77qi3ge2vypmrgv6@ljviakys45th>
References: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
 <20250630122244.7949-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630122244.7949-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: 38591bf9-c8e9-4dce-512c-08ddb92732dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hwKP83quyQSyhreUZrORqYUo/wEpok3OFOoGqTtVNtj9TTDbWrG6Ys76M3h6?=
 =?us-ascii?Q?HvZG/X9xWdvrld8aDmE32tb2/oTA2ZaR7e1Y7vW9Tl+jbn+93ZmJ5dSZ5y/f?=
 =?us-ascii?Q?uEsE5p19XxneJP5SDFjS3pCVigpXx+ea1m/ak0OTauZgtdy2E/6Puh2cxbnG?=
 =?us-ascii?Q?JpSq7HSeUFiQEc5rakFFy5r0ka8S9uBZADV477nowVjIj7DA+Jwo2GyYOTaO?=
 =?us-ascii?Q?spjq2rVVgjHDTL2k8IyYM4vAML4L7whO43Xy0WBI44eJ88Z/ucCmWixUFbDJ?=
 =?us-ascii?Q?9dSMn1m8/VTY3DgOhUfCHunJGeRnGNs5rlQsg2oqy16UrRSG+3+vFjCL7JEs?=
 =?us-ascii?Q?fG+Vm5i8NpC3qB3K25X99/NXP5/W1sSHo3dIyKDZva+OZCWiQWOEnUKMITHb?=
 =?us-ascii?Q?Y9JN1pljAFPc9McPcM6RZC2rk/SwLxgHYs4bXIxuImAObaQHKmZVts57RvKZ?=
 =?us-ascii?Q?qeqsr81c+d9ow1YeRbWq0r9aP+VLLBlQmvqodkFeEvrBBYfihAmszT1ZRAsq?=
 =?us-ascii?Q?CNAtuKO8b/4C+swhkFez7WMuIAqEENLA+BnDiKjm15zIjbOTxoeYZ5ulkehV?=
 =?us-ascii?Q?mo2sLEgOFlyFZWuqKUhU5Xi07SgI+FQHhSwcw8MWHMMnbazAL8P9rKkfIxy1?=
 =?us-ascii?Q?lBfmqsxT0SIq72BQZ77pMfWm+HTJZrnuPPVmPIQ8y5GM2/P7ALO8naJBc6Yo?=
 =?us-ascii?Q?cFvzlINMA0qLUfBpvZ3FguKKtjNtFesFGosS/pPA4B7oUYv9KE1+dWH/i12v?=
 =?us-ascii?Q?067Ux9Zj5Hb61UpxW11M+Xj7tZStNhtUX9cFPal9SUPd4wtzmNI5MR2x3soo?=
 =?us-ascii?Q?srBMuT1FQMAaBpFOiavPK9HWuaiTSvmX0HWv+8EGcmChTsfsRmAUlgc3TqwK?=
 =?us-ascii?Q?0UyKj5STdwYGJboDqn6l0YtRmssMTgUA4t/eWBs92wgt5D7qKfachZ6e7CtM?=
 =?us-ascii?Q?eT4rLBbGRgLKp739nLIyBYFBOoMEaAVojiyzK1vulom7ywjgEktAlFP6pFOr?=
 =?us-ascii?Q?Tq4uSAYW4MND/0eyV8oIadsDvB+Br2txg15Hi6rFEIe8ulCAbhwdRckb7N0K?=
 =?us-ascii?Q?rg/fMethb2cR7jJtlAcSHAyZGxm1tIUwNTyzqORTZbHmf8wwdO+FbHFAV/9+?=
 =?us-ascii?Q?FiWjr44RytCKVFoO/k+z9LdJj6kFyAFHfAY1lts8We8BYFHCXdayPgpY8QJA?=
 =?us-ascii?Q?8AX1nDES/DNb4hP6KfsPQHaplrRVQtQWl8oyHIp8WE4e8JrDS8XFKepuZsmw?=
 =?us-ascii?Q?fNGO8uMfA12pVe9ID7CAnrswgsLHOEHq1RJblePjE0E/7PNG3t2FKFAJE4DY?=
 =?us-ascii?Q?MMrL3OaKYbSGGgL+qeokJAjh5EJHk3eCU7yuUGgbxsd7WrCikWiT40EFtVRY?=
 =?us-ascii?Q?/k7g8ehVl+JbnC9Q9mJD92OjuYQu4vzmwGvoKdMEhOLWe2yi4imVCCJTa2mU?=
 =?us-ascii?Q?R4XdNJJfwgs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BnGY4sbgtwOimKntnXx8pRN8z9+aUtQczqniuM75v22n1nVRrDXQKAFHLavz?=
 =?us-ascii?Q?6HswmLOpwSgiplTjAx2HBuO9PmIsNI9FfCxkCmWlPSJ3mjvUCb03zKTEABKZ?=
 =?us-ascii?Q?AHirQGUvUM8pJdx14JRSJiXtl2KYR41Q6RSVYarJhyjiAetHybIZgOAH05Jd?=
 =?us-ascii?Q?bVU7Kuf8FTdv0Sq8m9NHxkJBe9iYJM6CXuiA/xOZ8oFpsGF/Il+sGML0aSmz?=
 =?us-ascii?Q?1sCfGnbHm3rw0QtiPjY6zP/16Ew97B8Bsuk3a4o67MisqWutHJiPvnnKDNdN?=
 =?us-ascii?Q?1Udh6z9Luv8ijWc39+ehI9zOeHvxtdj3gQCtGO2nb4RHcfNvxokU8pBiQx6d?=
 =?us-ascii?Q?zwRGZc3iUkVOKWlkpRcZ104Sgo4Oyce+2ZopGYVA8sVL/E8TxIfMAji1TATV?=
 =?us-ascii?Q?s8/rdjhvx7cSgtMkp/msQlQb/bjPhzTs+/RdsfoAOACnA8jFDen+g+MLK2bd?=
 =?us-ascii?Q?jsWjSL1BnxP+aytmXNsSmKIKW9AO3p4q/3v9O3LW7AEGdSH2ZK3pBUcFIJqS?=
 =?us-ascii?Q?MmEMLdHvKJ1u91hPEB6ECATpBYcuy4UyWldpmOUucgLgBFujrhKSJqpMmUjd?=
 =?us-ascii?Q?Xpc0e1DI/h+ZL6wRsEH8jFVq1vYYGtuXzXg7/qN1ctND0SisLWO03OEPso/L?=
 =?us-ascii?Q?d0k+4ON+PUKo5EmPGja4+2Lhlzx2dsEJzl1F3uotaDfrktQ+Go7mpuKKIabw?=
 =?us-ascii?Q?+ga/w7nXXC1Dt4feIvKT5166ngvXe/CHOIItQHXPrWjwCkU7lE38RRRJX89s?=
 =?us-ascii?Q?7NNT3iigGmgkdeGzQz7TS9CZsnWLhrQ8e4yTT/m4YvTefoFk9sim3zJ+obFV?=
 =?us-ascii?Q?aUgJNxQtAHVO1XHjVj1CPLLwXguNAkZUydEz6c1cKChVEo2iXgX4v4r9v7m6?=
 =?us-ascii?Q?BAXgP/O/vAiPFIE5WnEF5+fAaGaCoWhuXY4jyCrdQhr/J5rON9Msrg3TXFts?=
 =?us-ascii?Q?Z96Z/L+tPRXoFqbBF5AzYcaRgyd62dKAEmrDqrX7MEtlIa6DK91TzLUcykGK?=
 =?us-ascii?Q?Xj6PF1B+UDM0saFQ1cp9GNvkzTcWZREKCkQNC8qjshB95q5wzQf5GldqVGbe?=
 =?us-ascii?Q?A5hsnObubaE05SmteG9pkGTx0FAlXj/wmuQ32kCHHQX772Ctazlz4Kz2/Lqd?=
 =?us-ascii?Q?O37AxZAJSoZtvxvB1H6RLNcKvTROzZQXgSMdehVLq4vK7jkvmcnz8e0uyHe+?=
 =?us-ascii?Q?GExNLxwoBAyWfen0VMpYlXSzJTLyAgEVjOKVCeCs04dR4wpXuSyAjzpAf5V4?=
 =?us-ascii?Q?biIdu0D6X/W5e+AO9cwBbgK2VpHL3DCpiIX04besUrAEU69ygUqsHi+bBpoI?=
 =?us-ascii?Q?JBWrXVOID9mIvm6gU/AAjumgme2opMpaPW48xiQEQgyrYrLC24K+fro3YB+U?=
 =?us-ascii?Q?NLOkOoHBY0bnt+JhUJT0yHUpe1/SiRhyMtb2IKSvhvOhhKrHcbvXS0NLYjij?=
 =?us-ascii?Q?ezA8Z48i2mjtqSccl1QOyG6FBREPoJx9j9xAuUjA/6QO79Sl1UAWEDhltKkM?=
 =?us-ascii?Q?9emef9BUvdnP54SgqKmOoGF+yjir3Fn9AN0NmyO+5nFmGu85yBsoq470uWm8?=
 =?us-ascii?Q?aFEW9zpseMYJ3vMPUUFINOjMvpXoDQ14VUh1OvAfoZrUEn5ztRp26qAmBPMe?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38591bf9-c8e9-4dce-512c-08ddb92732dc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 05:13:36.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cNzjfDdckrC+Cphcn2dwMFtXyyVgvs9R6XQiSzhyg16mJwN7Rrm97yB7oEVTNEb/4/IngAtBY70u3VnH0AFQTxM6uaJ1Pz02hxHIqWKJTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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

On Mon, Jun 30, 2025 at 01:22:38PM +0100, Tvrtko Ursulin wrote:
>Generalize the wa bb emission by splitting it into three phases - setup,
>emit and finish, and extract setup and finish steps into helpers.
>
>This will enable using the same infrastructure for emitting the indirect
>context workarounds.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 77 +++++++++++++++++++++++++------------
> 1 file changed, 53 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index d2ad8fe737eb..c07fe23e5e73 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -972,32 +972,37 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
> 	return cmd - batch;
> }
>
>-struct wa_bb_setup {
>+struct wa_bo_setup {
> 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 			 u32 *batch, size_t max_size);
> };
>
>-static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>+static u32 *
>+setup_wa_bo(struct xe_lrc *lrc,
>+	    struct xe_hw_engine *hwe,
>+	    const size_t max_size,
>+	    unsigned int offset,
>+	    const struct wa_bo_setup *funcs,
>+	    unsigned int num_funcs,
>+	    u32 **free)
> {
>-	const size_t max_size = LRC_WA_BB_SIZE;
>-	static const struct wa_bb_setup funcs[] = {
>-		{ .setup = wa_bb_setup_utilization },
>-	};
>+	u32 *cmd, *buf = NULL;
> 	ssize_t remain;
>-	u32 *cmd, *buf = NULL;
>
> 	if (lrc->bo->vmap.is_iomem) {
> 		buf = kmalloc(max_size, GFP_KERNEL);
> 		if (!buf)
>-			return -ENOMEM;
>+			return ERR_PTR(-ENOMEM);
> 		cmd = buf;
>+		*free = buf;
> 	} else {
>-		cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
>+		cmd = lrc->bo->vmap.vaddr + offset;
>+		*free = NULL;
> 	}
>
> 	remain = max_size / sizeof(*cmd);
>
>-	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
>+	for (size_t i = 0; i < num_funcs; i++) {
> 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>
> 		remain -= len;
>@@ -1012,23 +1017,47 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 		cmd += len;
> 	}
>
>-	*cmd++ = MI_BATCH_BUFFER_END;
>-
>-	if (buf) {
>-		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>-				 __xe_lrc_wa_bb_offset(lrc), buf,
>-				 (cmd - buf) * sizeof(*cmd));
>-		kfree(buf);
>-	}
>-
>-	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
>-			     __xe_lrc_wa_bb_offset(lrc) + 1);
>-
>-	return 0;
>+	return cmd;
>
> fail:
> 	kfree(buf);
>-	return -ENOSPC;
>+	return ERR_PTR(-ENOSPC);
>+}
>+
>+static void finish_wa_bo(struct xe_lrc *lrc,
>+			 unsigned int offset,
>+			 u32 *cmd,
>+			 u32 *free)
>+{
>+	if (!free)
>+		return;
>+
>+	xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
>+			 (cmd - free) * sizeof(*cmd));
>+	kfree(free);
>+}
>+
>+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>+{
>+	static const struct wa_bo_setup funcs[] = {
>+		{ .setup = wa_bb_setup_utilization },
>+	};
>+	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>+	u32 *cmd, *buf = NULL;
>+
>+	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
>+			  ARRAY_SIZE(funcs), &buf);

I'm not seeing much advantage in this generalization when then you need
to extend it with the free pointer (which is then also used for offset),
and number of written words etc. I understand what you did with 
setup_wa_bo and setup_wa_bb, but they are soo similar it looks like a
typo.

Can we keep the wa_bb and indirect_ctx separate and eventually merge
them  through helpers rather than making the wa_bb stuff fit the needs
of indirect ctx? In other words, go straight to patch 6.

Lucas De Marchi

>+	if (IS_ERR(cmd))
>+		return PTR_ERR(cmd);
>+
>+	*cmd++ = MI_BATCH_BUFFER_END;
>+
>+	finish_wa_bo(lrc, offset, cmd, buf);
>+
>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>+			     xe_bo_ggtt_addr(lrc->bo) + offset + 1);
>+
>+	return 0;
> }
>
> #define PVC_CTX_ASID		(0x2e + 1)
>-- 
>2.48.0
>
