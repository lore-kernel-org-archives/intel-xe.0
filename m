Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40239EEB570
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1508B10E949;
	Fri,  8 Sep 2023 20:33:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF9710E94F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694205206; x=1725741206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9rugTVxeOq63W/mryCpVr0xL7lWarOYg9UdxXAhVctE=;
 b=DT9hEu/PA8u79gLcApVp71F70x27zM+PHudf1Vdoq5UAuvnTtCIjWGVP
 O/sq2/oBm+MH0DBph5kFo7MinJWh35RpmOPhkVlO3/EnXXpYOfSFIKiXe
 lmqYJxy7WSnxjV11YISRp6pSrLSF2RiddVgL+sNiaesMVSpf6w/+jsaiG
 k7hQTsmb/SllGOJ0uOTPYY4qQT6eKVtsvftbnWMnZK3aaFFWGUrlncFk9
 S6XfsOuBC9/9umSl9/OwDGD+iN34Qiu+KpV8YKRKEx5LJsWDCl7gRu0km
 t03bL9CrNmFed+J8/SjX98s/U9m1Azf8YwkqN6dTyDOnr6cw8iCyynsqS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464110354"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="464110354"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989395920"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="989395920"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:33:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:33:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:33:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 13:33:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBbddYnLHyLvQj40i2QEeVJPrp4fdF2TztM6km6DmkcuXKaZCewgCarPMGOEjpSObTQspQMsPvRer5RKlEk4vsnF9QzeDgnki4CFu1MFmjhI+DeQ0PgiNWQwLtS1UZMEWYQw3Xb2k9VsRyZzbL17QF7fn1mPOdtrHYZkZ8VYfatPlWMvWnRwHsncKwdTPdzXrslQhegc8uyhyJszrJtEKC620B/IfKBZP5Dp+4M1v7vZDrqUkYRb0Ke40jw6bR/wSg2ipm9tVE6q3dUarLZOwe4j86+F03A8we7IzJBUkC5yQuc+8FRxFBO9GG13VW2c8xgcVzE1beV6X/Hl7+njoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMzF0XA70HDQYNVFOiSmljDuQik+RwbFArVI69gqFLk=;
 b=bE4ueEAjforqlZ8DO38Z2OyKjhyMeK5xjU0kZdugFSgZ5NwL+nbgk2J94oYbWXyYKKzw98DnWjsTK7NMfcVwYthbYyoJuCCSeXLAbsijVZVks8s8KPjjZVtUvdCBWWCh6bptSfuyPYk0iyB+JMlVLLXakPnsd2biCqBGqnDFDo8le4d2zCl82gebkR09DwjlgmWhSJVPS1sO8it0By1lI383qxwhoaCyKJMBD1RVq0maHY6yn8Mcwj6LPLAHWKQBBxqdngQK7OhlxccCkzC6+AKMX/68JbTXAI7Oqi+L7mAgKSukh1R9HWFfW/zovVlis+GN5odEBZvtNjSJy7O1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:33:24 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 20:33:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 16:33:01 -0400
Message-ID: <20230908203302.449041-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:303:8d::6) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1a0b97-3c58-44aa-53f9-08dbb0aad93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwBeC/FNWMxlgdlveA88c6/zX1bubwMPe8DLA3f57WafuAxagJjDCWS7Ka1smhBmdTKKbSeUbYmxtJp2GSP5xKr91jneqkyJwEmQk74z2czrzyfz5TJqNKeI8/Kp6ZMWgZCKhj0U1o2YmjNFerMr4+wAC6kmllNek5Qpru7cx2x/NPphzlVM0bm/ReMgcpof8oZEj4R4bX39lSpRnpRnQ8W3+2Ry5+SuaiJR/GuePQ07ufwHS/Ijw/SC9uBvFYG5ajTQzh/0JFU1qiMTMRdIxzDbB3wZr2HESyQDqsCNv1S8UMHcdjKdaDU08dLSdtvh7grvFNadC5StlSfAx0RixO9yUwDRzhfxse0f3yJ/NhbaNgsJ5/iLN1L5HX+vIEuFhTwUzymqWHCAYFWoqAz96I17a2FLRDptvJr2Z/9ekK/5tVu+QIL/MDHtkCDDbsz0371OKmPZuWxuVlqsbp63cZe/bMiBhXGhnfLEVsmxRTFWEe63VYPRvdoW7UeTIMBEdcFj4srtNaBvr4PVfyOG07/Ya8QlSI64BuBBsFbVV5KlWDJrih8vWHXv60kqEfCE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(6666004)(6486002)(6506007)(6512007)(107886003)(36756003)(82960400001)(38100700002)(86362001)(2616005)(1076003)(4744005)(26005)(41300700001)(83380400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(44832011)(2906002)(66946007)(316002)(6916009)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1cVC9T0cqjXGoN0Y9RAO93EiI/79N/aKxKAJzHK0Oq4uksDC4QbxZg9lWlJ?=
 =?us-ascii?Q?m0uy4OYC0cn5hiQeUn4SBM8aZrUrdadxjwKJlF6EV2V2LLCj6YvZzcthsEgp?=
 =?us-ascii?Q?57V29FlhZp04Ob36EFETPnnixr6gDIsf69ybHsUFIE9WNcMFiW4uXtscUePn?=
 =?us-ascii?Q?zNNEgz8b0yXYInnWrlPvykj7MTwo3ooc1nxnc6CjbDP4K0t5a8DMHfmAiW1b?=
 =?us-ascii?Q?JaTeyTqnkQBFi0G6b3z7pApvulqwUgDpvl5zhZ9cKUQpEIra4XwIfG7trA7h?=
 =?us-ascii?Q?82nFjHP49KN+xfg+G38poEjDPi8dOkBkpUPkG5/QTM6k18K1swpHUcPqehm0?=
 =?us-ascii?Q?tKMtq4VAP3v5EXjrJyGO+nzvoBh7SAaNHWxBKmrnEJHcGek88ztMDjTYOhUl?=
 =?us-ascii?Q?i07utroMyrggraqitmqcRO1zjkU4hCxmfOsVY13YYUpTcc8yyntJQDJGic4d?=
 =?us-ascii?Q?x1A36EBugWfJzziqvn/6Q0O4TqHmF9c5rOCxIB7A/h0n4TgOpKDdHxsXUb9u?=
 =?us-ascii?Q?QfO8qAq9FdT7fWL9YckWDd/LQ0N/JYwO6Zg1FI8Bm+BVc6zfEyval2ceKt21?=
 =?us-ascii?Q?VrZFku+C0AO/JSB4kdn4A7JGdZt+PecwiV8K2C4GuzK9/UEGyOS2zOB2WQdD?=
 =?us-ascii?Q?sf4ej6FrAoIjSSilF9bgF0bKk01q5rCRE5rxH/PNyH03lI53/F4eeSO1BSg0?=
 =?us-ascii?Q?BPvhDk3XZZERXu626wrO6NPtkiyb+bLnjrOj5KokTquNmWvTznalU02ZB0PP?=
 =?us-ascii?Q?1Ttj5320mJ4gPcBxEv8CL2NO/mSOM1CPKRTw5r9BpDEoMw8KEHcDSZ4jUggU?=
 =?us-ascii?Q?mdPePxm7AMl1R9jRAwfS8oY03pULlp8oOAZFM+wQwFixDghxj6lp23WdaJWH?=
 =?us-ascii?Q?kBu1VQWVQk9s3415FpjB8utGnzeVt18n1FbJQdDZRNXWteDfbXQ7/X+vG9KL?=
 =?us-ascii?Q?7LXpKVjjPTBc4AU2+BerK2d7GfMt4kS2WdV/sQr5Oublvj5hPkECCUk6CUsQ?=
 =?us-ascii?Q?ebl4ZVOZ1hwUZwxgqFTOoDYOOEFFtMWN0jk6TIER5Gm9cnoR+dFoBBv9Mj/x?=
 =?us-ascii?Q?q6mHBNw6VJGvQrvGg3us+pZR3F1PFUm34K/PmekcUBpn5fCeV5Kq1Q7jgzeM?=
 =?us-ascii?Q?dLIc4VmVAP6eEDWx1rleoxsjJH9qT+ecerZMSbM5A2W5tk0DU6bxvJcdkXTy?=
 =?us-ascii?Q?jobSDT3a60vYAcryagRua94/FjmLxlter6lC+h6tQXNjmFV8OgYHJujiDb1I?=
 =?us-ascii?Q?iZ8wjpTKw82wnwvCuRWC+BTZ55SevzLcaFKy5VCmorIl09gIDi6hSlnG/el5?=
 =?us-ascii?Q?KpiCtnwx5KkuaxDItGYtoeBIq3iUl5MSgkTdPWM2yspA4RNYqPEQ8yf0QKuP?=
 =?us-ascii?Q?ueDAGaS0txEtqhucQe4UdN7OLuefh5O903CnB+ydNIBCNR5Fefo3asvHf57b?=
 =?us-ascii?Q?cCyjUdh9T81RdZNganmMWtBZX2bfwfLFVQUNTPwo5Rc68Awm0zte3RO/hR0b?=
 =?us-ascii?Q?GHm9A3sC91wxgeH1K6CXyuoIS3FuOLh5PSOZjz7c4nu3XhlbzG2+gy0424oY?=
 =?us-ascii?Q?6vqnE3P+gHUtH5tnn9FWpIfVBG8W/sCAepSmIEPi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1a0b97-3c58-44aa-53f9-08dbb0aad93e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:33:24.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLlIZ1p1D9t+ssFBETTcFjW/keq0zbx8ITFbaJclc1PmmUz20n33lMY570SvGoKk0XizMRzmdcWzezGb+/qf2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 4/5] drm/xe/uapi: Remove unused field of
 drm_xe_query_gt
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We already have many bits reserved at the end already.
Let's kill the unused ones.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d95111944c45..81cdd3c95f2f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -280,8 +280,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/** @features: Reserved for future information about GT features */
-	__u64 features;
 	/**
 	 * @native_mem_regions: Bit maks of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
-- 
2.41.0

