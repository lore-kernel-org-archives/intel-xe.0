Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7058CD0EE14
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C93610E44D;
	Tue, 25 Nov 2025 19:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hw2yfZwv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BD710E44D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764097660; x=1795633660;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GIjETdJ+KwINy+CHQEU3/lcpbgLDWfsNUF+ET6G03M8=;
 b=Hw2yfZwvHUi9kQpnp9iet2yc68m8npJGRkQG+NQBc/bDq3wYMuBngBz1
 IQdhMhnmErNXYYOlkX+4eEVUHMgXV0BKTrsYbjWnjQr1+i1TEYi3HQH77
 POnX0Eh4pioDirXM1Q1O/wCQBZlLfBpin2G6Szr599gyUhIRCCLdxDBZQ
 aB2cYTthKN/6xU60gR8fj6X/x+sT01YoBiGCviakyHHoiS10T0KvDbZNy
 nzSdA9YHlBw9pWv291kxI+danfneGmnd0z5hq2sDeTyyneBI1qFxXgora
 zUayaPLgbEIYDP4HoY0DTC/iPUVmJ33qvH8R5c2Ws8dF2RmCa0fA1aK0u g==;
X-CSE-ConnectionGUID: HgcaIuUoTai5nh2OtZvLpg==
X-CSE-MsgGUID: v8xS7ucJRK6K/lKyr5yPIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65314455"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="65314455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:07:39 -0800
X-CSE-ConnectionGUID: f6i4wygUQmqho4+iYH7LFw==
X-CSE-MsgGUID: 602l3/lrQpiP0u911lyOLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="191865791"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:07:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:07:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 11:07:38 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:07:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E34fqgr/pmK/vI319FwlgctA6e3r9IZAC/pjWgqq27Ruk8H8c3lcyY9QPJUT6d8d0k6cIbkTtKlnoQ28vbL9SGnN1df1i0hFLC9+BYlju9Jsh/5LsAsvA7XJ0O7HedjRH5Id333qvkU8yrU6dYEcztg5XZY6UVvXclgFjIAFT6xgsNIf6r2HxfA6lIwzX+Up3Rs2aHFLkmKw3tmSj9OI78nfu7HDmnIKtdfy4ww2bqlNEx4+ChjuJLqavff2Rydv2syta6mqSzNOxpRzIy0DTrUb2eSmac4Ws8DhWMRxmabNkpwe7CmTF+EqNMlAC8GEKrde3Lgvo9aYtdNMVwDmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOo2JvYXd5eIIV7fzwGsQLe46D1ybso4r9Sb3+505t0=;
 b=qGgM4fhvZ3FxNT7ncgsYsfzYRmhwnUFXuDRUIPuKsVQQUxp/eGSdWfBQOpp7juPjri/ARE8w5UMUwj3IeTdzK/p2WbOfwRhuWEpz9fh7dAIvyqBffN1rYrEanGjKs529xQeEc8KH5jADBl7HRGHAd5Neq48ZAumb+RoBnpU67YDnSOFhJp/XS787vVN1lWZplweTealRBZ+991W+Km5TaY1WqFRTCRz9Aip20WQmmSlSVoGfqafI23Le3VuyxTNV6NqEiJ9KlvyUwVkrlHAs5RZLbDe0ID4VO/XTnUZFmKZDWAqMOr6Hn5hGM/CHYv4nx25eH99O5H4ys2EG4Voauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 19:07:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 19:07:31 +0000
Date: Tue, 25 Nov 2025 11:07:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Message-ID: <aSX+cMn4sFswa2HE@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
 <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
 <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX2qxiSvdNrXvbX@lstrano-desk.jf.intel.com>
 <SA1PR11MB88393D5D019B5943600FCBA4AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB88393D5D019B5943600FCBA4AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:303:6a::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: c12c2bbb-c284-4862-288a-08de2c55e242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dgWKTUyziy/2wk9wa1x7/Kk3LpRKRU2tJhvCbjMUCnIOqJGkos+iKaGp9vtb?=
 =?us-ascii?Q?RvxtEfzfCj+XsFkDfyFu+gJlMII8JxVr9yUM1xD+BL3mg1Ms75T4DKk+M9gY?=
 =?us-ascii?Q?xsM0HXXIlDAWiIThUfI676FASLNX2HE9QsnZ0RQ0//PLprmmxwNXKt5rDpD3?=
 =?us-ascii?Q?1OGhcnEGws/Mfoij5tUp2EzUGhaM1DPAjj9fWMPnLo1xNsgn2MLC8bmx9tcH?=
 =?us-ascii?Q?XfkmEAvmb3AFBWcHXWDTXdXSZ/DcbFxQ01vBa+2WcuK2/ILGI3CGWaOBzB2y?=
 =?us-ascii?Q?6ACV23Af2/fWcQm9sjqI46PyBWnJ4a0/LvJibiM0ibeySUDfIZIvVUgsWf5U?=
 =?us-ascii?Q?K2iA5aaw9ELf8j9b9pmzwRGyoga9+wjNs0bzJ13ONE2JMhhJrdHInLA7cUr5?=
 =?us-ascii?Q?FvoyBRl8/X/3ebiFBjfKLHZsj00u5C4LtakEWLxqSd4A3WC5h+6u7yij9lZY?=
 =?us-ascii?Q?e+RlUVOAluiGTQ8tG8Y3IjiLVRSq3HvMz4u9vMHVkai4apdQcU7hhfHTgRuR?=
 =?us-ascii?Q?+4thyBzj1G90y2d2cZdKFMh8s8BRXCX6407RGluqfNznIvXDF78x3yVBNzf0?=
 =?us-ascii?Q?WIKVyNDGs/HZgJG9+N36drQODjVMZF5xSD2FUcdwNilI/bJIzXKlu9T0gfKz?=
 =?us-ascii?Q?hxYvXIQiW4/bVNi+pum7BCp4uzocHIeXKl7WgsDxmKZf2ijGqTf20rj0A+8D?=
 =?us-ascii?Q?4Emd04jJncQMnwEy4BEdt26Xo/MlCTgc866so8PrMBINgASpdiPtHHBDU3Pm?=
 =?us-ascii?Q?/I62BsnyfjrICwDJ9BageOOBJv9WLz04af8UNuSuTEewVd0mh8qH5BBsTX0A?=
 =?us-ascii?Q?kqxTHqW3jJ0H6NhjXS3s/Y5EEaMUNRVMzx4/sVmEVW4Y9L6PbORUNvPNli/P?=
 =?us-ascii?Q?VBgnumLYhyN+TyfCeQkhPo6Mu8Y7ARdb6OMv+mS6NCrkDvfnqqQal4l9oahn?=
 =?us-ascii?Q?QtSc7yP586Uc3toIMSeuMQ2tf0VcLToZIR1JdeS+mm++dv7ro/WzS7a3yreq?=
 =?us-ascii?Q?hxn8OUH8cbzoj2U2fjCSAQTB6eScGJyVWVMwUxtsUO+mL6TWDBn3/HU/1Kr3?=
 =?us-ascii?Q?Oea+iIvTZ9p7HlOCYuioyqeHfE60jyQbWHNFEF0FxOS4nFtJVb839mqiAV8d?=
 =?us-ascii?Q?wfBgYCg2agPDW66nKZjF/FOdpGSCqP0Ev5uj6FYY5q19L/Pob+dBzVd4P0fN?=
 =?us-ascii?Q?Ptw9L636VkKvR0vH+m/eA2X/Os01DMlDDVGFIY/dzfFovxWWZx74lfxly3YE?=
 =?us-ascii?Q?TMOOD6m0dmP1wHJ3YQoWn+DPxDRCFlndW8gjqny/1pbzWOi7Id7dyxu7+qqJ?=
 =?us-ascii?Q?1vtsgA6v1eKVpESy4QpW8E5MkAk4+H/VmXkVdNhxUcS+DJJtny5Brm06Hgks?=
 =?us-ascii?Q?nBdCQRtXCT3zb5ivC2L6i/HV2VKniKzljGFwuZ33Vq6RaeH9CMj3RYh1xWDq?=
 =?us-ascii?Q?E10z3HoJbd7TLoVRpUVH6wpcHJP9x7Ue?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7c9F4DvIFpxiWb5As/HMCLRNWfVE6Qwyk/fqaM3gKnmM9MHbXlN6wFwZNHtH?=
 =?us-ascii?Q?4hxCXDF6+TJujSTOioj6DOXo/LT5K6yJ8e7PMC/fepig8dQAvFys/j6+9GWo?=
 =?us-ascii?Q?rpbGorTMN4rPaKhP44jpYHKy6CYc4U8g71w0S2YtBF+4lPBgn5ME/ZygOkyZ?=
 =?us-ascii?Q?v7X2l9au4Dh11X/O8DOhPPgLTSzR1osaEoqYm2YGaox7oSlEo+uLopLyhfw2?=
 =?us-ascii?Q?Ej/eqc8KXxeM6qke9dCE4/QIn+e0FJDBODODSdirNeta79QFxfsGMGvjTzfX?=
 =?us-ascii?Q?JlH5HUSvK30FZbd2/ChBJe7nlziqqMjmv4evO0QvJYsC8yFNDg8hORJkFJFp?=
 =?us-ascii?Q?IJneEko6VCbpGKtTUSCTNvrhQ4ld6yX9SAxCOUdJqFxPb+AfbBtftUC5/TDh?=
 =?us-ascii?Q?lz5q80ZJH2cH2rryMszCs+OYqNfdqHbK14RbXWh0zSIsa3beLTq3rX7b9Ku0?=
 =?us-ascii?Q?pP07dgRklkUCF5bEpIaUjCXqXHYiJwuiE8bY08lMJpeVL9Shq9dzvGPnpC11?=
 =?us-ascii?Q?pNZOy+/KUcVPhXXEPaiS6TzVcwSAO/gPkpYZYtOltM+kwut8VKe51nNi6jNA?=
 =?us-ascii?Q?MnlCnptGSwAqGvH99Eime3eAA+bdnqSP2+GAIX8ndah75MQEVf2vnVnc8Uxh?=
 =?us-ascii?Q?+i6QOKq/MOeR+wvb48Q5FIcMYjC58xUIAVv9ty0tt5WhsAeIBeAqzexiX5Y2?=
 =?us-ascii?Q?psdqDRarMDVuyBsgdH6DFXtkfZp+DgVcrhAyLkv5yuUFnBX8NCpyN2+YsQEY?=
 =?us-ascii?Q?2AutN5sqBuvq3WNf9H8sI9YbtTzTAAlitvDiqYzuRdXNe2mEbtIOqjA9Dp99?=
 =?us-ascii?Q?ic4DXifx7JUGn9xmyTi1K/U+Md6C99VpDsxeO84nymUXOk6OUs0HclvnNur2?=
 =?us-ascii?Q?N8EBxY/R4QDi5veIi7k9Q37GyLcJdFheDZmSTyVpt+pK0vS8q99T660lALmH?=
 =?us-ascii?Q?sgsdLF5vUx0ZElDRGg9mHSj0aFXn9775KHRcL1oyXBx+4EPDOpM9ZIPPs3Rs?=
 =?us-ascii?Q?7unldw9J3XhrsNlwT4HhqPUiWGGGda4eW98FEbdz1clp0J75pHwq1QW9gD6W?=
 =?us-ascii?Q?7fB0ChpsrcYHLd/dSWxFAUR+brNYCTkiVUkSNDyeXKMGoARYC91bUQqNePzP?=
 =?us-ascii?Q?k7orMScneFDM5YxDUZOAbdt9EHE1jrIOSQFC+guZn3HbifLFTDsPuKzuCvkg?=
 =?us-ascii?Q?2vM7R95UsmzsVngxEwhWjaW9eAE6duXN5Kj6him/iCxPs7mOoURyQnPqSBYi?=
 =?us-ascii?Q?MfXzFBwDT3h4+jOXoiCzB2wprz9KafjvN0DA2fu050HoRdy2oVZmFj6vw3lL?=
 =?us-ascii?Q?DV+j4hJ3MXWPsdOsX5ObUHDFSL9Ciu8ofr5z7OeUuqHuxYnhOQfvVf0FGiqS?=
 =?us-ascii?Q?tcqmFg96bnEImqvmJFP+kqJJTod7Ee54IQQNheheS/D1B2Nmg3DLSr/zw6ff?=
 =?us-ascii?Q?z/uK+MzTL9bMbdMk6dZdKNtK4fu921hcqPbhqyIgKLS9ftLzdWYS+4d+mbrQ?=
 =?us-ascii?Q?KfmK3QeadTsNjm84BCSfZ3SQVZOe7D6Gg77dSTHYBFjX0O2IOTa7Ug5Ndozb?=
 =?us-ascii?Q?Qd8EZOQByF27XZve+DFcFmOwf2aIEnZWrcjR4anUQcz+falMG8kqhrtPVZp7?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c12c2bbb-c284-4862-288a-08de2c55e242
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 19:07:31.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrPptuueemFEEZL3ujQJ8r5oyZoJGp1ceRALMTBdlS4byOjOj3jxWIYpANHUwZeGb6UUcdqONH+PcC83ihczlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

On Tue, Nov 25, 2025 at 12:01:25PM -0700, Nguyen, Brian3 wrote:
> On Tuesday, November 25, 2025 10:34 AM, Matthew Brost wrote:
> > On Tue, Nov 25, 2025 at 04:18:19AM -0700, Nguyen, Brian3 wrote:
> > > On Saturday, November 22, 2025 11:18 AM, Matthew Brost wrote:
> > > > On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> > > > > Page reclaim list (PRL) is preparation work for the page reclaim feature.
> > > > > The PRL is firstly owned by pt_update_ops and all other page
> > > > > reclaim operations will point back to this PRL. PRL generates its
> > > > > entries during the unbind page walker, updating the PRL.
> > > > >
> > > > > This PRL is restricted to a 4K page, so 512 page entries at most.
> > > > >
> > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> > > > >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
> > > > > drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> > > > >  6 files changed, 217 insertions(+)  create mode 100644
> > > > > drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > b/drivers/gpu/drm/xe/Makefile index e4b273b025d2..048e6c93271c
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
> > > > >  	xe_oa.o \
> > > > >  	xe_observation.o \
> > > > >  	xe_pagefault.o \
> > > > > +	xe_page_reclaim.o \
> > > > >  	xe_pat.o \
> > > > >  	xe_pci.o \
> > > > >  	xe_pcode.o \
> > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > index 4389e5a76f89..4d83461e538b 100644
> > > > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > @@ -9,6 +9,7 @@
> > > > >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> > > > >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> > > > >
> > > > > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> > > > >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> > > > >
> > > > >  #define GUC_GGTT_TOP		0xFEE00000
> > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > new file mode 100644
> > > > > index 000000000000..a0d15efff58c
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > @@ -0,0 +1,52 @@
> > > > > +// SPDX-License-Identifier: MIT
> > > > > +/*
> > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > +
> > > > > +#include <linux/bitfield.h>
> > > > > +#include <linux/kref.h>
> > > > > +#include <linux/mm.h>
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +#include "xe_page_reclaim.h"
> > > > > +
> > > > > +#include "regs/xe_gt_regs.h"
> > > > > +#include "xe_assert.h"
> > > > > +#include "xe_macros.h"
> > > > > +
> > > > > +/**
> > > > > + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> > > > > + * @prl: Page reclaim list to reset
> > > > > + *
> > > > > + * Clears the entries pointer and marks the list as invalid so
> > > > > + * future use know PRL is unusable. It is expected that the
> > > > > +entries
> > > > > + * have already been released.
> > > > > + */
> > > > > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > > > > +*prl) {
> > > > > +	prl->entries = NULL;
> > > > > +	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST; }
> > > > > +
> > > > > +/**
> > > > > + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim
> > > > > +list entries
> > > > > + * @prl: Page reclaim list to allocate entries for
> > > > > + *
> > > > > + * Allocate one 4K page for the PRL entries, otherwise assign prl->entries to NULL.
> > > > > + */
> > > > > +int xe_page_reclaim_list_alloc_entries(struct
> > > > > +xe_page_reclaim_list
> > > > > +*prl) {
> > > > > +	struct page *page;
> > > > > +
> > > > > +	XE_WARN_ON(prl->entries != NULL);
> > > > > +	if (prl->entries)
> > > > > +		return 0;
> > > > > +
> > > > > +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > > +	if (page) {
> > > > > +		prl->entries = page_address(page);
> > > > > +		prl->num_entries = 0;
> > > > > +	}
> > > > > +
> > > > > +	return page ? 0 : -ENOMEM;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > new file mode 100644
> > > > > index 000000000000..d066d7d97f79
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > @@ -0,0 +1,49 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/*
> > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > +
> > > > > +#ifndef _XE_PAGE_RECLAIM_H_
> > > > > +#define _XE_PAGE_RECLAIM_H_
> > > > > +
> > > > > +#include <linux/kref.h>
> > > > > +#include <linux/mm.h>
> > > > > +#include <linux/slab.h>
> > > > > +#include <linux/types.h>
> > > > > +#include <linux/workqueue.h>
> > > > > +
> > > > > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > > > > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > > > > +
> > > > > +struct xe_guc_page_reclaim_entry {
> > > > > +	u32 valid:1;
> > > > > +	u32 reclamation_size:6;
> > > > > +	u32 reserved:5;
> > > > > +	u32 address_lo:20;
> > > > > +	u32 address_hi:20;
> > > > > +	u32 reserved1:12;
> > > >
> > > > This is wire interface with the GuC. Bitfields can based on
> > > > endianess of the CPU. I know this is a iGPU feature for now but it
> > > > could possibly change in the future, with that, to future proof can the layout of this be setup via defines / macros?
> > > >
> > >
> > > Sure, I moved over to the typical FIELD_PREP/GENMASK macros used
> > > elsewhere for the guc interfaces.
> > >
> > > > > +} __packed;
> > > > > +
> > > > > +struct xe_page_reclaim_list {
> > > > > +	/** @entries: array of page reclaim entries, page allocated */
> > > > > +	struct xe_guc_page_reclaim_entry *entries;
> > > > > +	/** @num_entries: number of entries */
> > > > > +	int num_entries;
> > > > > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > > > > +};
> > > > > +
> > > > > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > > > > +*prl); int xe_page_reclaim_list_alloc_entries(struct
> > > > > +xe_page_reclaim_list *prl); static inline void
> > > > > +xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries) {
> > > > > +	if (entries)
> > > > > +		get_page(virt_to_page(entries)); }
> > > > > +
> > > > > +static inline void xe_page_reclaim_entries_put(struct
> > > > > +xe_guc_page_reclaim_entry *entries) {
> > > > > +	if (entries)
> > > > > +		put_page(virt_to_page(entries)); }
> > > >
> > > > Kernel doc for static inlines.
> > > >
> > >
> > > Added.
> > >
> > > > > +
> > > > > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > b/drivers/gpu/drm/xe/xe_pt.c index 884127b4d97d..532a047676d4
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -12,6 +12,7 @@
> > > > >  #include "xe_exec_queue.h"
> > > > >  #include "xe_gt.h"
> > > > >  #include "xe_migrate.h"
> > > > > +#include "xe_page_reclaim.h"
> > > > >  #include "xe_pt_types.h"
> > > > >  #include "xe_pt_walk.h"
> > > > >  #include "xe_res_cursor.h"
> > > > > @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
> > > > >  	/* Output */
> > > > >  	/* @wupd: Structure to track the page-table updates we're building */
> > > > >  	struct xe_walk_update wupd;
> > > > > +
> > > > > +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> > > > > +	struct xe_page_reclaim_list *prl;
> > > > >  };
> > > > >
> > > > >  /*
> > > > > @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr, u64
> > > > > next,
> > > > unsigned int level,
> > > > >  	return false;
> > > > >  }
> > > > >
> > > > > +/* Huge 2MB leaf lives directly in a level-1 table and has no
> > > > > +children */ static bool is_large_pte(struct xe_pt *pte) {
> > > > > +	return pte->level == 1 && !pte->base.children; }
> > > > > +
> > > > > +/* page_size = 2^(reclamation_size + 12) */ #define
> > > > > +COMPUTE_RECLAIM_ADDRESS_MASK(page_size)
> > > > 	\
> > > > > +({									\
> > > > > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > > > > +	ilog2(page_size) - 12;						\
> > > >
> > > > s/12/XE_PTE_SHIFT ?
> > > >
> > >
> > > Done.
> > >
> > > > > +})
> > > > > +
> > > > > +static void generate_reclaim_entry(struct xe_tile *tile,
> > > > > +				   struct xe_page_reclaim_list *prl,
> > > > > +				   u64 pte,
> > > > > +				   struct xe_pt *xe_child)
> > > >
> > > > Nit, xe_pt can be on the same line as 'u64 pte'.
> > > >
> > >
> > > Done.
> > >
> > > > > +{
> > > > > +	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> > > > > +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> > > > > +	const u64 field_mask = GENMASK_ULL(19, 0);
> > > > > +	u32 reclamation_size;
> > > >
> > > > Nit, I'd make the last variable declared on the stack for readability.
> > > >
> > >
> > > Ahh got it, reclamation_size moved to after num_entries.
> > >
> > > > > +	const uint max_entries = XE_PAGE_RECLAIM_MAX_ENTRIES;
> > > > > +	int num_entries = prl->num_entries;
> > > > > +
> > > > > +	xe_tile_assert(tile, xe_child->level <= MAX_HUGEPTE_LEVEL);
> > > > > +	xe_tile_assert(tile, reclaim_entries);
> > > > > +
> > > > > +	if (num_entries == XE_PAGE_RECLAIM_INVALID_LIST)
> > > > > +		return;
> > > > > +
> > > > > +	/* Overflow: mark as invalid through num_entries */
> > > > > +	if (num_entries >= max_entries) {
> > > > > +		prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	/**
> > > > > +	 * reclamation_size indicates the size of the page to be
> > > > > +	 * invalidated and flushed from non-coherent cache.
> > > > > +	 * Page size is computed as 2^(reclamation_size+12) bytes.
> > > > > +	 * Only valid for these specific levels.
> > > > > +	 */
> > > > > +
> > > > > +	if (xe_child->level == 0 && !(pte & XE_PTE_PS64))
> > > > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K); /* reclamation_size = 0 */
> > > > > +	else if (xe_child->level == 0)
> > > > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 1 */
> > > > > +	else if (is_large_pte(xe_child))
> > > > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M); /*
> > > > > +reclamation_size = 2 */
> > > >
> > > > What happens if we have 1G page? That doesn't seem to be handled.
> > > >
> > >
> > > Page reclamation hardware does not support 1G page. This should be
> > > handled and fallback to standard TLB invalidation PPC flush. I can add
> > 
> > Make sense that we fallback. I am however not seeing where this fallback occurs.
> > 
> 
> !! Ohh I got it now, I silently dropped the 1G pages... My bad. I'll follow the new
> changes suggested below.
> 
> > > a comment somewhere discussing this but the format for PRL only
> > > supports 4K, 64K, and 2M pages to reclaim. I'll add a comment here
> > > mentioning the HW support being limited to these pages and rename the
> > > is_large_pte to is_2m_pte.
> > >
> > > > > +	else
> > > > > +		return;
> > 
> > I would think for the fallback, we'd set prl->num_entries to XE_PAGE_RECLAIM_INVALID_LIST here.
> > 
> > Maybe I'm missing something?
> > 
> > Matt
> > 
> 
> Given the 1G page, I'll follow this idea. Invalidate the PRL, and then change the if statement in the
> generate_reclaim_entry() caller to accept all PTE and invalidate it in this function above.
> 
> > > > > +
> > > > > +	reclaim_entries[num_entries].valid = 1;
> > > > > +	reclaim_entries[num_entries].reclamation_size =
> > > > > +		reclamation_size;
> > > > > +	reclaim_entries[num_entries].address_lo =
> > > > > +		FIELD_GET(field_mask, phys_addr);
> > > > > +	reclaim_entries[num_entries].address_hi =
> > > > > +		FIELD_GET(field_mask, phys_addr >> 20);
> > > >
> > > > As suggested above, use macros/defines here to setup the entry.
> > > >
> > >
> > > Got it, moved over to using other standard define macros.
> > >
> > > > > +	prl->num_entries++;
> > > > > +}
> > > > > +
> > > > >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> > > > >  				    unsigned int level, u64 addr, u64 next,
> > > > >  				    struct xe_ptw **child,
> > > > > @@ -1579,10 +1646,27 @@ static int xe_pt_stage_unbind_entry(struct
> > > > > xe_ptw
> > > > *parent, pgoff_t offset,
> > > > >  				    struct xe_pt_walk *walk)
> > > > >  {
> > > > >  	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child),
> > > > > base);
> > > > > +	struct xe_pt_stage_unbind_walk *xe_walk =
> > > > > +		container_of(walk, typeof(*xe_walk), base);
> > > > > +	struct xe_device *xe = tile_to_xe(xe_walk->tile);
> > > > >
> > > > >  	XE_WARN_ON(!*child);
> > > > >  	XE_WARN_ON(!level);
> > > > >
> > > > > +	/* 4K and 64K Pages are level 0, large pte needs additional handling. */
> > > > > +	if (xe_walk->prl && (xe_child->level == 0 ||
> > > > > +is_large_pte(xe_child))) {
> 
> So right here, I'll make the change to accept all the leafs of the walker and handle
> the 1G case in generate_reclaim_entry().
> 

It is possible we are even higher up page table tree too (e.g. with 57
bit VAs there are 2 level above 1G, 48 bits one level). We need to
handle those cases as fallbacks to cache flushing TLB invalidations too.

Matt

> Brian
> 
> > > >
> > > > And also here? 1G pages are unhandled? Please explain.
> > > >
> > >
> > > As stated above, page reclamation only supports 4K, 64K, and 2M pages.
> > > 1G page will have to fallback to the standard tlb invalidation with PPC flush.
> > >
> > > > > +		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > > > > +		pgoff_t first = xe_pt_offset(addr, 0, walk);
> > > > > +		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> > > > > +
> > > > > +		for (pgoff_t i = 0; i < count; i++) {
> > > > > +			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64),
> > > > u64);
> > > > > +
> > > > > +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > > > > +					       pte, xe_child);
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > >  	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> > > > >
> > > > >  	return 0;
> > > > > @@ -1654,6 +1738,8 @@ static unsigned int
> > > > > xe_pt_stage_unbind(struct xe_tile *tile,  {
> > > > >  	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
> > > > >  	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
> > > > > +	struct xe_vm_pgtable_update_op *pt_update_op =
> > > > > +		container_of(entries, struct xe_vm_pgtable_update_op,
> > > > entries[0]);
> > > > >  	struct xe_pt_stage_unbind_walk xe_walk = {
> > > > >  		.base = {
> > > > >  			.ops = &xe_pt_stage_unbind_ops, @@ -1665,6 +1751,7 @@ static
> > > > > unsigned int xe_pt_stage_unbind(struct xe_tile
> > > > *tile,
> > > > >  		.modified_start = start,
> > > > >  		.modified_end = end,
> > > > >  		.wupd.entries = entries,
> > > > > +		.prl = pt_update_op->prl,
> > > > >  	};
> > > > >  	struct xe_pt *pt = vm->pt_root[tile->id];
> > > > >
> > > > > @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
> > > > >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > > > >  			     struct xe_vma *vma)
> > > > >  {
> > > > > +	struct xe_device *xe = tile_to_xe(tile);
> > > > >  	u32 current_op = pt_update_ops->current_op;
> > > > >  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > > > >ops[current_op];
> > > > >  	int err;
> > > > > @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
> > > > >  	pt_op->vma = vma;
> > > > >  	pt_op->bind = false;
> > > > >  	pt_op->rebind = false;
> > > > > +	/* Maintain one PRL located in pt_update_ops that all others in
> > > > > +unbind op
> > > > reference */
> > > > > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries) {
> > > > > +		err = xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > > > > +		if (err < 0)
> > > > > +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > >
> > > > I don't think you need to call xe_page_reclaim_list_invalidate, right?
> > > > If xe_page_reclaim_list_alloc_entries fails the prl should be in the init state.
> > > >
> > >
> > > Yes. I'll drop this call for now then.
> > >
> > > > > +	}
> > > > > +	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl :
> > > > > +NULL;
> > > > >
> > > > >  	err = vma_reserve_fences(tile_to_xe(tile), vma);
> > > > >  	if (err)
> > > > > @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct xe_tile
> > > > > *tile,
> > > > >
> > > > >  	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> > > > >  						vma, NULL, pt_op->entries);
> > > > > +	/* Free PRL if list declared as invalid */
> > > > > +	if (pt_update_ops->prl.entries &&
> > > > > +	    pt_update_ops->prl.num_entries == XE_PAGE_RECLAIM_INVALID_LIST) {
> > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > +		pt_op->prl = NULL;
> > > > > +		pt_update_ops->prl.entries = NULL;
> > > >
> > > > Call xe_page_reclaim_list_invalidate for clarity?
> > > >
> > >
> > > Updated.
> > >
> > > > > +	}
> > > > >
> > > > >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > > > >  				pt_op->num_entries, false);
> > > > > @@ -1979,6 +2081,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
> > > > >  	pt_op->vma = XE_INVALID_VMA;
> > > > >  	pt_op->bind = false;
> > > > >  	pt_op->rebind = false;
> > > > > +	pt_op->prl = NULL;
> > > > >
> > > > >  	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
> > > > >  						pt_op->entries);
> > > > > @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct
> > > > xe_vm_pgtable_update_ops *pt_update_ops)
> > > > >  	init_llist_head(&pt_update_ops->deferred);
> > > > >  	pt_update_ops->start = ~0x0ull;
> > > > >  	pt_update_ops->last = 0x0ull;
> > > > > +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > >
> > > > Can we introduce a function called xe_page_reclaim_list_init for
> > > > clarity? It might do the same thing as
> > > > xe_page_reclaim_list_invalidate but it would make this a little more
> > > > clear. Likewise later in the series when a job is created, you can call xe_page_reclaim_list_init there too.
> > > >
> > >
> > > Sure, I'll write another helper for this and modify both those PRL creation points.
> > >
> > > > >  }
> > > > >
> > > > >  /**
> > > > > @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > > >  		&vops->pt_update_ops[tile->id];
> > > > >  	int i;
> > > > >
> > > > > +	if (pt_update_ops->prl.entries) {
> > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > +	}
> > > > > +
> > > > >  	lockdep_assert_held(&vops->vm->lock);
> > > > >  	xe_vm_assert_held(vops->vm);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > index 881f01e14db8..26e5295f118e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > @@ -8,6 +8,7 @@
> > > > >
> > > > >  #include <linux/types.h>
> > > > >
> > > > > +#include "xe_page_reclaim.h"
> > > > >  #include "xe_pt_walk.h"
> > > > >
> > > > >  struct xe_bo;
> > > > > @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
> > > > >  	bool bind;
> > > > >  	/** @rebind: is a rebind */
> > > > >  	bool rebind;
> > > > > +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> > > > > +	struct xe_page_reclaim_list *prl;
> > > >
> > > > Can you move this above the bools in the layout of
> > > > xe_vm_pgtable_update_op, likely just below "struct xe_vma".
> > > >
> > >
> > > Ahh got it. Moved.
> > >
> > > > >  };
> > > > >
> > > > >  /** struct xe_vm_pgtable_update_ops: page table update operations
> > > > > */ @@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_ops {
> > > > >  	 * slots are idle.
> > > > >  	 */
> > > > >  	bool wait_vm_kernel;
> > > > > +	/** @prl: embedded page reclaim list */
> > > > > +	struct xe_page_reclaim_list prl;
> > > >
> > > > Same thing here, move just below "struct xe_exec_queue".
> > > >
> > > > Matt
> > > >
> > >
> > > Moved.
> > >
> > > Brian
> > >
> > > > >  };
> > > > >
> > > > >  #endif
> > > > > --
> > > > > 2.51.2
> > > > >
