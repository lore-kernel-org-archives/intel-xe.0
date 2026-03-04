Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C827AEFCE49
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 21:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DD110EABF;
	Wed,  4 Mar 2026 21:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2OPbLVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F2210EABF
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772660256; x=1804196256;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NH59045FwttHiBiBlFJyKajjpHQN4HKcXhuGOoCtVY8=;
 b=n2OPbLVzZtPrdA3qpQYEIaReMMJoWmbSEb2w4goCn7x4FSNAJC/l7uHu
 tMOECSu8KRkg2X8+RmW7EO/bhZSv6Oo635ESOU6sbDOcxkOeak4eDff8P
 HtrRk3aUDTQjvOVcjjUBTUHHG5/FX60I5K9hryItY1pxrwWHegKQD+Glf
 YRS0ROE2GqGlDd8+QzwktN4GhNeCYpXCfgyQJlMYri+Fh2LjqEYAiVMXq
 fnrP+lK0EorakuHuhe7mh941lmyn/OS+uetJ/2eK3jnw6p74wdMNj19jX
 eXLWSBEuM4pM1l7ZOFaHr0HTr7H5kGCxn0N8yMv6200NG0s1lQikaSGJQ Q==;
X-CSE-ConnectionGUID: hX6B0P1uQnKTts2o4GteNQ==
X-CSE-MsgGUID: qfwiMahIQ9+b0YASXd93fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73641665"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73641665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 13:37:35 -0800
X-CSE-ConnectionGUID: Zw++0zCVR+iXz/yGotSAPg==
X-CSE-MsgGUID: Sy1Zt78QRtSmbcDlLueKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241478399"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 13:37:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 13:37:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 13:37:33 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 13:37:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3G8DCBshOCW3N6c4dCmlHeuU9mTJPwIqw3kb45VD1w5oy8bA3SDDBhR9XPr6MnZ8sBiWg6ibM5y5mJ8L6udARgflA72WAl+w2IXcwuUJXHIMI2lkIxJhoneT+DtDmwUlbDSdXwpEQ3cDVFEDoIb2lUKiILQ/s6dM936mR+/C2aYwwnFgvAfJ5lIU+lxBv9cKdU8hIR/rwuvBJQCBmaoXBcxSoZz81xDWRYM3NurKT0B/KOLOoJeKLm3ZuZKrtNc8XGDLqowa9ikDILK/mgdO4FHPK24RYGQ9blp2ZLqP4AwIK8vxBC4Rjw4wG7N2p17Zx9a+C4BMFjRAJchOWyPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzUFLXHXUm2ERnzBpkkwSdqA4LDfcEza2tR2OqZ+usA=;
 b=cVaZLml+mvmeiiLmuVnEWIUPcJGN6Gp0IxngxDqmd8+s6KuR8CjHGUCdP5ezLHdpGNJs4+mshSiyP+wDr4tl98MZ2C1/f5fnlAaMNReeEAzlP4X9qv3pGa2xu1F7Xsmz9Dhpx1vsZElqzONmtQMYShR0jfj6v4bObgmIRzwuzzktxWm4cXQRAAsWjeDkq3bBLYQvV6SOU8avyfIUk02nEHHCLpYcd2vOQkxIzeKvhPIYA6SK8o+TpcI+DJT0KsiktYGHyUEkrciOSLknKmnd+hUa0CZN5OcjX/pp8b8e2RD1SX8LbUauCZ2gYcDAhO9UOi9siPDvlui1L33jj6eEsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 21:37:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 21:37:30 +0000
Date: Wed, 4 Mar 2026 13:37:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix overflow in guc_ct_snapshot_capture
Message-ID: <aaimF2mNdGqE4l8C@lstrano-desk.jf.intel.com>
References: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
 <20260304211728.249104-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304211728.249104-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3dadfb-28d6-44cc-0dd8-08de7a363cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: DBPcg7o96Ykw1SOTg3x0LReppmnBH2XmizDXqamu245yX/ze9K/RUSJmv3vzSM0hzluFzvjfgvC8LMjYFkRgKPYi3m3/sgb3Kc+48ryBDK7dhPZuq3S7l1hdgr6SnWISdU5QENWk6s7plgTH8V5HhmP1tgHekV9OuzzHbuOK8x9clnJtXETW/Mv+8yCddg1rNuhGPLXPjhMPiiH3ONH+fybM+GP0gDuhgW8NPUDqLXta8YtZAmOkfPLCEqdQm+uC4OtUgmhQwcN8FgfgSDhhuu/Mf+YIXPNFPI3lvxgf4MK7YGFnyAqAauMwRGi3vVGI3yVbvrOC7Hzrab1RfHwI9cVF9pB5fVUc4rgCDmF9DXWK6YnDtvmlB40jAVsiDpZGyMAHYvf52N9TLctOHT+Bvsw1Q6aX0RV/wVryr9ZBD4ROMYejpgjNRvoQnKbF9fZNk7J10L9yqugBHYD4lSp/by0kd9kHKjksWzK6oadXin/IasyStKZ5lmWc6IBM49XdMAXzHnZiPzEI3Bsc/k7/02zOj3vrD7vUZOfkioVRWdOZVr3QVsz3IlKoZG7Omb0GQ1WGwV6s1y4Y3RMR7rDK8yTghiacv8pOOZKuI9hu8vwk35UN73XfgMIvJIUJGXABZM4RlNkm/G06UUo/ZRIxm9IpSoh9+ZSriNvyTTKwpKJO8zL+AEt9iMXF6KK4yTXz8vlUtIgBDumzjh4htagpXchm4e/J/xS0PMBV6WrMyk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/vD7ypuY3nmQ380qV+aS1yNErOAVqV6HUEz7a0cbfRrt1HXXS44foHZAoW?=
 =?iso-8859-1?Q?itaUnFphYJprhUTs0gB1lFDez9zYs7cq1XQDSytOyRgPWcvYAPBq+/rgS7?=
 =?iso-8859-1?Q?++4+hxwHrKrWPX0VYCxa88AWukasX4jNrmcXoJUp8zvXIOtXABGo08762p?=
 =?iso-8859-1?Q?b7k/sK9bxI+WMMoBoZ0ZBOz7twoiGst0RFfWCCIIwa88MGVQgP6ID96meg?=
 =?iso-8859-1?Q?WA4jx521ouJ04C8QGwHAI8iMxk17/ieqv7nOmVtB8tF5JqveS9JwLptxVW?=
 =?iso-8859-1?Q?h6whupOxAIwNVv0Pn8SW763lDNFwOL8XIPNAwNZS+6WFJoH4EDTNZT4S18?=
 =?iso-8859-1?Q?jr8Jy57iieQ5v3w6FsKN63BwrcMLliAnPHY2kqwauuYnAYp0qsKoFuInj6?=
 =?iso-8859-1?Q?hl4x5XGdwV51h/n76zyyyxG1IRAXAXmak06qsIMqZhaqi3T2mIjcjUs0ID?=
 =?iso-8859-1?Q?ug+QQzCEofj33QDxcIme5Ol6mBqcEBieZFLJwEENbwMPzyZWeon4qRzFt0?=
 =?iso-8859-1?Q?0EWDOeyrmLt7pD8qk4Cf5fJZPzw01xy2U+9MVXAoPjbPKrZ0HISd6mqGqd?=
 =?iso-8859-1?Q?ZV4Ind5/83pbdeUlbtfoNt6UDZzQKh/Qu8pNA5b80RLK4QsiWoUTUMC/5o?=
 =?iso-8859-1?Q?KFlRsaQz8RpBV8SjqH1xoKyJU9rM8DJj0ZvR5JGkqaHZTYX3NXHrSYMD4A?=
 =?iso-8859-1?Q?vLGJkQt5J4VeqVNJRVdpp4M1LoWpdrY7NNL2QX8LI8534WRw6fr+lz4k/i?=
 =?iso-8859-1?Q?j8HAP+Sy1sajY4KCWUOEIdT2mdg2Lom7yqgAAYuWjk41bej8WgyPI5ovd0?=
 =?iso-8859-1?Q?gpZ/Lrue3pga7su6x8VIOO8M7Qh8ljlPFqWoYbPScu6iIjU3YHAERZ3xFa?=
 =?iso-8859-1?Q?z/wBPCee1X0oDVfO89Toxc+/X1D9Kp6rIKkyGQMicjoeHpc3ivNSjHVSv5?=
 =?iso-8859-1?Q?04X1LqPG1U8XkqnGGqdZGJY4ZucHOaoMe+ToZwGc9pCv7WFWkMV3rhNITZ?=
 =?iso-8859-1?Q?w0nGOzR4PZ80Eq1KKgA8k+tvA9YezI6p7u7Pqe9nQDtSt+p0wkscWMKNJF?=
 =?iso-8859-1?Q?RlwnyNi9wuNAvkdeCuXV8uFKu7eKXGUjfxjGgwQKK1O45tkAJSKSwsnold?=
 =?iso-8859-1?Q?1h/UgJT2O+ju4giguv4NrzJCefXoaSF/ziC7LRZubyME6ij9F8MP2L+p3t?=
 =?iso-8859-1?Q?5N0nE8ydBDg/9l7M7rCwe3YvWGtf3Di8SDDNKpUck+NRS+mKwD98mH3WQ8?=
 =?iso-8859-1?Q?AJzW9VYBuO3imHdhpXvcEycqU5pVbW6G0d+QLwZNtxl9F3jNGl7/NqcTMb?=
 =?iso-8859-1?Q?ly/t3/LLmkrsaQtYQflR9QXuQG75t90GeyTXQYKTY/SEIOC8okh/VcUOd4?=
 =?iso-8859-1?Q?wsanIBF/fb49udUPgLYOY7SiYnlb54hn0HageqiELdAqdUgOd3t5xP3ffW?=
 =?iso-8859-1?Q?Y5++jqh5cOiYroT372IEx5khjYQjY+3HdVnTyfzPb/FNLxSMTIJb5j6bN8?=
 =?iso-8859-1?Q?Bf9sfgkK2HAlVb/1Q1efAznerMnyI9H3F9/E+tDArvCUZjWqfbG39MkKMU?=
 =?iso-8859-1?Q?Uj9+1IzHR+9lOaTh9GlgINcIjQPVxb3TjLk78A2xMUMX3pbxI9/55xg3CX?=
 =?iso-8859-1?Q?HQCy3s0m/hUuu7XmY9E+HEXxBsdxvDKL/JwiH2cMmDwc6G6b7MwgzTnNyn?=
 =?iso-8859-1?Q?Y2NfR4Zvcw8VsgKus/QCoszclHUx3MbIWl7vB37+6Hl6UuBAcTg2ayh7C2?=
 =?iso-8859-1?Q?rhKuIAOX2AqtPuf+ZMn8beHeze11Sh0XwIkz5QxWsTHaYr7SZv/JXOrSr+?=
 =?iso-8859-1?Q?Z9slgTp6C3AuhV0MhdFwEXVR6BBN9dk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3dadfb-28d6-44cc-0dd8-08de7a363cc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:37:30.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjZxFBWa5V2voqnBi1hkuGlSfi4YHomgHMKq5k8TyA5LgrZrFiRdea++AiJKNivgRt129k9K0BAl2qiccg/a+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

On Wed, Mar 04, 2026 at 11:17:28PM +0200, Mika Kuoppala wrote:
> snapshot->ctb is u32*, so pointer arithmetic on it scales
> the byte offset from xe_bo_size() by 4, overshooting the
> intended start of the g2h portion and writing past the
> allocated buffer.
> 
> Fix this by using void * to get the arithmetic right and
> prevent future mishaps.
> 
> v2: s/u8/void for memcpy and iosys_map consistency (Matt)
> 
> Fixes: af3de6cf06f9 ("drm/xe: Split H2G and G2H into separate buffer objects")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 46ad1402347d..5da1ce5dc372 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -74,7 +74,7 @@ struct xe_guc_ct_snapshot {
>  	/** @ctb_size: size of the snapshot of the CTB */
>  	size_t ctb_size;
>  	/** @ctb: snapshot of the entire CTB */
> -	u32 *ctb;
> +	void *ctb;
>  };
>  
>  /**
> -- 
> 2.43.0
> 
