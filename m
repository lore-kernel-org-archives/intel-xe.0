Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B316C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 21:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3E210E975;
	Mon, 25 Mar 2024 21:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guP+UxSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0320210E975
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711401742; x=1742937742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LPsdQgHoJJpMHNMxIdG1bO2deg4NH05n6xwxyhGPp8A=;
 b=guP+UxSHmqUN8OUzkl/g1POKu3l2UdE7PtDiXxb+pQ8GZTOGU8fw7sJD
 9AOXv4BARoa9NKWwV6OvyknYMQutZ6QD6qajRVWlEc3LWpaT9eE+XfXI6
 oWT6XeEwOkBDnrc+YRn/cSloWLu1wUNq8fKdsllhuxLXw7Whqk47jQGCy
 klhS2o+SC+Rh9TAcRF8yqd4N8PUUxVRC/zrcDxV4li86JNskO4F3vj/+I
 SPr25rubyC0pMaY0xPiqHVrI+PH2gtbL+UUmiwv5F1bHLH7yucobkgWqX
 3IGPGuvL5HTzSB2Of0+uppFJ1uvztYcmUTbo60Rw0QBpBbLXiRFyOaXfe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17861961"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="17861961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16417307"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 14:22:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 14:22:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 14:22:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 14:22:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 14:22:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXV/7RwLYpROcKk5IcGL9VyPTGazloIyyEtnnVvNHaoup+q7lSy8XiZxlGkoN4wD7jzsnC2tQs3GVSbeOrWnhNjbbGWgeQTzhL3kH9qg6ocUPNanlhupeZ5nA0a3egp8wLd4k51L5D5t/WTwohqDpuTL2hs6Z7hz9P/sIZcAY5kSFCCVDTYC/c6V5yXVa1ofVjy8RsJuYAk2MlQEcJeBSjjtr3FwqTYtWHA5++uhddZrbBNjGDlPU/7gC24B1kv+Z/P97aH3kkLXta8AaNg8TPaxDHlqGDtGs/1Gw6vdVhyMeX+kjYdGWOcxt3shuaJZGJw7VbPgCgSnnnNVCEIoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/wBQz5WLK5Fb4qNB1nli+ooIRoYLJx8rhH8s+H0xy8=;
 b=MACimCJhNDxhkh+uoh0NTL1SoYLsn8VyiV4v6DjiCvvTFiA8C62DyEWJ1xGT3g13brHQiBYHyhX8VRJd4QAYYK2BP1zoxpmoB8Ta89LESEo3hqdvE6KbE8wGoBcGaj88ZpYyzNCHZLlgNv94IDnme7BQtcWF+mjCkwvNR1wo01zA5uXrWkROmp0j/9KREaLAeCuKygCwEK4yG5Kw6CiA4oNpM8CTmOHEbuS6NHfnZA8YScqkGoVDKI1nx6L5kKrlteJY7/9M5Jw+/uBY90UTR0uIEzvjZP3+JCieEYc/0Vxh1y1+G4lxPNALlWSAjHeDxQN5lGgjHaW0IRO5jOk+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 21:22:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 21:22:13 +0000
Date: Mon, 25 Mar 2024 16:22:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe/query: Define and use a constant for the
 number of masks
Message-ID: <nwogfwjufbp6now5u4huaumpxf2cfeggeyobumovdm4vuv5ong@siqwktqabnrk>
References: <20240325111439.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240325111439.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6275:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkSZVbK5FHXuC9fG8rnEWZmV+bLfWysY8eMJYKwS5xuwOvVVlApdGMCRXO8fZAvkpw6zdjDWB7p9ioFDU9whjeV11vWF860Bye0tdtorvrnGX9NyjMQFWkCA3mtIHFru786QomChnLxwrGk9qe657RZtR6ukiTOpr+AXknZbvyznczJISYPRlTyIqsGd1rjnkJQCtpqlqdllCw0tCGTCcZqbeuSAN2fdws5X+sW7Wc23OqDMRXUexqZx91cpjhVpKO88z3xERMnv+8KVO7BcvdRYiIA2N2zj98fr+H4f4rurQFe+VjPWBpa/Iw+h6CHgF3+b0x5cogs17DQQsjKcHlGY4rp+u4z/Jqupv5f5g640QfXVS5qtY4knWIH8cc9NSZDcgFB+EheXjgzQYxZAokJXDnrzdsO5YWelLpUIioeBP5FJz3wHnQ+cMIrjXQWkiwnlwfZqUN+85XDK3dNMKaaLcq0XnZF3ugCJNSA+kwTqQhxIxQ+L9wz/r7tXAfbwlciW47+3Ojf+pKNWYVsFjrLoeQc2fngSPYjYJpD54+DFm0y+XLXHXi68sO9QzVAn0PJOvPkX6M0YsvqW5m3tWxLNcltg8tOGWlXVZgTEm+StpYDKFj8aDaAevpcFbiCqfmps45ZOmn8vCZytYB7W84QebMWcOiknL+kCgH+sbFAl9bik5SmOwdpEPJgHx6981MFOa/U1Z8oO5boVZ7qy5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(27256008); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?txUxg3W6ENwtyjFr+eyPabHFxcnGaBYjR31tNc5g4WkuMHIx11qsJaZ7OYGe?=
 =?us-ascii?Q?cnGDFOrUePWW/vuQrcBI2RvTRf2zyapx3FxMiW/mBalxFudN2bZafLkCgiTZ?=
 =?us-ascii?Q?NXOKyoTwR8SR29i/qYz8QA64b1fjRTkqeanAK5WL4sgKiLkXP8bhq0HVCuNG?=
 =?us-ascii?Q?qdpU6sfReAj98JdypfivL1dC2BvDg/XO7EjDZFLLb3mBlyPALz4z7jbs357B?=
 =?us-ascii?Q?g7OzHFD6LU4wraXpflbFumZ43p2Oa+rsDclOjLxIyyurSWwJLRmsNOYjr4F+?=
 =?us-ascii?Q?2nX0lQwIayfrDEorfp93L0ZIf0/3at6o2O1oLlwQBksECEB21O8yDcasRGxs?=
 =?us-ascii?Q?ILAzh9P49RuStz/6NMaiHGCC0cH6PLECl+Jtrub9B3km3x2vXwzeOLjbz2an?=
 =?us-ascii?Q?1hoRMKyvonOjlQRCGKzZ2D7LW1JzkHTJFxCj32AFgZ7JJrQsVJmw9xQQbivZ?=
 =?us-ascii?Q?S0l6xZnHrMeIfSyYLbK/uWjbIlcjjkbOp+OQFq1wZQVZdE1B3NntW1//wNET?=
 =?us-ascii?Q?oSiFnf+L7vOhcF4Dh46H3k/PkuEU1qjPnAonvIT6C/6ZrnCT5cN/Gnd+YZ8g?=
 =?us-ascii?Q?6xdFoBhQ941x2S9DaMbFo89zyvDHJbngJMvF2k4rw7Ow4/+CHE4/kkF9qs82?=
 =?us-ascii?Q?+ygXAeXWCHfb6iJORTebjEZcifXUkAm5wSaj94eiLuETpD8xbL/pJV7iJcEc?=
 =?us-ascii?Q?H6xQwaobwgSU0AGfR3FR5wjTG+Qcv/stG+Jc1kR/ItoYWnR3yhx8RTyj21Cc?=
 =?us-ascii?Q?2cw3x8U8hZHPMBcDo48NoiKKiJQRzMfYebbV9lV3D2ilmnsmvxMtlGs2qTqI?=
 =?us-ascii?Q?q2gudsILCTG1y7eKy0e2Y5yYM8s86u6T/os97x4VPgpuujlsnotuA+u6uada?=
 =?us-ascii?Q?Qa9eI6L7eiv1eZWMZ4N5u+00WYfqkN08SGexJ4nXVunfL8rgEPGi7MjNczPU?=
 =?us-ascii?Q?lO0sl26zIK+9gfSb9hHAFAfbj2bMLEv1x+7jj8r0c3U2D9ORKDJWm/39v1QC?=
 =?us-ascii?Q?7oL7GpZChF/JC26cOLnDBb9+5FzetbT/fLy6imtoamuLGCuEL0uRts1ROhjv?=
 =?us-ascii?Q?1P62R8P4KEU7VhsHEOMzVLAyReSBoNewjJ+YZKZq29/kVOcA2hwM0Rv1Z6wz?=
 =?us-ascii?Q?8h/Hct6Ixy97+jHceTijKXgCLUFdx9TP9ODr4GfJ9+HdL3YGWRfNC6NodHBq?=
 =?us-ascii?Q?dsNyzHDOOL1qX+li7nrcOO7bbCY5AUzvZ+L3/uCk0yadc4e0WRFQpF/7ec8n?=
 =?us-ascii?Q?Q0COuMecZxrQ5uY5QRjcsDYI5J90nU+/uLiwpFbzM6l+L5eHC9j9YXgsXcnx?=
 =?us-ascii?Q?BKmmlcf5LMuokT77CMOc0YCppzO1eatbkuQjeJbf/9cg8Tli/ivOIyRlOF65?=
 =?us-ascii?Q?3JsObvvALeNbuse6oF8ryinvfUx9vfEHcXEMsT6soy1Gh06typgCeH7Qnj3O?=
 =?us-ascii?Q?m8GW7kwdnmvV/yamToDcy/tibnLivwV5FtyXMZR/8ktDZY8DyHl3trPQSWST?=
 =?us-ascii?Q?bx43dHFmxb+acGkTvl7g3+jmLNcWurnqfRe3FAboMysPceiaLhL44AsMVU8+?=
 =?us-ascii?Q?44g7j5ShkiVWO3/YAiwiahXryB2f1i9VZDIidT0vT4k3+65wxqSYSnSKi33A?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3af42f2-2397-44b7-ccda-08dc4d11a3ab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 21:22:13.7976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPlnO2ygI/UilYs2YYubnkpHhgR52RGlKrt01XpYPSxVWDhL+KnrYE6Os+bOTY3jIdq5m/hZGq0yqOoqAXd88YlGIncS9aLM1vyQx7NyOTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
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

On Mon, Mar 25, 2024 at 11:14:38AM +0000, Francois Dugast wrote:
>Replace a magic value by a constant with an explicit name to make clear
>what it stands for: the number of masks returned by the topology query.
>
>Suggested-by: Zhanjun Dong <zhanjun.dong@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index df407d73e5f5..109a96212310 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -23,6 +23,8 @@
> #include "xe_mmio.h"
> #include "xe_ttm_vram_mgr.h"
>
>+#define TOPO_NUMBER_OF_MASKS   (3)
>+
> static const u16 xe_to_user_engine_class[] = {
> 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>@@ -454,7 +456,8 @@ static int query_hwconfig(struct xe_device *xe,
> static size_t calc_topo_query_size(struct xe_device *xe)
> {
> 	return xe->info.gt_count *
>-		(3 * sizeof(struct drm_xe_query_topology_mask) +
>+		(TOPO_NUMBER_OF_MASKS
>+		 * sizeof(struct drm_xe_query_topology_mask) +

actually no.... the number here should match the entries below

> 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> 		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));

what do we gain moving it elsewhere? I think it should match the number
of types and hence maybe use same "namespace", but that also leads me to
another odd thing:  why is drm_xe_query_topology_mask.type handled like
a mask rather than an index?

+Matt Roper who implemented this originally afaics in commit
eaa6ccf582f5e3252aedea81559fcbf71ed9ccde.

Lucaas De Marchi


>-- 
>2.34.1
>
