Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1919FCCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 16:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19410EC99;
	Fri, 17 Oct 2025 16:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4dYX3T2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9629010ECA2
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760719295; x=1792255295;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=42j5pzeQwmtOOSmzdAI1IineWWCAloU6mHOxZdn2Jnk=;
 b=g4dYX3T2gTtEmev/urtTt6/N1006rFXkqQGHQEJwfIBdaMPYsnL+L7/Z
 qzowmORzPlyeoz2Sn/t9CItjuXIHV1ygjWkipnt0H41tp1LMMdlLV0oG6
 8z21b0I5pG/NBqu/PcU1C3d7zzgZ7qK+0q/0XCCz4k/D4lNvAFMQJeO2k
 z4+4zyiNVckwSz+g/FfzNWnA6+FQBo2sQKfXETGkpt+JYqdugnx5tP3CX
 Pa40eQLdmrpDUlqjsaWB513R0ZIehiwDQtWpo1jYtZGIZW0BodxlEiKej
 l5tTuvp9vpKfM2mABiRI13JwUqhCV0juRJ1Twod+0E0IWN94cxayAZ6cw A==;
X-CSE-ConnectionGUID: UHMl10a5QaiEuVo8qofkdw==
X-CSE-MsgGUID: NmjzswrZQxeCw0gOObUBkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66765103"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66765103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:41:35 -0700
X-CSE-ConnectionGUID: +lCc0JngTu++Xn4dEaMh3w==
X-CSE-MsgGUID: vmvsLilWRdWnuPtBtWRJgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="182327809"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:41:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:41:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 09:41:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBFzfLb0gm0jCOE1HYc7U8RZehqYDV1qfZapjtHw3iUDYRBehurG3yt2GqmX8C8MdQBr2cMu3IBAA0T09xyb+7wGRBaeQLQTeXzBIDSCQ02yl+djKQZm1kkgJAXHxyd/8LtB0kb+owgZR6NejN66q9ObjXq7lFX76ObHfZE0JbcRP68hJJdcJOcFBJqiytbVbrjoTuXCcckIQErXZnwidT9ZkifiFx6QvSyPNep76aKu+Y46P76e4jBrq7z9P0R2O3vBTsUWudUM5Ndzg8tRxogl6EZ34jYEP4zXXt/LtguOJOiM9nrt1NHl8oYn04z/xpB33NsjYTim89//ZXX4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv9Nos0MoB6lIKGK1MvUVfus4XVbkYXGF8ATBb6sMcQ=;
 b=RV6AmgvIP0ANXpcUF0aeFcdkNrpNhm3WbIQDP+qQmSX53yj5t+DPOTayM7i7K6sEPKMZmYAX0nw4lDNFZGx7agyhGO1oYPBnSXfJ3bLO/zslRwaOCTgNFp1OP/Tc6IB8/9llWod6C2Ar2R3uFbshdl0G9slIrMC+mO8T9vvG/RS/MGrGJ32EYq2y6jlnDLZ0/QYC3aN0apXRjnlKWU6OLA0DLyLP7yP4Pu3mEmYtrFA4+848oIe79hREbh3q93GsjXCZbfX19eQcjLTtyCY+SN/sQYRjHJ35RiKDky7AfL27uWgNVoTh9+ry0k2hBEpixDM1hk0Rd97iXhdUvBmg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 16:41:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 16:41:31 +0000
Date: Fri, 17 Oct 2025 12:41:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aPJxt1sRKHQX3pRh@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com>
 <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
 <aPJgP9ShLrvSeXzU@intel.com>
 <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 61fb31b6-75c1-4c28-538f-08de0d9c0693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vM33Tjv4Qfi5VGwbdJObsasC2kCEd69Pq+Dc1HYkSveoR3E8WNaGcSHWDU?=
 =?iso-8859-1?Q?eeGnRXh+ooH82Oj0sxg7+9YPtJWp2EquDnRzy42qbPMpQ7t5qV3+uteN8+?=
 =?iso-8859-1?Q?JydWIpLayTibCeS9NQxMhQHMjanKj0aUzzMeGOPv0xxdJXDIH3y68bGOgI?=
 =?iso-8859-1?Q?cbdjdypu5kynTvIxQTHdmW8bpc7meTctXRx4wtf8Cjg4q+yt3ZvGIqhep4?=
 =?iso-8859-1?Q?ZmGPkrGD9geFOelyc4UHQ6PGfF3OqfxP+kqQn34bYqIH8jSxOW7ajd/8Y0?=
 =?iso-8859-1?Q?4jClhPUmqn6o1zf/BVsjvOObkUYeZC9T/WkEFP3Wml18DgEKDpXRxCVH60?=
 =?iso-8859-1?Q?yydrSzlIlcih1n/Zfleg3DLFSYMbJaLuuz2u62RkxY9uWj18KVwh85Mohi?=
 =?iso-8859-1?Q?/a3FXQIwqwngHw4CCxxzlGGq2nvC6Q0rfTeLGH06ti8hTHNThmGm/zoUXO?=
 =?iso-8859-1?Q?RPRi2A2hYvR+ex1AY/Sap3XlxRHvrtdN4AVYNduOkhPxbe8AcE2m0U3uVK?=
 =?iso-8859-1?Q?tsFlmwPvEUD5I1bCBJflAy2Qh1+Bnn2Gz+7/zwkZSqzBjjTCP11yZ0cEev?=
 =?iso-8859-1?Q?eRxzbmldW22CWWaiS1Gb+yaW56tsYdxXnB+gv4OwCylc9E7SKXqecz8HbH?=
 =?iso-8859-1?Q?avbUbMA/SirwTBw0kFtD4kwIaQLk7PWSEHhj3kpbLNOXXLU3ruNbxSjf3D?=
 =?iso-8859-1?Q?CPyricz1yGnR3Dya3vtLsseZwEJNmYF2XDo6PvlZDG0NO0D+siFdEQ9Mf3?=
 =?iso-8859-1?Q?AwtZIfQYChw/9XfDvCggIU94+1TD+IqwVAxxo/HyLLqULqs1ja/ljEYGK2?=
 =?iso-8859-1?Q?hSBeEhZ4NLXoCkJyEs0jYOYXxWxme2AMnLhYrE4g6vQZqUznZpM/RmNZcJ?=
 =?iso-8859-1?Q?VcEojsVRgJL0F0SkXTDCJlSJhi4W8deNjCs9HdLxoRQR2QIwI00Gnf3lOh?=
 =?iso-8859-1?Q?2ODaLvgHP3KGtQJ5aPIUKmkl8NOn0EVpmZDKV7+mrjb8p6NXj2w/+N4NeY?=
 =?iso-8859-1?Q?H9etUksEaP1iFM2yjLsl0sA3nuA8AU2V4l3G8HCdJ2UdONkfSpJUwN0dCg?=
 =?iso-8859-1?Q?JCB4UHIADJv6OvxDNqMPCfxOs2f38xPbx5lNMXL3ys3lf3Q7fkefayvwnV?=
 =?iso-8859-1?Q?UkcASKKcaGyPQiH28KyLg5GHS2p7hzvWcd7gMFHkxBvQqPa7O39hUmVfUV?=
 =?iso-8859-1?Q?/lO4uK5rri3ocGmLo1LSQOJKUDxFuNUtnkrSQnfwRTJhmgsw+lDSUyVAkj?=
 =?iso-8859-1?Q?k49csOFKPIOOCOFR5gBHXJz01GEBqRzbKE/Hj2pENXxMg6m05dGh7M6LtH?=
 =?iso-8859-1?Q?gg+cqGC51voaRanufEec2Ga+9ubEULNN40xXBygGdyRjR9CVh6/LW1T8Cj?=
 =?iso-8859-1?Q?nsB8R4uBhEOp8a0ksWM4uZyDsk+NAVfF3Lfx4cEphxqKFrzl/JAG5tW66h?=
 =?iso-8859-1?Q?QolylJ5slW3hIgp7YaBAn36zQBY+Lc9z7e4LnQ/+300kMWQ7Uee9ZUVsg/?=
 =?iso-8859-1?Q?GclkPJ8f9JU8bU0ohj+Ck2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6+L8lubskALsqHl8PytPvtoYXsmhJWv7GiOF5dUMHJz9VDhYUut3+Ci1ZY?=
 =?iso-8859-1?Q?nxpg1bYvPPdAj1UiNDn82W7RQcTiFyxL0f7cWUwb8FxYKGza/7czuS3gXQ?=
 =?iso-8859-1?Q?X0Qo4tSN07UdJSnHPah4y9IMVBxyRZWc8oogFQHvG+vmChbrhF4MpxkB3e?=
 =?iso-8859-1?Q?zKpXb48cZczsMVttVRjq2BrKsWMFc+lox3ZmSn80wy/cgIBKilssj/63Oc?=
 =?iso-8859-1?Q?iardNopkXvVPJ2l8EEVay/TlAZYkSJJf5gosnzpQcIRVSA10fYtxm/bZM3?=
 =?iso-8859-1?Q?v1gGmQDyVwbL0ann/8yHvLCJTxf/OK/K9qsqnABi6DCdJkYt11SplibF6n?=
 =?iso-8859-1?Q?ZeXZn33fMC7v95kUHNf6gD6qxfhIbN3WBmtmoj7svtixpByMasl3z4KDci?=
 =?iso-8859-1?Q?jIIYMpUm/tEhG6cc/3le/u3sT1G3jaVGUVFEO8fthkE6kqEego/hXjWrIo?=
 =?iso-8859-1?Q?Nt2UoE0nt0DJupBKLDVRWE6EWalAvyjMl1JrEyT/WlCQo9/Bns9vmPoj+w?=
 =?iso-8859-1?Q?nygu5wITPu/83vRL68vZsHvwUj12cwA/ro0V1VEUScmRmw8782ykKmvsSL?=
 =?iso-8859-1?Q?EMU81vJN0ZKce0ZAfeDjveb9FwkAC/mgycFMPnm7G+XaRfL2B0n7kSVDrf?=
 =?iso-8859-1?Q?1v0PHuPythrRmfjZKOyAgCmL24lxBRZKP2AFBKZ19cJpW/4QNSLEkShoGu?=
 =?iso-8859-1?Q?avjrNU1ViMqzqtx03IrHBnstXQyyqzsc2muxh55AfLDwLlzQYLDmk2LZYW?=
 =?iso-8859-1?Q?50G1AabUMm+Tt7bsWtDxKz4RwUNIxUJEHKKXUmFCYsFxYgySp65+PZzUFR?=
 =?iso-8859-1?Q?VToy18hvSlbhsNDmXy36xuBIcyZDmtxUG9V9ETz0GEMfazfahH1MPf9chi?=
 =?iso-8859-1?Q?PyGcLTXKvJgxmWO0QfmuX4TIPD9ncpha5e1xkimNoreYXovxp/I5Fi81zU?=
 =?iso-8859-1?Q?lf9DcNrfQaL8J6B52W/QN/CEcsG/aO86HZEyn3GS6ZERmM1a7NVIqSL0ap?=
 =?iso-8859-1?Q?9YcidjqPAcKy2Tym0mnYhPK3J2GVStSVeyZjW5AaVAluITbvcwQdfoSTNo?=
 =?iso-8859-1?Q?M1+PpEpE8kxUtt0upmeD5SJYQ8S+OYqj3nhdn+I5QwqIJy0ZiHe4UTFE2H?=
 =?iso-8859-1?Q?mg0121Iw65OTghDQqH3zpcYS0gZy4YfOowYFwGcVBkWaU0+VgscNO7alJW?=
 =?iso-8859-1?Q?GSGbiaiiSVku0z9w92miublYUSf+1DvWIKFuW6TehjAN1kvEHe2tIdhBTc?=
 =?iso-8859-1?Q?docIDMqcOKltVs1ijzwegKXUyPlsLZa6AKW9PfeUeKW7x32xuxB/XdGfED?=
 =?iso-8859-1?Q?IQq87fb/EI72ev2PyUA10f2CB5yug9jm8i9wwFv8eBA0R75tkw1Yo/TRiW?=
 =?iso-8859-1?Q?qlNYxj0g0+YyR+Yt1Nh23IZVkmVkM621/VokssmYHKoyy+lp+nEwyg8n+R?=
 =?iso-8859-1?Q?lxt6xueOYZjaIkmfKfxeAnu/ctZW/0ZlNf5mPAeLZEdkn/JkwWritnEZas?=
 =?iso-8859-1?Q?mn60/sqTJi0KrbmZO1a4pxhplO6mSu2kuuR1h5P3bkmxpC/CCLtYup62MM?=
 =?iso-8859-1?Q?x32OkRHrMmeYR98rDljPRnD+lk55Dp4ARjQkgS5uWMAXH7WLbfM8YL9NeI?=
 =?iso-8859-1?Q?KtFMSQmFcAYJ5BKVADoYv+/jZAowtfbavJXk9oDBjek2aV2PZo8F++uw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fb31b6-75c1-4c28-538f-08de0d9c0693
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:41:31.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7/+z/qPgyoMv+IrtgxtjmhdHQcl6GbbiAtbz4E5wBtW4PIe3vepd/8g70tIm8v2BM2AHMU191hMbYOH7PNruw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
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

On Fri, Oct 17, 2025 at 09:59:48PM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 17-10-2025 20:56, Ville Syrjälä wrote:
> > On Fri, Oct 17, 2025 at 08:46:37PM +0530, K V P, Satyanarayana wrote:
> > > 
> > > 
> > > On 17-10-2025 19:57, Ville Syrjälä wrote:
> > > > On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> > > > > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > save/restore while this sequence is being programmed, partial writes may
> > > > > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > > instruction to write the sequence atomically.
> > > > 
> > > > If this whole thing is so racy why don't you always add a new
> > > > BB_END after new commands, and only replace the previous BB_END
> > > > with NOOP _after_ the new commands have been fully written?
> > > > 
> > > We maintain a suballocator for batch buffer management, with size
> > > proportional to system memory (e.g., 16MB suballocator for 8GB SMEM).
> > > Batch buffers are dynamically allocated from this pool based on the
> > > number of active workloads. The entire suballocator region is submitted
> > > to hardware for CCS metadata copy operations.
> > > 
> > > We cannot insert BB_END commands after each individual instruction
> > > sequence because additional GPU instructions may be appended later.
> > 
> > You *overwrite* the previous BB_END after the new commands have been
> > appended.
> We do not know where the new BB allocation will be. It may not be sequential
> and every BO has a BB. BBs are allocated and freed so often based on BOs
> getting created and destroyed. So, we can't use that approach.

Satya, the thing is that this Ville's question proves that this commit
message and comment are still not good enough.

Ville, the thing is that this buffer here needs to be written entirely
to the memory. The execution of this buffer will start right after the
VM-pause-stop. You cannot stop the VM while you are writing this BB.
Adding BB_END might possibly ensure it doesn't hang, but it doesn't
ensure that this buffer is entirely executed. But I believe that
even the write of BB_END may parhaps be cut in the middle here.

The only way to block the vm-pause while you write the buffer is with
this AVX command.

So, the asm here seems to be the safest way.

> 
> -Satya.>
> > > Instead, a single BB_END marker is placed at the suballocator's end to
> > > terminate execution.
> > > 
> > > This patch ensures race-condition-safe CCS metadata save/restore
> > > operations by guaranteeing atomic writes to the batch buffer, preventing
> > > corruption regardless of when save/restore operations are triggered.
> > > 
> > > -Satya.>>
> > > > > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > > 8 dwords instead of 5 dwords.
> > > > > 
> > > > > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > > chunks.
> > > > > 
> > > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > 
> > > > > ---
> > > > > V6 -> V7:
> > > > > - Added description explaining why to use assembly instructions for
> > > > > atomicity.
> > > > > - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > > > - Include <asm/cpufeature.h> though checkpatch complains. With
> > > > > <linux/cpufeature.h> KUnit is throwing errors.
> > > > > 
> > > > > V5 -> V6:
> > > > > - Fixed review comments (Rodrigo)
> > > > > 
> > > > > V4 -> V5:
> > > > > - Fixed review comments. (Matt B)
> > > > > 
> > > > > V3 -> V4:
> > > > > - Fixed review comments. (Wajdeczko)
> > > > > - Fix issues reported by patchworks.
> > > > > 
> > > > > V2 -> V3:
> > > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > > 
> > > > > V1 -> V2:
> > > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > >     (Auld, Matthew)
> > > > >     - Fix issues reported by patchworks.
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
> > > > >    1 file changed, 91 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > index 3112c966c67d..e0be7396a0ab 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > @@ -5,6 +5,8 @@
> > > > >    #include "xe_migrate.h"
> > > > > +#include <asm/fpu/api.h>
> > > > > +#include <asm/cpufeature.h>
> > > > >    #include <linux/bitfield.h>
> > > > >    #include <linux/sizes.h>
> > > > > @@ -33,6 +35,7 @@
> > > > >    #include "xe_res_cursor.h"
> > > > >    #include "xe_sa.h"
> > > > >    #include "xe_sched_job.h"
> > > > > +#include "xe_sriov_vf_ccs.h"
> > > > >    #include "xe_sync.h"
> > > > >    #include "xe_trace_bo.h"
> > > > >    #include "xe_validation.h"
> > > > > @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
> > > > >    	}
> > > > >    }
> > > > > -#define EMIT_COPY_CCS_DW 5
> > > > > +/*
> > > > > + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> > > > > + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> > > > > + * VF state/restore operations.
> > > > > + *
> > > > > + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > > > + * VF state save/restore operations. Since these operations can occur
> > > > > + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > > > + * buffer are written atomically to prevent corruption from incomplete writes.
> > > > > + *
> > > > > + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > > > + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > > > + * sections. This prevents vCPU preemption during instruction generation,
> > > > > + * ensuring complete GPU commands are written to the batch buffer.
> > > > > + */
> > > > > +
> > > > > +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > > > +{
> > > > > +	xe_assert(xe, !IS_DGFX(xe));
> > > > > +#ifdef CONFIG_X86
> > > > > +	kernel_fpu_begin();
> > > > > +	if (size == SZ_128) {
> > > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > +	} else if (size == SZ_256) {
> > > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > +	}
> > > > > +	kernel_fpu_end();
> > > > > +#endif
> > > > > +}
> > > > > +
> > > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > > +{
> > > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > > +
> > > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > > +
> > > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > > > +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > > > +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > > > +	} else {
> > > > > +		memcpy(dst, src, size);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +#define EMIT_COPY_CCS_DW 8
> > > > >    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >    			  u64 dst_ofs, bool dst_is_indirect,
> > > > >    			  u64 src_ofs, bool src_is_indirect,
> > > > >    			  u32 size)
> > > > >    {
> > > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > >    	struct xe_device *xe = gt_to_xe(gt);
> > > > >    	u32 *cs = bb->cs + bb->len;
> > > > >    	u32 num_ccs_blks;
> > > > >    	u32 num_pages;
> > > > >    	u32 ccs_copy_size;
> > > > >    	u32 mocs;
> > > > > +	u32 i = 0;
> > > > >    	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > >    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > > @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > >    	}
> > > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > -		ccs_copy_size;
> > > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > +		  ccs_copy_size;
> > > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > > +	/*
> > > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > > +	 * write the sequence atomically.
> > > > > +	 */
> > > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > > +	cs += EMIT_COPY_CCS_DW;
> > > > >    	bb->len = cs - bb->cs;
> > > > >    }
> > > > > @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > >    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > >    }
> > > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > > +/*
> > > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > > + * save/restore while this sequence is being issued, partial writes may
> > > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > > + * emit_atomic() to write the sequence atomically.
> > > > > + */
> > > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > >    {
> > > > >    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > > +
> > > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > > +	dw[j++] = lower_32_bits(addr);
> > > > > +	dw[j++] = upper_32_bits(addr);
> > > > > +	dw[j++] = MI_NOOP;
> > > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > > -	dw[i++] = lower_32_bits(addr);
> > > > > -	dw[i++] = upper_32_bits(addr);
> > > > > -	dw[i++] = MI_NOOP;
> > > > > -	dw[i++] = MI_NOOP;
> > > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > > -	return i;
> > > > > +	return i + j;
> > > > >    }
> > > > >    /**
> > > > > @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >    	/* Calculate Batch buffer size */
> > > > >    	batch_size = 0;
> > > > >    	while (size) {
> > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >    		u64 ccs_ofs, ccs_size;
> > > > >    		u32 ccs_pt;
> > > > > @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >    	 * sizes here again before copy command is emitted.
> > > > >    	 */
> > > > >    	while (size) {
> > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >    		u32 flush_flags = 0;
> > > > >    		u64 ccs_ofs, ccs_size;
> > > > >    		u32 ccs_pt;
> > > > > @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > >    						  src_L0_ofs, dst_is_pltt,
> > > > >    						  src_L0, ccs_ofs, true);
> > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >    		size -= src_L0;
> > > > >    	}
> > > > > -- 
> > > > > 2.51.0
> > > > 
> > 
> 
