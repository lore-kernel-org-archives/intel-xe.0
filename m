Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296DCC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 18:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE65F10E2B0;
	Thu, 16 Nov 2023 18:20:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3001410E2B0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700158852; x=1731694852;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3uYaXzMwlwq7s2IlvGssibE982GIcCOg9fmAUjayAOs=;
 b=T7EAcxTpod2JnrRSddog9IApU5OX48n0ZnRO3N1zOg1CHkh5X5ZHtJOK
 fspEwFNHO0iugjAOT0O+qCTWeDAmbeTxsEdp0/PPE6MfO49S+Fs8pcqYf
 xtjODuT4SaropgIhhdPLwzM1hEtAKwQWR1QgvKi5sgxK2+lsjf/3bQoWg
 Uky0F/6+CCkbqhkOPjHL4Y/e6TvjO6HTybQuEEB1iDPuqxalzbuImZDqL
 5gJlbziNvow8/jTw+EO19o8G1rijtRQOVCFOImgTFY/b/fkDnYxnimeoj
 DsIXG+RYQSv8jfKGIRWxYYlt6NlTBLpRWmsUxQJdbBKVxF9vI0jVmT1WQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390005307"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="390005307"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="882858217"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="882858217"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 10:20:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:20:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 10:20:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 10:20:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc7lgvUMT1NjSW4SywNGqsffGN0szec6N4n7ki/l3Nbpp3kvp1lhZPE63DfCwpgrUHUTFzT8F2pko4I/zJiSj60Zi4W+0t32OgPmI7ctnuYtePEijd9N0AN9t2EpRqXGp9SQlPONfUS5O35L4DtH5tkgX0CtpiMTuU7szZtshN1CLeEQAr0VdFImxRnlHBKuD6hMdm224ytc4qW3GivlQ7/+Y3VEfBI4JPUAeCjreg9oZj1llJ5oJETkFnwSNyeldd9SsOxAQ4cdSQmek2OCEPQOvKvIKgalF2ZBwi4nvHfGjp27TWDwS5u1+m+nmo2T9B1W4CdRGjghWARc1w/fVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsgRuXV9oIRFfkGpkgdgiJ69tgD9vSShi/nfPhXU5kw=;
 b=BcIeFxnhU44HZNshK86Z5WJ4/ySx5Nbrgdo07Oom5aYKH5LIQ/rdrbCur/Xwj/+PzmhGSpT4LpzC9ZDXIIIuAKROukK1StOX2kS651LMFeuNyUvsIT/Wc24FyaUjtKu9r6m7O69fxkSspwi3dtKDpSQSbYYcX32SV8zCGPQlKBGR8JIRGGoayCsbwLw6p+1YDtQKIhbZEmCbxjhItHzwBaKb3URIybgX2ohnGXBM97R0zOKRwt75gMDIOxAmxNith4bhZ0sRtrOiDIahiYRJBZM1Wz9DbpQF1CjnfWnQCMaW3tl+8ynXmtYwmY7V4piWJlFsaFNRN15gYqlR/vznQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 18:20:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Thu, 16 Nov 2023
 18:20:48 +0000
Date: Thu, 16 Nov 2023 11:19:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZVX6wNcwSNkGFoUE@DUT025-TGLU.fm.intel.com>
References: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
 <ZVXin+3VAGkegHGZ@DUT025-TGLU.fm.intel.com>
 <faee7a62-4c95-4964-a275-c4cc43d8e502@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <faee7a62-4c95-4964-a275-c4cc43d8e502@intel.com>
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf87319-0065-41ab-5870-08dbe6d0c1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q0xg3g4ZKNcxSHHZuD+v1dBHDdxiZ3C4TALq9ngUIC76ziTQcJPozqQ1pzYuR0X19JaB1bNGgNjOuPPHEZnV0qEjw18Vny6C2aWo7vddsIJ6n2lWUzRVJO0S2z7AbEhaE+ILvx4qpol5CiquYaeGxBb6A0swwE+PqBbUjk6BE3uFzczJdapZbvkMtaYPDYCGLmXKsIQeVDvT0+LeAFiF729RqBtzEUCdHBF+941UVv1bWhCGzocQbNa22TzJOnMKvzSMYRxVfRqTUMThFzkXQo1vxeLXadYPYrwYf3Z7r8ox9m8wj6WwHcabXEWnOAHrfhfRwPuuUDDxjNg02dLsyEW6+ys5rF4eLKq5rUsNUzJON2lFnJeYfzqcJePnWuTssf0/DCwsEaBDR+oYFHJUs+MtbEjyfkDlbabFJhGZGgn5USeA0bm5Ggbd6CBXskIEIerUkTyUbWAnw54jsU6RRHuUYPSZYYJX2KHf+MOb9Mizm/Ja0pNehkiQU9G1MCpNps5xFNTyo2pkVsaZ7jUzQykVqNiv0xjMMtKoXhW8DeAlbXKJZKNd5tWHJfyZ09e5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(396003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(83380400001)(82960400001)(107886003)(6512007)(53546011)(26005)(6506007)(6666004)(478600001)(6486002)(86362001)(5660300002)(66476007)(41300700001)(66946007)(6636002)(54906003)(66556008)(316002)(8676002)(8936002)(6862004)(4326008)(44832011)(15650500001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F+12xu+l2as2fYXGY9FNfCuUsBnT8g7Z3Uj+EaRd3JBtbZVPbamqHxE9f0SU?=
 =?us-ascii?Q?FinBme02h46BFMv8LSrTn/d5fJBNs4NvVWWPxyaD3SwstZjn+rfqMvRtootg?=
 =?us-ascii?Q?qhf4t4F1nnl5Gd6LTPIelrt+NZmcT2WXJ+WZbwsuX0C2CsUBPruPHx3Po5VV?=
 =?us-ascii?Q?/f4rl2C1UO13wrScV0PweaE04EO5viiz51f4NkStwrDL3MqitRjMLsm38tHD?=
 =?us-ascii?Q?eI1LdzO9KJezTUrhGGZ5AR4WZtB2FqYoCRtfouAh2718AQhAhYECJdngib9o?=
 =?us-ascii?Q?xpt4lVIN/2qrXmIj1BG1tiB0iJX3UA3ERlyh2jRka72avI5enI1UuQadWS5D?=
 =?us-ascii?Q?Lq7qDRcNEQuBM7X+wsgxbUm6YAS2Rprv/SSL861tVa1MUFSDkmJRCY+D7NIz?=
 =?us-ascii?Q?Y4Znk1AE/227dGvkfbDlL9hkT0+vJzASQM6s5SP9eRESoFtl3Y5lI5UESC+5?=
 =?us-ascii?Q?oUmlQbLC51rRJDNLBAlhEDkhVQKW7TgRvzAMzqjUdXNcuaPQToaG/Cm9Vgjv?=
 =?us-ascii?Q?GDp986KV0Q5yPrQwqmEjtz2OOuHKZvZOA6GFxVxFAMgWCOLSsEeqAnz3Tk5h?=
 =?us-ascii?Q?TM+894ToIsoMBFS2JJUQyMmBCxWVxc5D0tgUXJqtlPj8FD7dXLHplsA+jLGB?=
 =?us-ascii?Q?zlC/couO5pO3gCqc6E5gvffKsphEvQPK73FZvHQH5Np1ioZ2cy7F/WohrtAl?=
 =?us-ascii?Q?OVfTqAhpb5F6ZxlPMGBlu2aK234+R2UK+Q0sij80Ss1g9KKrcKzIeeJXEPcP?=
 =?us-ascii?Q?a8rPc5aBqlCF/S/Ac+TSQ4Oa5xrIc22zfczyBZRyPDco+opJJSCBFZ4zYXAg?=
 =?us-ascii?Q?wx3DnDmSNPuPo5rvdQeL2xA+blW50ZSW0Xd1Czn0sOKSvsOy+uOz3Y1P/Wbg?=
 =?us-ascii?Q?9dwrPpNeO6v1Y+ifRcLQgfNGa1OiI3XL0xaOGv3FgYqD+Y+cagpmP1QU5aMS?=
 =?us-ascii?Q?IoKRAOBJvfhoCxjRht2NMRngGgWVhU6ziw1DsUomWWwPBbdwUjmFQimVgeYl?=
 =?us-ascii?Q?5QrC73zD3x9KcZ7qTB3KjG2X79dus8jXm5ZExQMaLCZWlsKuq8nacRPRRPSp?=
 =?us-ascii?Q?gcbEJhG7HSpMHI0vfxA0gaXYOdoCEFbv7LjobMhRcb9kVlOH2PyiPSoGEGL9?=
 =?us-ascii?Q?Tg5LwI6M2RrzyAWAtcPHsC0wuV4LbQSshMJARQF4eLEUhUtadPw3HtRnt8L9?=
 =?us-ascii?Q?uzXMrGnI0o80YTDZWldIHM3g/hse/5PKCYGFq3JQmYs7KYzqqSzcV9LqW4ua?=
 =?us-ascii?Q?RiRGPc1Rv/9yDSEiTofFBSKhgoATUGv6m+B9umy+/n8lcU2qZeaVMkTaIL4C?=
 =?us-ascii?Q?IiZfIah9j+c6Hy475buHhxH5GHIMjb0QqZ8uWG4FSijd/BvxwOFYK1v2hvz9?=
 =?us-ascii?Q?KQcnlgoEISxGsXOHaQ97c/wcEU/upRpFkyNF3wMU0DCR7BnMufUbucSwFBsI?=
 =?us-ascii?Q?toKswAw5xy/ztf+oWY2BjEnfGxX42ajddyBDyzO5ZwsSQDnZuGxk2RsHPW4O?=
 =?us-ascii?Q?kjT9ZD/vVGNk43S2BByKMYJOlDUZyWWDWnOMDNlBh3AyZYN80XGattwAJhhG?=
 =?us-ascii?Q?rlgSUMMhYOXyH8nOVcTkLrSCKW9clFj8iQjqeZtB8f/Q8h16c+GICpre9rN8?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf87319-0065-41ab-5870-08dbe6d0c1c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:20:48.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRDs/8E3eotfHe3cAVYEFoL8j+srpjv/qK00DzBviHb18WqKRrVTZtzx5qYbxsyFQW6bP5SlEjjhzf5qqefeWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Use FAST_REQUEST for
 non-blocking H2G messages
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 08:50:51AM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 11/16/2023 1:36 AM, Matthew Brost wrote:
> > On Wed, Nov 15, 2023 at 03:40:43PM -0800, Daniele Ceraolo Spurio wrote:
> > > We're currently sending non-blocking H2G messages using the EVENT type,
> > > which suppresses all CTB protocol replies from the GuC, including the
> > > failure cases. This might cause errors to slip through and manifest as
> > > unexpected behavior (e.g. a context state might not be what the driver
> > > thinks it is because the state change command was silently rejected by
> > > the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
> > > type instead, which suppresses the reply only on success; this way we
> > > still get the advantage of not having to wait for an ack from the GuC
> > > (i.e. the H2G is still non-blocking) while still detecting errors.
> > > Since we don't track the non-blocking messages, we don't exactly know
> > > which one of them failed and therefore can't attempt to recover and need
> > > to escalate to GT reset instead.
> > > 
> > > Note that FAST_REQUEST failures are NOT expected and are usually a sign
> > > that the H2G was either malformed or requested an illegal operation.
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > > 
> > > In the testing I did locally I didn't see any failure responses, but I
> > > didn't run the full CI suite. If failure responses do come out from the
> > > CI runs, I'll try to fix them before merging this patch.
> > > 
> > >   drivers/gpu/drm/xe/abi/guc_messages_abi.h |  1 +
> > >   drivers/gpu/drm/xe/xe_guc_ct.c            | 28 +++++++++++++++++++++--
> > >   drivers/gpu/drm/xe/xe_guc_ct_types.h      |  2 +-
> > >   3 files changed, 28 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> > > index 3d199016cf88..e517e2a740d2 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> > > @@ -46,6 +46,7 @@
> > >   #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> > >   #define   GUC_HXG_TYPE_REQUEST			0u
> > >   #define   GUC_HXG_TYPE_EVENT			1u
> > > +#define   GUC_HXG_TYPE_FAST_REQUEST		2u
> > >   #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
> > >   #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
> > >   #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index a84e111bb36a..81d727b72709 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -448,7 +448,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >   				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > >   	} else {
> > >   		cmd[1] =
> > > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> > > +			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> > >   			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > >   				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > >   	}
> > > @@ -505,7 +505,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > >   		if (g2h_fence_needs_alloc(g2h_fence)) {
> > >   			void *ptr;
> > > -			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
> > > +			/* we reserve fence 0 to indicate unset */
> > > +			g2h_fence->seqno = ct->fence_seqno++;
> > > +			if (unlikely(!g2h_fence->seqno))
> > > +				g2h_fence->seqno = ct->fence_seqno++;
> > Good cleanup but looks unrelated this patch.
> 
> The code below matches fence is 0 to FAST_REQUEST messages, so we need to
> make sure in this patch to not assign fence 0 to a normal REQUEST.
> 

Ah, yes. See this now and makes sense.

> > 
> > > +
> > >   			ptr = xa_store(&ct->fence_lookup,
> > >   				       g2h_fence->seqno,
> > >   				       g2h_fence, GFP_ATOMIC);
> > > @@ -792,6 +796,26 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >   	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
> > >   	struct g2h_fence *g2h_fence;
> > > +	/*
> > > +	 * FAST_REQUEST messages don't have a fence and therefore are
> > > +	 * not tracked in ct->fence_lookup. Note that those messages should
> > > +	 * never fail, so if we do get an error back it means we're likely
> > > +	 * doing an illegal operation and the GuC is rejecting it. Since we
> > > +	 * don't know which action failed and therefore can't attempt to
> > > +	 * recover, we need to escalate the failure to trigger a reset.
> > > +	 */
> > > +	if (!fence) {
> > > +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> > > +			drm_err(&xe->drm, "FAST_REQUEST H2G failed! e=0x%x, h=%u\n",
> > > +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
> > > +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
> > > +		else
> > > +			drm_err(&xe->drm, "unexpected response %u for FAST_REQUEST H2G!\n",
> > > +				type);
> > > +
> > > +		return -EPROTO;
> > > +	}
> > > +
> > Was this intentional to before the lockdep assert? I'd put this new code after the lockdep assert.
> 
> It was intentional, since I'm not accessing any of the stuff that the lock
> protects. I can move it to after though if you think it is cleaner to have
> the assert at the top.
> 

Typically I prefer all lockdep asserts at the top unless it is case we
are intentionally returning before the assert check to prevent the
assert from blowing up.

Anyways either way this patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Daniele
> 
> > 
> > Matt
> > 
> > >   	lockdep_assert_held(&ct->lock);
> > >   	g2h_fence = xa_erase(&ct->fence_lookup, fence);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > index d814d4ee3fc6..62f98dcaeaf1 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > @@ -99,7 +99,7 @@ struct xe_guc_ct {
> > >   	/** @enabled: CT enabled */
> > >   	bool enabled;
> > >   	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> > > -	u32 fence_seqno;
> > > +	u16 fence_seqno;
> > >   	/** @fence_lookup: G2H fence lookup */
> > >   	struct xarray fence_lookup;
> > >   	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
> > > -- 
> > > 2.41.0
> > > 
> 
