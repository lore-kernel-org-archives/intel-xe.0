Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3CAC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 20:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ADD10EFC9;
	Thu, 27 Aug 2026 20:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrlpo9Rn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A38410F0F5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 20:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787861531; x=1819397531;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GHDbg4rvuqy13dfh6uJ3kqFOPa0LPjxlQkFA1LIwkrU=;
 b=hrlpo9RnzEom7p3yDtkR4VT59wfjE+b4NQrXZ6wzVKHg0+b8Bwj0p3s7
 9KfidZ0SOXpwxxw5ovWiUC4PFnd3e7nAbcCzVmIwUQwEtjf2n3N9dhuOX
 rG1XYuw0vCJG1T/4AkYtU+1RGUvJyBS9KE3L5y3Tj0OzrORNA293jR3uL
 Moq0Fo7xivcIsoDtBp1VKenKgp+IZcI5aDW+QvifLTp2mDlMe9RJ1oTNR
 MGXssfthSpvs3FG+SQ1UFgx3fW58I1+1VxnK8gV8OACpNMHLSbvVnjdSR
 iINfnKiV54Epxsh4b5VQJ4EG3misNhUm+bQuNwGsBttlY/tTDQTo+fLPL A==;
X-CSE-ConnectionGUID: /1bmFflYQ6iJk21gYCSaPQ==
X-CSE-MsgGUID: OCYB1zo8Q9aL0SqaI+OBsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105892581"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="105892581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 13:12:11 -0700
X-CSE-ConnectionGUID: Vn9CyF1hTmmCxfUW+JPSjg==
X-CSE-MsgGUID: z+q+86V2RyOXVCprDO5LgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="271502161"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 13:12:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 13:12:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 13:12:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 13:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6KzH8UAvzN9fFvNauVzJU6jTgFJJcSYGYEGdGBVfFs7/ubwPYaxVWmKO+WL4O6dGliMNE/jh9+bhu5ZOetMWTetreIlwY2Jo17cTmBWAiDnYbyz4kt0oJfRqij7R6IuJSpKtn4Q0cguT0uwzKAGWgq+ZUNVJDGLZzPkLcqQJWw0Ski7BXsNGqCHTJGVSD6nbToiTxKeoPAtZYoe/YIqKOTdRWnprwjNRx79fVbtsdfluhBCTCJpjCYJzdr0KiUepI88CQq+16TrR19BHpQ7Otcfj1KKPHM2VWRYmjtoYiE+UKCdQVWutInFTLrIexdd8SVnuG20bigOkLD4V5s6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmYBaZVzBPSW+lY1gD46tDXAkAAi7/mv2TIlqxY5294=;
 b=s2oc8rQ7PgHUdzEJKsaEWXmxyHDVpcsc2qAQx94PXyF0ixT5qtJxQkv3DdBUytwcMVJO8zciaf4gkueD2irF97C7x9MXxE4ffiyx2m+XT0nq5vYF60ntnlqgv5fC0oLT23MniYk2o5i9M2Pw8R9NK8krgCqJh04E0dLGKUhyrz1V0LGU5qnS+Zd+Kvw+ez+PI7jZK1CTvR5l/AjJKwL+GlxXoX0J9MbOCm50SuE3TN4AIMwW2mHKjtX8iJlXTLvPcz7FAJZxTCc91TLxlcHtm+3GPF9PHTbKQ4bb5/hoB6yTd2EhdI1Qn0IEvdIej9wsfONfuqHE152pOa7KGynaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 20:12:06 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 20:12:06 +0000
Date: Thu, 27 Aug 2026 16:12:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Dave Airlie <airlied@gmail.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <daniele.ceraolospurio@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>
Subject: Re: [PATCH v2 00/11] Add CPER logging support for CRI
Message-ID: <apCaEBQSKwANBNFI@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260826195017.GJ681121@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260826195017.GJ681121@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 996208ba-4270-4b09-0286-08df04777725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QEtkG2ZkmouhLijQhBQtb/TrIA5WfStx6lUaqU2ri2QcpN0u782okGdTtXodcuHDRw+KJB1RjiaGOje3UXuJ+btSfy6AwSoeQPI4GEzLQdVMFvjVLPIQyZyACZAYIas2WKJNIOa/kLe7fH6sa4YKiFzk3Dla9EmRlFUVEtjOM4AlK+nthciJRg0sVxyYt8rwfgMzCnfXIUXIkXlMkaYmkhnvZHBx5XkuZgHokzvlc6YznpTMQX3IWpAIp4rnAwb0TYWwsa0fSMYDaTXeLp0YLneAv+nUEi/R3In+1/LDAid0+9w27KfplT8eTkkAHTMGDy5v1KSuOmJM+l1ZdkaEJ1S8G+/Cw5kBAEFuse+Z0piqOvhSVRvDABqO9/smAhXoeZ9fzWnbyIoa7B3qs4dvOTsi9YEVGoA8rx0yzUW+459q+AmAjlyUcUCJ6qE6bJjn/F6FrbRHwOFAdhR6AN2MAVe4vkBstRT0sEzWgrcujNULIwUKqZOwkkMB5nEK0fRwVVYNmfRm187yrgscPCbUT0Awyr8fcnzlMpNsNvxIzmSR0FYKhmad2ZMiffpG7I+YRS2Fncy6rZHp5Y2KK5gncF/fsLOKvlTvdU2SARu0CaMksn8f/O6C8kSNGNzYP9Ur
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eCDp++MKjrIAODjkExQN/QXyL8mLUZtRDDX557KYkwR3Ll9q1CN5NFt+HCTj?=
 =?us-ascii?Q?XN6LByfxVIqXd788uCs62RebKgXcRmg6nh4CGayTOng1PyUb0hL0vXBIeF2S?=
 =?us-ascii?Q?nsz2iWEaMyGx+BNrt/oHQOAAj/BIVkXBGsV/I0SnQHNXlqanxYOdzvRRVHya?=
 =?us-ascii?Q?V2zMVWPLGOGCEbvlOMYxHYdKZJej2WUuoacJdWEXc81voY46IR2OOlvv1UJz?=
 =?us-ascii?Q?oqemYTjPRdlP3wlvaoX/DdvT61kLKb39c13ZHngtX25UcslmpaXfrgrUSwhe?=
 =?us-ascii?Q?s7wigYTA4J6VSA3rVhdNvADRFMTGaaTacItc77Bz8fNVIaylh2SVUCP8WjbQ?=
 =?us-ascii?Q?MDCANLXkbpbxtbErbuR+5RvtYYPqwzYKPn4KrhXLKyhQfnJYbzBB/CsoHCOK?=
 =?us-ascii?Q?4kip9lWCAM8dAv2OD9JCYbqaSx3A3caAoZWvYdYWU6cLI/YwMYqYUYoUMWv1?=
 =?us-ascii?Q?Bth0l/Iu0e6p5gFfhPW012nkAmgZpt5rg47VjesMpzGlHZVohRDz7ZGKgLxy?=
 =?us-ascii?Q?e6hmDdOdXWy7//8amKs7Z0EpTSkW6PYMKi4FsJExAJO4apLJCjqIPkuG1kRS?=
 =?us-ascii?Q?KbS0yXdtKhcJH6WA3h2OCFNIObYWF7tmadcYubmzfgUorW1Ys7gKuHPWS/2d?=
 =?us-ascii?Q?kSoDQZURHA9og903Ju8il2Qr1CSF+NOGZduYTmAWWECfekAgvwf3UFTHqdQC?=
 =?us-ascii?Q?YVMBHcb9ZQTfnLHNckToZJhYosD+QGNqUxj0xjsOy/sBEJGxds6q8jrGCf5n?=
 =?us-ascii?Q?FpjCHayJicOANPQPfJB73BqWxr13DrFew8N9qX/YvohY8uXUJBO8J8WPhx8W?=
 =?us-ascii?Q?A+ReXLTPTel0ELDz/2JzkuNpPeOuU72CjP2LRjSM8/b4Ymmdn9qEOJh+XIKU?=
 =?us-ascii?Q?7cfqKDDXMsCaQ+9owTAAun4Mr4zr55W9BAjlZ0nzuMSZsW523uB/QwrfVcAj?=
 =?us-ascii?Q?f1mXxo/m3DzSgERqWWSHY/Cmjy+woXJCAOwGjSzZKGd4tX5vFC3k/sSzDeqV?=
 =?us-ascii?Q?kA1NkJExCTssodAxIFGVNTEUc/q9sZmsywmEsSMGGBW6EOxIqszm6c940loR?=
 =?us-ascii?Q?rbxHV7quyKcw4P3jYZNw+X3SSYBPOrVT7tdY+M5NfcFcinCKrIyW5SUAb/w1?=
 =?us-ascii?Q?bpaa97YsNFUO4v4GqJ4qJlxCe4EaH7DI/apk0dYv2+6f50np7WVIgWA2QFqr?=
 =?us-ascii?Q?hp/Vy1I2wnwYp2rX/fD9La9zrOS5dfuybXdOu+fttuuo64fS3wjH5KqZSefG?=
 =?us-ascii?Q?Nnecy7PoRjWCDBZpSpsJCqnMHBUBYRIm6yyCjd3AACyM9exY8iUIWgMD2p8Z?=
 =?us-ascii?Q?sOuDEDTzOD9lOtKEUhM5zyv8mC4l5q+AGgiYF7wjPN/Vt3NK1MP361LMnwtX?=
 =?us-ascii?Q?Kct17IKLpijd4beFM35taotv1IYNU2XoMbPu1NX8ra+chgMewIHMHoI8DVOl?=
 =?us-ascii?Q?GeOobLudZK5IejY9B5OsVvE66xc5xZeLvy8CqnlGCxr9aGPAeC6fOFbyvWv9?=
 =?us-ascii?Q?Se96KFE/Gg+TG8IydoS+Bgy7FWeQonK99wEjSybIWGT47T/Wj2OfQhXy38DX?=
 =?us-ascii?Q?6p1w61ByoE9LJlpSMXu7IegghZk9RWEGUxhVmtMFkoJ+85cJ+Rjqk9+XrxKq?=
 =?us-ascii?Q?4NNBqSzIUn2DaQKjBpvZrSwGXEnPh/3bt43S7AbJyYderlavBHBYZeGJv/UR?=
 =?us-ascii?Q?nVoJwktNxvn1xBmUyg3eur3KdLNPRyn4xYd8sX91XlprWmT/DwTUcnWOI4lc?=
 =?us-ascii?Q?05sN9sm7rg=3D=3D?=
X-Exchange-RoutingPolicyChecked: fv6TL5U1PKXt8/GmHLD+za+9XFzYdLrTrjMhR8/KuTSs5OwOsfvrBAU+eQ3GxLf4/uT7EwICYN8J4xGqWBmSOtI7XFqOC+kvDXXVB817q9YvhNb8SqoFFOGXIWRmSTp3VsGRzL6h4vfeQ5QFcty9/BkxEgbBI1X1jxp9G8Or7TylJv/eHY9K2MT55WLZTP88dE29MlPiXGye0ssiW5ul/9jxvxELc9jXAjWncwY4S1GdFFrVQMYSCfkswC0DfOFXvbbVMEXK4udh/MgkJX/ra/uvLLbVEzggHRLvXIbVpq6yZ9BkjOl9dl75gf/GHpjLD/rxzVOXccAnjNjTBGo8yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 996208ba-4270-4b09-0286-08df04777725
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 20:12:06.1079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlUMkKEEbrBC+kwOubvKmz25Ktr6wlTBpqUVjxK3VE6pkIn61NtzsDk3f6rVKO+PZWtUsR+UTRhzFL4wytXkCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

On Wed, Aug 26, 2026 at 12:50:17PM -0700, Matt Roper wrote:
> On Tue, Aug 25, 2026 at 11:29:17PM +0530, Badal Nilawar wrote:
> > This patch series adds CPER (Common Platform Error Record) logging support
> > for Correctable errors reported by Intel Xe GPUs. CPER logging is done
> > through trace event.
> 
> Is the expectation that real-world applications are going to pick up
> these logs via tracefs rather than some other kind of dedicated uapi?
> That worries me a bit...
> 
> I think tracepoints have been a bit of a gray area in the past with some
> people feeling that they're formal interfaces with all the ABI
> requirements of traditional uapi, and other people feeling that they're
> just debugging aids for driver developers that don't need to provide
> stable ABI guarantees.  If we're saying this will be the official
> interface that userspace software should use to obtain these CPER logs,
> then it sounds like we're taking a firm stance that yes, these are now
> formal uapi with hard ABI requirements.  In that case it means that this
> work now needs to satisfy the DRM subsystem's ABI rules --- we need a
> real-world opensource userspace consumer, acks from the userspace teams
> on the interface, etc.  And we can never change/break the interface here
> after it lands.
> 
> This may also have implications for other tracepoints, current or
> future, so we should make sure we've thought through this carefully.
> Please make sure you discuss this with the maintainers and ensure
> they're aligned on the direction here.

Cc: Dave

relates to our old discussion on drm-ras vs tracefs for the cper logs:
https://lore.kernel.org/all/CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com/

The main motivation behind having the logs on tracefs is that debugfs is usually
not available in production and to avoid flooding the small kernel buf log.
Specially with some CPER format that is starting to be the convergence of log
format in the data center world. Mostly driven by OCP standards.

That said, I don't believe we need to draw a hard line and demand that the
tracefs become a hard ABI like our uAPIs. As you mentioned already that will
have consequences that are much higher than the logs use case.

Also, we are not proposing a dedicated userspace consumer for these traces,
nor do we expect applications to interact with them through a Xe-specific API.
Users already have standard mechanisms for collecting trace data, such as
trace-cmd, perf, KernelShark, and other tracing pipelines.

Similar to other trace events, those generic tracing tools can be used to
collect and process the records when desired. Because of that, I don't think
it is reasonable to require a new dedicated userspace project as a prerequisite
for exposing these events.

Thanks,
Rodrigo.

> 
> 
> Matt
> 
> > 
> > v2:
> >    - Extended CPER logging to Uncorrectable errors and xe_ras_get_counter
> >      request
> >    - Log CPER records via xe_log SIGID infra 
> > 
> > Badal Nilawar (11):
> >   drm/xe/xe_ras: Add support to retrieve info queue data for CRI
> >   drm/xe/xe_ras: Refactor get_counter() to return response structure
> >   drm/xe/cper: Add CPER structures and trace event
> >   drm/xe/cper: APIs to prepare and log CPER record
> >   drm/xe/cper: Prepare Intel CPER error info from info queue
> >   drm/xe/cper: Log CPER records for aggregate counter retrival
> >   drm/xe/cper: Allow hardware error CPER reporting from xe_log
> >   drm/xe/ras: Report device memory errors using SIGID
> >   drm/xe/ras: Report core compute errors using SIGID
> >   drm/xe/ras: Report soc internal errors using SIGID
> >   drm/xe/ras: Report correctable errors using SIGID
> > 
> >  drivers/gpu/drm/xe/Makefile                   |   4 +
> >  drivers/gpu/drm/xe/regs/xe_regs.h             |   2 +
> >  drivers/gpu/drm/xe/xe_cper.c                  | 184 +++++++
> >  drivers/gpu/drm/xe/xe_cper.h                  |  34 ++
> >  drivers/gpu/drm/xe/xe_cper_types.h            | 186 +++++++
> >  drivers/gpu/drm/xe/xe_log.c                   |  17 +-
> >  drivers/gpu/drm/xe/xe_ras.c                   | 506 ++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_ras.h                   |   4 +
> >  drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++-
> >  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
> >  drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
> >  drivers/gpu/drm/xe/xe_trace_cper.h            |  66 +++
> >  12 files changed, 1093 insertions(+), 39 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h
> > 
> > -- 
> > 2.54.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
