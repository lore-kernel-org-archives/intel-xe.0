Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC42C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 02:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312C210E111;
	Wed, 15 Jul 2026 02:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsAwLwr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AF910E111
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 02:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784082763; x=1815618763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KHaSZY5OBdkoFABauDw0YZ8TakMGCs6cFr59eYlcPSo=;
 b=WsAwLwr4pILCAquRXXlLAn2uxA3TKo2JN/55bqu2OSvXtO1tJ4bqH5rZ
 AUlcj05jfvoN56mT2sandoyye4V+VrRkZ8/zBKQbyKU7+hUHiDFgixc65
 pIXIuygdEghc65aGBj6fCSraNrQqscJtemuCwa2hnOIghTTkiUC7B0h+3
 v38CdVVl9BlqISHpVLaGbmElnuxgqU/zlByjSNs+gMk/xtAVopP58vJKA
 D43NAddZOpLC5cd7MYay2GAnQ5eaSajMNlq0gO+eAF3YyLWs9Q8KlNmqL
 FbMC2a5/5NlyChZw1pkrbyoqkJ4UEcdyIn7KzNwdwvyYTu4OseYxGAGT1 w==;
X-CSE-ConnectionGUID: dy2ElhWLQJOaDNXlS7w8vw==
X-CSE-MsgGUID: fbFvu0/7QTm5dUE/hMlWCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84829313"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84829313"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 19:32:43 -0700
X-CSE-ConnectionGUID: 8RnkfNRGSQuiCJRZcu+SeA==
X-CSE-MsgGUID: fLzRkaYyRCidi5HWT3TLpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260327210"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 19:32:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 19:32:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 19:32:42 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 19:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqN3nYjmRoyM8ie+igsn7WnO2mcjvN2KYJKSJ3oh39eRHcbsM7k/XxxE3NQrlqCMP+efpYMZ7sUly+wLSXPTvTbp6koFW7Hc7qKyNU8FzbwOxhnneD/XXlnBEWNaFYSwZGB/W8Lp/koEagAkJddVca3O2D2/Jlt+MhSiTjFkubx/jfzSXm2p8+sgyu/HnNPB+uGLPLgWaUiTC2OSf+ImgnMqD0GS5APQaZaJl9yxjnonjtjUGskZSWEsKV/0QiD5hL6mFVAyjV66NXZb/SwbBaAiBCt/PVa4F6lWe8DZ3ix+kStAhhP5dBlSBD50JE0SbJAeECu2alJ7T/QmxyM0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZN5Jbw9GCwRIFRSAcf2LbFqbeuix6drTSIsPhfgphX8=;
 b=o6s+ejkTnsbktpSQCI+wtjtxZ86NON56C1aFlo5oFkzNz1gb6qI2quEgxMjD6xSmb8HTmnAPc4Wc35HyaddjaxLwPCb91SRAgLuymCBrgWePYtmxuKHE2c6m1YRVU98htKejfktLC7pxWNMPdrGvzK0Uc+n9QwhaFa27dmOHTREposSrWia1PiQzNp2lXHXbtLG6antdFtFys4tijCKmmNM3n7kzhxDG2KJxWTfj2y1XOy3N40lPSvVEqEQUABvWp4mBkGmF8EKMRc3sRShO/dYsdxq0KSQhZgFRm8fSuGDTPzi0AUa2oLxb4zgZtRdyHrMIL7e0XOz4Hz/UIZiDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 02:32:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 02:32:28 +0000
Date: Tue, 14 Jul 2026 19:32:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ryan Neph <ryanneph@google.com>
CC: <intel-xe@lists.freedesktop.org>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Set BO TTM priority based on VM exec queue
 priority band
Message-ID: <albxOmMAaFAhqYQX@gsse-cloud1.jf.intel.com>
References: <20260713234606.3367215-1-matthew.brost@intel.com>
 <20260713234606.3367215-2-matthew.brost@intel.com>
 <alaClrPwc_3hr8yK@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alaClrPwc_3hr8yK@google.com>
X-ClientProxiedBy: MW4PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:303:85::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d5b820-f5fa-4e4b-93fb-08dee2195067
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nhKIfl6wp9s8zAcapDsSgwugm11RLAhOMD3uWsaIARAPZAib9NPAU9Vi01n58uC/aZpVji5K8cUqBsCy89WeduWKoGPDIJpI60TOxDos3bW5OWmfIao1Qv7d430D3B+zDRICWkciG6t2cRekXjhh+guB8IS4eLelK6SwmhXQnhEwXD9F53+eG0AYXhR3ALlQjiXqTymoLxsGbYHGBRmnSpqLLh/aavh8lR1cMnsI39yu7NJ6lM2ueetoMtKrLQz853kIKGfjHrgm4ku18HTZVoWSMUMne3iuvrWzCRA3b6+hqyZVborJyVL/mhp7Aq3v9CPTsQDbTbajHSxJUsUkV2xxyrohBAGIYoOW67P2/HA7qoab7uzitIUxaQAWHwyq3l+raivXI/tcbEztujX/c0KEfKvPrUkvXtyzqHa7kUieVq+/Gbb3h2M6WYHSa3Aa1JkCWVJ+baeFa1Bxfi4LWWqt8GOEKiUjbiISpq+EDIeJQ6L72ICDI4jHaa9YsPT2ZdTj5o7hlSDQj5zodlrLHKcLoCaC/4GbBVtguK2ydupO8uQyO0nWswarrHp28NLiF/YXqfMdwn8aVblibqe/RJQMnr9seTP8L8i1INBBp5eHLAGtiFwbTry7lEDI8DEZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1VrFGWtCdyxCH3cYKurlVQTata7b35y46AsF1cynHTXuG8tSpdWhB7rCfvqO?=
 =?us-ascii?Q?yLI8SGmovA4Y/cb4BuAXTiNrrGxUEdUk4hMUvR4R5ez9q1k3CGZG9niYkkJL?=
 =?us-ascii?Q?KGiQIbc3MRZSFFOZj0R8IsKqiXZ4W/yT4ijoJbT4HyMMGyQA/YikUOq8lm/Z?=
 =?us-ascii?Q?J+ebcs8rkCnm9Q6PecNEYxSv2U//9vIXN5EcsueesNfRKlNV5Rv/7JO/HbeU?=
 =?us-ascii?Q?405lvjoU1Qs6K3qpaGOMH/tsO69vD93C4sm4P6jT3g087w1YcxTtfQDFA3m8?=
 =?us-ascii?Q?A7hIloR7jSCSEROmCef8+s/MAD3hN/moiZFElL07PIKEVyCBRYJmS93F9/K1?=
 =?us-ascii?Q?eCLr9yIlFf2qEMNoBkAgJMseSJRh8D0aqzpm+Ieg0JoKX1rimLPzxUjcQQeH?=
 =?us-ascii?Q?7PW+FRsmipVVPx2GAtVorbBIn0PE1crnvc4NsgLJoEgeD8i0Q4slHieqDJFk?=
 =?us-ascii?Q?eCMHoHiXaIb61ujk1vE7IYjW2V+B/PWNl52owmZ8oEtsGpQnCWthbTelbjFa?=
 =?us-ascii?Q?H6xMvaqcrT+BxPAEZpYC63OdSPui950ggnu6nANUZJGWbiKaODtbQstBvZJK?=
 =?us-ascii?Q?HXSSlqHzCGrFRpgyF/peHlgganx/RmrVx38i6BMEPVWj2AylYA4xe6lpM2Mu?=
 =?us-ascii?Q?V8Tjhp+CJ/Vcr/CRx7twbTyoeRlfjVLv184VN96985HAkiyEwRECe0JR8pfv?=
 =?us-ascii?Q?D2cYiq2KhInwc7qsWbej9bBouo9OvZL0q6MZo0n5p1/ZTQCHItNUGlFTk0V+?=
 =?us-ascii?Q?6ipicHAo6JZxWXHqD8BKCV5++w/PTZde8YzrPD5j//qkeIbaTZJokKYbp2Ua?=
 =?us-ascii?Q?0xug37oWE6vLSyKu1GjPBC5uA9J9Sd14W3TTkKVXdNZlkfCKohxfSWQN9+57?=
 =?us-ascii?Q?LDe2ckyMaJK4KJiz+vKPswAqaH+pf7ezAZoZd/SUfELavDhyPeQI0VEnWZDJ?=
 =?us-ascii?Q?hPkG+PsugzQgYxGtuKded15tf4ecL61c125TDkoA0lvG4xctuyIjeMK1LId7?=
 =?us-ascii?Q?FNZuDv0Nh7KOJKQh38i6yS0PE2chrTwyLICwLCS83AsnnMXK7lwoypvhngro?=
 =?us-ascii?Q?SeSkeeAK5vAlJgSLd/MTUi9b5weAwn4fy148wKDFjotAxMEJAAoCNhg7lcYT?=
 =?us-ascii?Q?jnUusEwpry7qWD4MEp29/lGVd/Wzxc882vi8Q52ojfYbZx3PCvAmnwsin2k8?=
 =?us-ascii?Q?YpW7xORXiZFDek4q65kPMuhSnjpNydIwYr7yQJ05vPrYGXj4Dkp5xTgX4Yhy?=
 =?us-ascii?Q?KpYe5MtReOemvOWCO/+PWXoXykYrMU1IHz7E4gPBq95hJibV7JdFzEw/A96b?=
 =?us-ascii?Q?ZtNMT187JRa2JPr4TahMGubWy3KnL20755gAIL3VYcukWClS7NA/cyPKWJ4s?=
 =?us-ascii?Q?MF7WRbCVrseHegrHXy/91Dajt9NYvzM8+uihuLNcrcjhxj/Ci5MWviXFv0Q9?=
 =?us-ascii?Q?V9hP9Y5g4VOcV5wSH/vnKAJPsmjcCjKAiRv/zTKCNtdfwMk+lzlLPRGuBxPx?=
 =?us-ascii?Q?iZTcqIBqso6MtiQHLSUBU5JG+DfPWwFou1l2zvkRfRmbMLNOgChf6AqHzYC+?=
 =?us-ascii?Q?GAJEifEwoG8c0TfHegerZRWS0qcYTAh5vKggIx5LrVvXi6wUuMTXCwx3QKoZ?=
 =?us-ascii?Q?FCYC9noOW1VjTmHI11BCaeKWP0udxCQ1MpA3c4nK4rUPFVoVY6lmiaEsuCF2?=
 =?us-ascii?Q?7lUXwEEbmRsH4mSf6/xRegmB1nt/aEIRuSxycinbyBWTVA8uzM4zSFbixAFt?=
 =?us-ascii?Q?KWlQaXm3sg=3D=3D?=
X-Exchange-RoutingPolicyChecked: q0/c5Y4dGPgeFUE6cvqId+y8UOMeF89SpgVhSxhXFEh2mcUPGtk6rfPDPk3PixfV0jfqk+5yXEq1qr/C6zoiBTu3BfliU0PXdjxf2Dcb76ynXNIN52koyW6q65PSHTHPbeuCcZTlhUcTz39NOAaUQonjT3VPRHdhU6DKQtavDM+puKMWekOa7DAT3VqwShD0odteI8tTa1+B2ZxgQWF2Sy2Q34oCAU4tZ86SvOYuekmz+l2tENb5/2JwLsgz4ENTR5s7IRjj4IKQ10wVKqgns+NbulDkMkkwLNxQbTbqRAjubP8pZYsR20Y1JgZKfe+/BDE+OWOQD+9nx74QlST/dA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d5b820-f5fa-4e4b-93fb-08dee2195067
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 02:32:28.5961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52OiKBgrkrqmDtwX730bioSPPrqu1L1XQUHkFiWjevjF6v+SU3UeYN0yQozaR0pUB2P8/7PWbYHQSGhCWagB3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
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

On Tue, Jul 14, 2026 at 11:49:07AM -0700, Ryan Neph wrote:
> Testing now, but the corner-case you anticipated is showing itself; i.e.
> a client that allocates before creating exec_queues has those BOs with
> the default XE_BO_PRIORITY_NORMAL.
> 
> In vkDeviceCreate(), ANV creates the sole VM, allocs several MB worth of
> internal BOs [1], then creates the exec_queues.
> 

Thanks for the ref, I was afraid this could be an issue.

> For an application that is expected to create its exec_queue(s) with
> XE_EXEC_QUEUE_PRIORITY_LOW, when its BOs get shrunk I see a mixture of
> LOW and NORMAL priority BOs.
> 
> ANV could reorder device creation to:
> create VM -> create exec_queues -> alloc internal BOs
>

That's an option, but I'd rather get this right in the KMD so that user
space can be ordered however it likes.

> Or Xe can add the BO priority as a property of BO allocation or VM creation
> ioctls.

uAPI changes take time, require an open-source consumer, and need a
decent amount of scrutiny since we can't change them once they land.
So I'd prefer not to go down the uAPI route just yet but no opposed to
some uAPI as longer term solution.

I don't think it's too difficult to handle this in the KMD by updating
the priority of all BOs in the VM whenever an exec queue is created or
a BO is bound. I'm working on this now and plan to include the changes
in v2.

Matt

> 
> [1]: https://gitlab.freedesktop.org/mesa/mesa/-/blob/ed807097ebdea0b490ce4d091619ca1c325e296c/src/intel/vulkan/anv_device.c#L851-1246
> 
> Best,
> Ryan
> 
> On Mon, Jul 13, 2026 at 04:46:06PM -0700, Matthew Brost wrote:
> > Add XE_BO_PRIORITY_LOW/HIGH/HIGHEST defines alongside the existing
> > XE_BO_PRIORITY_NORMAL, and use them in xe_bo_init_locked() to select
> > the TTM LRU priority for a newly created bo.
> > 
> > Kernel internal buffers (non ttm_bo_type_device) and buffers that can
> > be shared cross-process, i.e. not private to a single VM (no VM
> > pointer available), should not be evicted ahead of user buffers, so
> > they are always given the highest priority. For buffers private to a
> > user VM, prioritize the buffer based on the highest priority band of
> > any exec queue userspace has created against that VM, since that
> > reflects the importance userspace has assigned to work using the VM:
> > 
> >  - ttm_bo_type != ttm_bo_type_device, or no VM: XE_BO_PRIORITY_HIGHEST
> >  - VM with a HIGH priority exec queue: XE_BO_PRIORITY_HIGH
> >  - VM with a NORMAL priority exec queue: XE_BO_PRIORITY_NORMAL
> >  - VM with a LOW priority exec queue: XE_BO_PRIORITY_LOW
> >  - VM with no exec queues at all: XE_BO_PRIORITY_NORMAL
> > 
> > This relies on the per-priority-band exec queue counts tracked in
> > vm->exec_queues.priority_count, read under vm->exec_queues.lock in
> > read mode. xe_bo_init_locked() now takes a struct xe_vm * parameter;
> > all callers that create ttm_bo_type_kernel/ttm_bo_type_sg bos pass
> > NULL since they always get XE_BO_PRIORITY_HIGHEST regardless.
> > 
> > Cc: Carlos Santa <carlos.santa@intel.com>
> > Cc: Ryan Neph <ryanneph@google.com>
> > Assisted-by: GitHub_Copilot:claude-sonnet-5
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 28 +++++++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_bo.h       |  3 ++-
> >  drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
> >  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> >  4 files changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 85e6d9a0f575..9da75ade8eaf 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1346,7 +1346,8 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
> >  		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> >  			break;
> >  
> > -		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> > +		backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
> > +					   xe_bo_size(bo),
> >  					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> >  					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> >  					   XE_BO_FLAG_PINNED, &exec);
> > @@ -1486,7 +1487,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> >  			break;
> >  
> >  		if (!backup) {
> > -			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
> > +			backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
> >  						   xe_bo_size(bo),
> >  						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> >  						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > @@ -2276,6 +2277,9 @@ void xe_bo_free(struct xe_bo *bo)
> >   * if the function should allocate a new one.
> >   * @tile: The tile to select for migration of this bo, and the tile used for
> >   * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> > + * @vm: The VM this bo will be associated with, used to determine the bo's
> > + * TTM LRU priority based on the priority band of the VM's exec queues, or
> > + * NULL if the bo is not associated with a user VM.
> >   * @resv: Pointer to a locked shared reservation object to use for this bo,
> >   * or NULL for the xe_bo to use its own.
> >   * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
> > @@ -2291,7 +2295,8 @@ void xe_bo_free(struct xe_bo *bo)
> >   * Return: The buffer object on success. Negative error pointer on failure.
> >   */
> >  struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> > -				struct xe_tile *tile, struct dma_resv *resv,
> > +				struct xe_tile *tile, struct xe_vm *vm,
> > +				struct dma_resv *resv,
> >  				struct ttm_lru_bulk_move *bulk, size_t size,
> >  				u16 cpu_caching, enum ttm_bo_type type,
> >  				u32 flags, struct drm_exec *exec)
> > @@ -2353,7 +2358,20 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> >  	bo->flags = flags;
> >  	bo->cpu_caching = cpu_caching;
> >  	bo->ttm.base.funcs = &xe_gem_object_funcs;
> > -	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
> > +	if (type != ttm_bo_type_device || !vm) {
> > +		bo->ttm.priority = XE_BO_PRIORITY_HIGHEST;
> > +	} else {
> > +		down_read(&vm->exec_queues.lock);
> > +		if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_HIGH])
> > +			bo->ttm.priority = XE_BO_PRIORITY_HIGH;
> > +		else if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_NORMAL])
> > +			bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
> > +		else if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_LOW])
> > +			bo->ttm.priority = XE_BO_PRIORITY_LOW;
> > +		else
> > +			bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
> > +		up_read(&vm->exec_queues.lock);
> > +	}
> >  	INIT_LIST_HEAD(&bo->pinned_link);
> >  #ifdef CONFIG_PROC_FS
> >  	INIT_LIST_HEAD(&bo->client_link);
> > @@ -2496,7 +2514,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> >  		}
> >  	}
> >  
> > -	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
> > +	bo = xe_bo_init_locked(xe, bo, tile, vm, vm ? xe_vm_resv(vm) : NULL,
> >  			       vm && !xe_vm_in_fault_mode(vm) &&
> >  			       flags & XE_BO_FLAG_USER ?
> >  			       &vm->lru_bulk_move : NULL, size,
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 6340317f7d2e..12625740a47a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -115,7 +115,8 @@ struct xe_bo *xe_bo_alloc(void);
> >  void xe_bo_free(struct xe_bo *bo);
> >  
> >  struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> > -				struct xe_tile *tile, struct dma_resv *resv,
> > +				struct xe_tile *tile, struct xe_vm *vm,
> > +				struct dma_resv *resv,
> >  				struct ttm_lru_bulk_move *bulk, size_t size,
> >  				u16 cpu_caching, enum ttm_bo_type type,
> >  				u32 flags, struct drm_exec *exec);
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index fcc63ae3f455..95904b03c71f 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -24,7 +24,10 @@ struct xe_vm;
> >  #define XE_BO_MAX_PLACEMENTS	3
> >  
> >  /* TODO: To be selected with VM_MADVISE */
> > +#define	XE_BO_PRIORITY_LOW	0
> >  #define	XE_BO_PRIORITY_NORMAL	1
> > +#define	XE_BO_PRIORITY_HIGH	2
> > +#define	XE_BO_PRIORITY_HIGHEST	3
> >  
> >  /**
> >   * struct xe_bo - Xe buffer object
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index 8a920e58245c..a80831fabd1d 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -300,7 +300,7 @@ xe_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
> >  		if (ret)
> >  			break;
> >  
> > -		bo = xe_bo_init_locked(xe, NULL, NULL, resv, NULL, dma_buf->size,
> > +		bo = xe_bo_init_locked(xe, NULL, NULL, NULL, resv, NULL, dma_buf->size,
> >  				       0, /* Will require 1way or 2way for vm_bind */
> >  				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
> >  		drm_exec_retry_on_contention(&exec);
> > -- 
> > 2.34.1
> 
> -- 
> 
> Best,
> Ryan Neph
