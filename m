Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A20ACA0FFA
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 14:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3543410EA8B;
	Fri, 30 Aug 2024 14:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXSoWwH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8702F10EA8B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725027306; x=1756563306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A99MyE3kkQb7RzE1f/fQ7/VyAZkF+ewlmhp+iia0TPE=;
 b=CXSoWwH9D/qIA5YOY5zyFuYYB/Fg5YShUcK4SvWIiWLjSe78R9GHrsWF
 bHAynVGdt7ZCKUT8K5q2m7IEcIRvstKx0rGjyqLjLKjye1+OTQ2qwERiB
 +8rfhmSfBwoUyJ0Bz8nYluG2EgCRM9j+nAj1qBvqA23uqm+XsC8ppVakw
 VQo+8xXmTYszDqkQsZzo2IQ4lNhGkpifATjGs/Cn8wD3cow1Eoz35d/aI
 dzHC5ZDBMMaOi7IvBq1CHp+DBMsmX5/TF211i4a0JdEGZUC3nP2fttGuS
 mLUFwRB/t5QoYM2zTrGMbdzsAXbd/XYUc0Z6FLNjwiu56qIR9Q5f7PEqP g==;
X-CSE-ConnectionGUID: fQCVbrWAQfSUXQieoeRphA==
X-CSE-MsgGUID: MlSSkq33S1mMBAEkaYPHug==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34284704"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="34284704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 07:15:05 -0700
X-CSE-ConnectionGUID: 56d3/4YmRPKBtlAwpDa9Fg==
X-CSE-MsgGUID: H3f9fi04SaCLRSggJ5M33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="63613168"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 07:15:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 07:15:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 07:15:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 07:15:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFzygX55NInBTdHUXqFiKpgov4r28RPIUyiaXULasBrzAu+FbjxuBwqN1kBnRi8Ar8DmGS1S7lfFzxrGBs1I4FYoMwfwOmWiBYhs62J15C3pwdoQCYRh9pQCAJtiKzf/YjeF2s+94spMdUOMLwAvlJ/aDJJ1YgBQGmpnLNH75M20gVuCiM54iu1r2PZt2aBrJsDe5qan9b8Uvczct2rILbYxVbK1Wx5r6GxlbmNfvUmw+EkgfGUjyxBiowqlgPz8Re9khy3xr+RG1HNrvHNN6k0CN4J22mNtHRfxgnJTLINpeSUFuQ1TwW7Ws7ZVUu0vgI1JcvpT0MZ895n3yNrD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9tyq82OIuMUGaF9ud3r+t+XfM8OEBpYS3f3SPEeAIU=;
 b=eqKBAhqsdPRz5SS8Z9eGgyych4Jv72yfohlHACmbIIi5xVmIzGKI2oIz6J0jZJH4940rPl4PLrKc+9Rba+WSyLYVUTM6OsSvEHwF15yiITTLf9POI5jZGki9uGOx94ltu4J+LPOWZpUEJtvGBB6jvWm/nd+AQVYdPQq2TF1BYZT5c1JKmzLml1b87eaPL98il6MDkSyNWGRT8pPqxkJVsNggRlv7DUX65z816NGHh5kOrP03RjUWBdvNYXzG4KtS3mqp349UDG+loZQb/SWMPAmjmNdiukrS4QxJhY9bgPCARKY588FGgHi2mAymph4WZAyFD1GAxONTE+onG6/QJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 14:15:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 14:15:02 +0000
Date: Fri, 30 Aug 2024 09:14:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Treat hwmon as a per-device concept
Message-ID: <t5zegawxd2tvjlyae4ofxtqj6vcc5ebrqo7nxcbmkxuwqvqo4b@5xvcd52c7veh>
References: <20240829220619.789159-4-matthew.d.roper@intel.com>
 <20240829220619.789159-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240829220619.789159-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fe960f-d24f-4803-6d49-08dcc8fe2329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lITIZjqA7RQgrOjyAtOPPg9cr+yeejQ/PiKeK+j9s6TaiZjYUdWXqzf77J6B?=
 =?us-ascii?Q?hQqL1H/klgKHezxiP+wsckRCEFIfRN7oroFUigtwWXjSJRBCQu/fIj4EaTCY?=
 =?us-ascii?Q?VMI1ZhPWXuiN5MggAlBerAOo8LOEWK8B62HheSbTaOBT+NiuB233z60AySoR?=
 =?us-ascii?Q?O73qh6c5wgOXu6atC+HYRRe8y2HI7BVJt61KVfy6DK/a/uNaMkERFQaoCWAw?=
 =?us-ascii?Q?+PdEaRhMEwGg9/NPaqs4JQZnyjCcUX8WGDu5i2geiiz1EXIax6l48puX2z95?=
 =?us-ascii?Q?36vcokaAQmUQcrOXpE/doKQQvXRHlXA0PGj9IPYuD3Y09+jtAJDcYF4mW1qv?=
 =?us-ascii?Q?dOv61JQCPK932g/nHSjIvHx4/f3BBqwhrK768dRHl5QHJkDE6J1x5nW6VMBy?=
 =?us-ascii?Q?YGzloWn0g5h1wV5mTt0pZ2mfGO839AgrLKP3H1q04eV0QRWCbsBsON4Vu/g9?=
 =?us-ascii?Q?NK0dGWCm2Xw5E+xFFAvqTKR1Dn+rLXZlmyD9D+1mr00jaUaURKVMOPvPyQzZ?=
 =?us-ascii?Q?LTtTTZtd7NJw4qM8lNUBlAKVssDeG7ncxJshYkW7oDZGc3gl/dK+82EWjRWg?=
 =?us-ascii?Q?TtWCZdktvIcfg+TBIAVjWe/HT7Kd9c8Af7LAtByzLVnxyMNQavmVsDp5fXW3?=
 =?us-ascii?Q?xElo8dLPJWdH7W7kC+3Vx0TjMkHMsD2OiKu0jpgGo6qSBTYZ+DtpqZtxyTDw?=
 =?us-ascii?Q?HsMnibEghPDYUJ2nR1zpObyFWtzl6Uxan6GkFN7UJQ7Th1wm50mIZgYH5qee?=
 =?us-ascii?Q?q6C0qzNnBS1z669uSsYXnH442aHNvJxBYHBauI7qvfAaVKUERdPZOvfrmkyV?=
 =?us-ascii?Q?5hmBqXV7tM2nHlgxANbvN6wndamzoqOlebQP7kCQF99oyIvWtRxGS7Lq0f8z?=
 =?us-ascii?Q?0c4WcNJpQamsaOmZNIkn7DL7cD+3+Nv9Ge1nF+i33wAVr1LkgSOp5VI94S2+?=
 =?us-ascii?Q?CewoX+Zq2so6Kxyt2TPKCZr/JuD9iFIPk2MUC892YO1VBVITTWac/T8ru0BR?=
 =?us-ascii?Q?tIb718tHxMM+Tv5rgROrZfZFjSQVRR/1cNPrBo4iZo/ervMRkYCgw5LOpFn3?=
 =?us-ascii?Q?4KD1rMDfhz090OYxnSTLhX8cD2BaHAKDhiFNoZkyRdUoj4HZj5ew3jp7aFKH?=
 =?us-ascii?Q?zfXKXT/rqYZWpEef7Lh6Q9VSIPMBrnxvAlqw2X0z3iLC8k91DE3jY4rWictV?=
 =?us-ascii?Q?O5FhWy0IQDwc2+FmkMoma6yRKyEPk4LMZhJ9JxiQjS0qzbQ+pmLC0+A+eUhv?=
 =?us-ascii?Q?Mg3wDljcB5nx5Xvb5hK5FBtInoc6avog4ZUcpfhosp0+FmAQGkBunykJzorJ?=
 =?us-ascii?Q?Erj00VWMo74rF6OBfQ//lI90qI05MqcOug95S3kCLx6Ojw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCGv2YnS5sxnAipNEoiOOgKulnRybhvO/pddKFYMWoASUxBha8u6jp4rneIn?=
 =?us-ascii?Q?B5ygXoZd/trTXnTuotoq71eGqnRN+pOfEODxTlnDAQrCSoeagVebhM8grg12?=
 =?us-ascii?Q?axsPOrQWwmbOIl/kTBWdfMUg4mORQfh41764MAlXLXPfsjZWnX4xXF839D7U?=
 =?us-ascii?Q?A9cvXn/0x97RuDBzhsvYyNHdcvzJGgFVTJjkQ5KEFn87G20WW56k92VfWuNj?=
 =?us-ascii?Q?viwHntYDsHnrzc5syq+OtPPOa2kvuWFe7NXW8xWbzs172a+DiE97GE+xZh7B?=
 =?us-ascii?Q?GvvcnywSGAmE4aYGUAPF4J0sCBRC8PO7AZiUFZOg7dyB2tTdu03N4VpCR5EF?=
 =?us-ascii?Q?TQCmt4HGeqqz3WAYM+hkIUNz9UKBtsXTSguEF9k+QahlOy9gYzonXEyTddP8?=
 =?us-ascii?Q?Z6d5VIVhfPJjD/dE9M9aBRFNlznEZnpefkn2CoKmVrhBHpgg7f3MymgKNXYG?=
 =?us-ascii?Q?nMviyHJNH5ifFvLfXrAFv0r6OlYL99O8oJlRGjtnejm+d3i1OPKDPY5uiZyW?=
 =?us-ascii?Q?erUcwHFTqHgqVmI4+lEiDnYor5AYwFiGDZm+TEzGAsoZN6psJhLQhGbtRz8j?=
 =?us-ascii?Q?Pbjg0Cd2ccHeRTL8ioURH3JMvBbEMv3W0hcqdj9INARlbhsa4S9u05YeMUIs?=
 =?us-ascii?Q?Jy9k6SKTkhc8syp5oPtUSU+L7+kWp3jREDHrnOEOl3050AZkhlEt/dXRrC47?=
 =?us-ascii?Q?e7DBX7GcbuMxIbBDtBKYTJOlDvsbJ22dT4N05EIBecvE7csachCWMpjLoOgB?=
 =?us-ascii?Q?nX05CCxq8CGlKt9yOYSoFoex437iB4hJXJulmTxwHYT4Jm5GzmbiGfPZg28c?=
 =?us-ascii?Q?LbWv1Q0676/tgJtETVTiQefGEzPbVp0TqDSr9t9qDew2rqVQ2SpdUytQ/mez?=
 =?us-ascii?Q?WuaS1J5d7HpNoqtGuDbnsyyQfSdlzQqCC/ar38kiwITRl3TfEEWIP1jy39I3?=
 =?us-ascii?Q?FiCBgqOJkvezz0s3TdQR+4js/cOCUn5vfqYSjnO/QChH+yB56+Ylx4L6MR/Q?=
 =?us-ascii?Q?UXQfk5s1QPlfE9vol1bbPvitshKx0JvQDLftb7C9BCRbNhryGTmpewe1lI++?=
 =?us-ascii?Q?7qmP1Cd/bMuJsFwouKotge93eWksdvU77eJZTey4zyVVqRdXBqq2bxGYQQ5V?=
 =?us-ascii?Q?L+UpiqDJeLKv2ESGMNv+QjLob/haYjRm0kjSjpdCicpLBpvkpHM8GoYJ9YN9?=
 =?us-ascii?Q?r6rqDSz9EXJ69+8HCJT+b6HcUXQL8slMTta3iXgt1tHnreYGO/9OsYAPLokF?=
 =?us-ascii?Q?WoO/b0IiSF1KZbxR+TOrh9b4D6milrSwyiHSps3cpNE67IJ5aPRAQJp6l5xA?=
 =?us-ascii?Q?9M3RAKog78En4N+dpJwUw7MPRfp6DcL058o1pjfZdE525SgwM0oPVPxfyhXd?=
 =?us-ascii?Q?ea/jINT9Bar4Kw6PQAxfjyWlzSsfwXgJ+Ro3gSzgc+wpuVBwkWOD2FJdwVnm?=
 =?us-ascii?Q?jV2qq2t8pm8A/P4F159L/X4EHXLekAXSqiMdU887cqZzMzgxU5LNzrv09KV6?=
 =?us-ascii?Q?r3u2ewpBO3fMqjnma5ogITa6AgXiJWCs823t1rlVJ4E1imB9c4oC+OsyFuKH?=
 =?us-ascii?Q?fmt1NiIgJwT4jg/xkbPTx4CFHYnrcPAoMjkJVYyAX09S3eZV9AqWHF30Cx67?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fe960f-d24f-4803-6d49-08dcc8fe2329
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 14:15:01.9338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VejzRi3fsw19Pp4EMdYPfdtt34r4FLao0a8WAaJNt4L7n+XUfgUBABTmVdvcvYuePdPhrNBP+nVH7evSiHqr3A1komXXr7TpEfSclCNLDYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
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

On Thu, Aug 29, 2024 at 03:06:22PM GMT, Matt Roper wrote:
>There's only one instance of hwmon per device, and MMIO access to it is
>always done through the root tile.  The code has been passing around a
>pointer to the root tile's primary GT, which is confusing since this
>isn't really a GT-level concept.  Replace that pointer with an xe_device
>pointer and use xe_root_mmio_gt(xe) to get a pointer when we need to do
>register MMIO.  This makes things easier to follow, and also cleans up
>the code in preparation for a much larger MMIO register access overhaul
>that's coming soon.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
