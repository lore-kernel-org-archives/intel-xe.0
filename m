Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F005D33998
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 18:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3841610EB78;
	Fri,  5 Dec 2025 18:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrahkpZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ADA10EB80
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 18:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764957768; x=1796493768;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E33//DSqpjx8LlYrhZH09RzoNf8o8EEoqe9SvhwYeig=;
 b=VrahkpZ7IzOUccNO/XKVqZGGSDrzLPv2JRTw0da5otcexMZbFD308XhR
 6mQZl+0lSWH1Xs1TZo2eCEAeVge5hhJMA7Qo1iWAnd/UEGDsAGLJc5e1H
 E4xOLh/rYxUl3Xn0obDymnjfmzWkMHUFiWTcwR7/wGobJjPEgzu7mV4AL
 2z72gSLVe28OlApUHVZl441QrU5+rZ3YGp/AN9igoXMRJ8OnNXG9FELpi
 l0YxqXVj3YiHj/wo7zXu44dkws3fHu73nALvpkJ7f/D4Rz7WjXe4tUbvs
 50F4L7uf+HiSnEiyXwlcGLhKU6aCI4oFH3MjyiltbpL9O3ARbmmzm70Vc Q==;
X-CSE-ConnectionGUID: ag5PooQ3QHePVL5riljsYg==
X-CSE-MsgGUID: Z71O4ml+RBeBfXsgQUhwVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84401623"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84401623"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:02:47 -0800
X-CSE-ConnectionGUID: DNxtcEwuRQCEPUivJ3gDgw==
X-CSE-MsgGUID: Oj/zMPaZSOOd7dQQ4W0BSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195604367"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:02:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:02:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:02:46 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:02:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjruDa/RN/Sw+LY4uT1EHQX2ALS1djUZS6SEBaz6fHmG0a9c2CNynaUuaVS9HPhVEjKbOPIVf8kWwLJRuBoz5/xfiLsrR8MAXxuCasT8itGBqUeXk76nAeb6Yu3xmwVwhGb04cN3CN1TKz11TN2VEugRKUYjPDizi9QFPeY+a9LYoHfu3DmAw/oyKQdD/+pqyoirFfwVoej3hwowLPeoV7BYwD3FXESO5nAiRmi+omTQ8+iVhKFc2UTYPaUYDh/2QmwaEQ0l8UcCRn5xmRhprdqR4akPnJ1wSWyIMazb3Iggg6sNqhDZekrMk3nfhLONq4HhbflxvWYnD9AjxeLXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zsupE6yPmFDMuMOZzYVDFWbgeRo/viKoXFNUTFLG74=;
 b=BeZ5YYYfAC2+KjF+cz1SOmlbhKD4mnPHp19ZDh2NN36ifE9AawoCCJXi/m8jNJqEUyHuli5FjpxpniJhJEymM06NtDwW9GetOn0iZOmHh/eSaQ5xR9cUBeAyPOdrZNhOqcv5EEcoMcdmQiPeu243dc9erq5sZYNJ2xxeJJA0fA3u+zl4e32lVly+JO388uUx4HT/prvwaHjU/BmWgMtUUUFu7OTQiVZ7GWHAPESJ9Z55m+G0JjbwwKUwIjAXZJ8Qa5OKMwxDNbwnaLVsfbIHl8NH5+g6XIwZCSyI4dYGTBHLeVFAZM0TIagnOVefZM4L+S6vg5rzl8sRnrcWj0k1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 18:02:43 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:02:43 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Topic: [PATCH v2 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Index: AQHcXyjAUWBvjhATKkuIvv5gDUASVLUTY9Lg
Date: Fri, 5 Dec 2025 18:02:43 +0000
Message-ID: <DM4PR11MB5456FF2515F56F592DECA0FAEAA7A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-24-brian3.nguyen@intel.com>
In-Reply-To: <20251126230201.3782788-24-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA3PR11MB7462:EE_
x-ms-office365-filtering-correlation-id: 6a0d4f90-0d3a-4d6f-3655-08de34287cea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?7IO2zNWs/dtt0WYH0iuz0X0l7LS0LUwot4mLdhygsGbvQk2XjanM274JlhX0?=
 =?us-ascii?Q?qW3vjX27fCFZ0AKYDdUEWmwbrq5Yio/yKHfA6L8Y+/cycAJu/Et02g6fLEEO?=
 =?us-ascii?Q?UBf9Xmn7lo9Sry+fnVS+/AGNcd3x2mmNjqopTmpp+7drE9NP44aNcI1DSRg4?=
 =?us-ascii?Q?u57JUBAIXLDGwdl/ZTWHkbYo1L2d/Oam9K0SjTuT7GaV1z+/iLSuN+Pw6MC/?=
 =?us-ascii?Q?rFqlv3LTm271pFG9kvJEOgbAUWMy/0AtXiIfXhQFVnaHJaJmL/Mn5E3+/gbE?=
 =?us-ascii?Q?uwARL/E9EeAaQxl9zpOgfRaYlXLlGuTmtV/TRnl76OWwmxVB76ftnGghwhos?=
 =?us-ascii?Q?J4rAECfeyY1bFzV6jJkztIFWqcW6pO1T04eV6LAytCEyRwoVRFKpHSn40vWL?=
 =?us-ascii?Q?IwNTF4kiy5cJR0QgGYJHJLzb/SAYe0FcZzTc1LCaq4dctQI1wCE0tWtGP2p6?=
 =?us-ascii?Q?62ZWMdgeiW35yGAuh0jD1T+fIQ3PdqnUSZPEVIUCxH79MtWG76w/4dsZa2GQ?=
 =?us-ascii?Q?s6tOUdO0NrMXbsq9RM0RwPQvfumgqHSM3vReN0mAcLSQvfAcMWTgCX6jqJOW?=
 =?us-ascii?Q?YWU5++oOrejNDQnWqm1IeKIu0xoNqJ5wEEPM2sHe8a758IxfASp9RoAYlQGN?=
 =?us-ascii?Q?bGw1TrrbcVmMDAJDW7RKfli0WWaomt25M+fU8TQvwEakX/JnHepmqZu2WvmJ?=
 =?us-ascii?Q?B3Adk+8TZi4NcPZwrWMz2Uywiiso4wB+tF82am3XDhT62x3RO2NJ+dXhXl7Q?=
 =?us-ascii?Q?MKbLVPRPHk09DyF23jR39FjVCXrKLXcT003pY1sZ9g3gxX1buFqMGFdADCrk?=
 =?us-ascii?Q?Y++FmNFwkTLSucEqzqBPNJK756dNjo0zUo0K0mD2Cnv97oYAJcBECE+9FRs1?=
 =?us-ascii?Q?lmTkjKveKPZcZPlVe1R9nEBkAZnNekrUmP0TtH0o6ZHp/QsZPzO6Y6pPV+BP?=
 =?us-ascii?Q?VM+uuiYoDbdDYcV0i2HKHBWjB6Iel9j6FYkJQ5CzzvytPiCZys+rXGHz/NUP?=
 =?us-ascii?Q?7oWvBq1AUEQqcg2vae319ytnPp8IQmg5lFKu/BvhH+hdr62nEnUk0DAmeKVN?=
 =?us-ascii?Q?mVL+q6LMzuHQuSfqjKh9E7Fp0QmHfiaAwW8a8Z6R+bcZUxQn1NgMrlqLkjzn?=
 =?us-ascii?Q?Ju1HgP1zJ/HTAZPHXQgvcVxdtU6PXTilpFMrb9C6tco59nJzCs373YGjhqhB?=
 =?us-ascii?Q?uqbWFlUwyL4zu9211Q08ovIcYMX29OLLDqK3g2e8ydIyroL/hq7OTKOL4Am4?=
 =?us-ascii?Q?0ZVIZHppC0zchMtMQQuQ4GpvKGobTwXc/XJ1oJtyQ8c3NGW+flvKSUU2ESNI?=
 =?us-ascii?Q?+Pyhsc1wXxL7WBz9HzVPM5p7DZP8NZuB1aOtQM5BQM8fn+o7T4Do6Em0twKv?=
 =?us-ascii?Q?oSbNKaKDIgvphYzLB+xzGXhstF5gib/skAcZa2vx4q41l/ZX+OzBSuFDuZcy?=
 =?us-ascii?Q?coWbTO5hMgcBa44jOYaqUdrREM63PKn9HttczMLiHNQpIwvyinJrPDy7w3mn?=
 =?us-ascii?Q?viudtndHvZe1Dx0c/SV+d1LzPuiIYTtlp4Le?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fn4jJVXMKQY+wdXGtDJGeOWmReieKjcviHxsUwtI2ntuHxnfpabr2UHjRypR?=
 =?us-ascii?Q?B8RpCD9GwLUMOTTEQkQR8w7VZzyKMXeSJIex4Z5u4RSd+RBL8wJgCbmXtCNb?=
 =?us-ascii?Q?2PaLVA0d4Zhp9yYhxNHwfB5fyJr2SK4Y+zk4xVbtclvmaGJXg9hhrmRuf5Sv?=
 =?us-ascii?Q?1twmUdud6njh6N+iS1TQKmfckS4EEa8m5oOtqyzioK1mfx9FVdvi7f3i6oYn?=
 =?us-ascii?Q?BPX/DXTETTl0wNEKw9D05JmCZ9L3DOkY3i4KNF3YqNQNvFzNO08bNEfwy3sd?=
 =?us-ascii?Q?QzAkGxu84XepMM+k30tpp+tj6qw6FpzjjmxbaPIOVaCEnYIO6/VDrZTxHp3G?=
 =?us-ascii?Q?foEmmbHd/ql05VgKHrh2CL9WVD7TJke6sfCygNKwcHz3EpUXWXgynk7vvdhM?=
 =?us-ascii?Q?Yo0bPr+EJcvOdlTicpHe0ixDwMJzefjoQInlM9jD1EenHGuQz8DeRL3iDRB9?=
 =?us-ascii?Q?5tGx2T1FEAEZ81YnXuIKt6pFaYFGrwkx4kucZ60zbTlgXPHoAExgqWANonlg?=
 =?us-ascii?Q?ZwGWmTBY9DnvpNyz6D2UDgM78iZ/RDLO0rHLRQVetH1Hpmxwit9Jih2wUylC?=
 =?us-ascii?Q?GlPdaWg47eG1Zrd6PWxg0zcfZeyMbGNCygBfhZv4J56c5dF/Ed3bzKV3NuQf?=
 =?us-ascii?Q?5sW7d0a+c/4oPCbrNQ3PtNuXpa7UclkCAH7Wr/+iq7NLGM+yxwnUPCz8A2F0?=
 =?us-ascii?Q?tALgkpl3MEWz3zYK9lnZ/qEhuhZ3WI1N559GqIKFATB9DonGmE9rd1j9aq1E?=
 =?us-ascii?Q?OzIPcXkLpjOsURTsP2UHG/qVAPYxLlA00dXnkeHsqPcDwrIHLg9lYwH2nfbG?=
 =?us-ascii?Q?4JT4J54wh2GpaV2i7U7p/E3+tHCW+u2r69ziARaQzGcQrHSLDQm8B3wIpjum?=
 =?us-ascii?Q?soD3kvrD+hVJvdhlZtMb0XfhXCtJkpgwRnRZn7+APCCJehlLvEgknepz5VmO?=
 =?us-ascii?Q?5R7ymy7lalK3cGyu9aHFntkGr27qg6hxaPo9ezrEuMupf4p5QGrWoVz9KvqX?=
 =?us-ascii?Q?6l3MoqDFrmjPgsfLZUR8cHaccwPngmbZkSptN/d7T5cdLyOAvaxXVD5QF1gp?=
 =?us-ascii?Q?rvAswHfx+aHnbZHvAI2XA1JuncSh6fvN3wGvQvMNewYqfgD3EYP99si7MBUd?=
 =?us-ascii?Q?9IqLKOpzTw6nH7RXr92EmJouVfXh8F8TjpgfasACSU7nPcM0bDQD57Pd1xjh?=
 =?us-ascii?Q?vwBrd3c2acDq0ihnus3XOV9K/oHtolJwT0AT8gReADN3usdwAuGY2aoYpgtX?=
 =?us-ascii?Q?pZHlBxs3FAq9H54GPfPuEliBkxS/4ic7R9x/3fbe9g4fJfBxAYh44G5JThe4?=
 =?us-ascii?Q?olukpdj0dGOqxrRzWEqkYqMfJT/Tq3hfEe0qNXxIKFxGUPTvmsD88KynDOX1?=
 =?us-ascii?Q?BcAFDxcmFkYYrXxEFro5ePFJT0hOvjONkiWCgXDUQQVH6evqESrrynNL0M19?=
 =?us-ascii?Q?iZjSwbOwbVUQFYX71oyWWZ2ziM1fCTB8oHsuvw6xqRm1uzo4MBbHilkTT+lj?=
 =?us-ascii?Q?Q8ut83AB8KbZjbQq6q4G9d6TL6l70RhbA7TXb4+UL8e6Yn6myfWwa887wTOy?=
 =?us-ascii?Q?HOpCTgktGxJAV67VXBkvl9Xz8xtN+F9JIeYwyUmh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0d4f90-0d3a-4d6f-3655-08de34287cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 18:02:43.2041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JWHAVA5VVFA1lG1A6UbrJMP6LfSy9v/VnVsZCyQkaOww+krgJN1x/5mqJJe30LFvB0009BCk+DXTVakkzaE6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
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

On Wed, Nov 26, 2025 3:02 PM Brian3 Nguyen wrote:
> Allow for runtime modification to page reclamation feature through debugf=
s
> configuration. This parameter will only take effect if the platform suppo=
rts the
> page reclamation feature by default.
>=20
> v2:
>  - Minor comment tweaks. (Shuicheng)
>  - Convert to kstrtobool_from_user. (Michal)
>  - Only expose page reclaim file if page reclaim flag
>    initially supported and with that, remove
>    xe_match_desc usage. (Michal)
>=20
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 41
> +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c index 1d5a2a43a9d7..296b8136511b
> 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -291,6 +291,39 @@ static const struct file_operations
> wedged_mode_fops =3D {
>  	.write =3D wedged_mode_set,
>  };
>=20
> +static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *=
ubuf,
> +					   size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	char buf[8];
> +	int len;
> +
> +	len =3D scnprintf(buf, sizeof(buf), "%d\n", xe-
> >info.has_page_reclaim_hw_assist);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len); }
> +
> +static ssize_t page_reclaim_hw_assist_set(struct file *f, const char __u=
ser
> *ubuf,
> +					  size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	bool val;
> +	ssize_t ret;
> +
> +	ret =3D kstrtobool_from_user(ubuf, size, &val);
> +	if (ret)
> +		return ret;
> +
> +	xe->info.has_page_reclaim_hw_assist =3D val;
> +
> +	return size;
> +}
> +
> +static const struct file_operations page_reclaim_hw_assist_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D page_reclaim_hw_assist_show,
> +	.write =3D page_reclaim_hw_assist_set,
> +};
> +
>  static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user
> *ubuf,
>  					    size_t size, loff_t *pos)
>  {
> @@ -397,6 +430,14 @@ void xe_debugfs_register(struct xe_device *xe)
>  	debugfs_create_file("disable_late_binding", 0600, root, xe,
>  			    &disable_late_binding_fops);
>=20
> +	/*
> +	 * Don't expose page reclaim configuration file if not supported by the
> +	 * hardware initially.
> +	 */
> +	if (xe->info.has_page_reclaim_hw_assist)
> +		debugfs_create_file("page_reclaim_hw_assist", 0600, root,
> xe,
> +				    &page_reclaim_hw_assist_fops);
> +
>  	for (mem_type =3D XE_PL_VRAM0; mem_type <=3D XE_PL_VRAM1;
> ++mem_type) {
>  		man =3D ttm_manager_type(bdev, mem_type);
>=20
> --
> 2.52.0

