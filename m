Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E54FC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 20:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D856210E442;
	Mon, 16 Jun 2025 20:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GI+Y0KE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A441710E43E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750106184; x=1781642184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NUv5BMDfsUtmNTQGEcY5WVeAsfkUxCjuAjPQAc/O4j8=;
 b=GI+Y0KE5EeaZPzoHrzJgVjbLGM0IKGLxhgFfzB9MNfKAQosVB0RHxNxH
 YJ36Qya9mdsxNHLxjeGFeoszE82sTJGJv042aT96lIlTaJWV6dJC8HXwj
 DkDgp4XclDLOnmvwtuMiMmNoMkKrzr7ApYJzzhq95zjoup3fEPyy+tbw1
 P0xdY9ZOyO+/K9PauTSUyHZdjMgSHPMxdwzX+AIqLEjsyBd6X+EF2AIV+
 s+RCZQLm/htAT5SEI/bKmepJxqnfWyiN9oDw+9LPDc+8N521v0Ynt4vzP
 8reapFRC28q3mtBUP6dFHt6GyMfIRdeyyVPQabvPgeZnK3NIlS0c3QxTs w==;
X-CSE-ConnectionGUID: 4n5lmCxHQwer+ArthXzljA==
X-CSE-MsgGUID: nuwAwh9RQDCqwJl5+ASQ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77654870"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="77654870"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 13:36:24 -0700
X-CSE-ConnectionGUID: hHlDqCjcTmuqdxkiTUalbA==
X-CSE-MsgGUID: oEEZAOriSJS5rRgD0Szmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148408498"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 13:36:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:36:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 13:36:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCU6vWHZd8VLbS80tejutn9YeKF0C/bPr4Ov/SYuZPYcLCZNR4KVz2/Q7cHt+YsvneNNx4/hltlfnhJn/Y4s3iljjhoXe3E2jml6umIXW/qqxLvaQNWGzKfEQ6R1GG2nWnDm35XnWcfVABve1o6q66QpYh/bhWkeeK1X5+oAMYXQq4/gxT5LnYHvVFy30RT9MF+RiYRQqj4hleJjYpJLMCk3lbv48dGlgoKLAZIXBI9M2GhIXdosTgdyXZrlEvVVfGBV7nOKsi8TX1XgiSWuA0BfRb079/EZRXNvQbLsPzApzwRPvapEh0uXQUPyNl5Rd2viPQv55sadCJlX+sUcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fr4lDh5jtqf9gKLwFmp2ys1BqRg4q82HGuj2WCuixbY=;
 b=H5dSEgm0F2/JkBTO+0wTFVALw5uZtpD68B/bc6EUN/oQYa/haOjcPT63a9eWNox+SsECuLyy5TQGBLdysq/UyeLw3njzhiAV9oe1yOj221uKNwFmBPggrGEEN/8CLGZIxOwvdxIMFOEfis5TX97XsySLBo1KmllJ3ErLaDbUscT74/0PdZGU7imdWIEFskYANMdpCxAoPr88mukYvYzvXjI99NVPoGJhFPquluFW3g7TgP80i4Vc2YT52D3waiya/ijWO7eescVmReZxCTLKzkLOVWmA9uptVPKP511dxtpJ9c5COaqg27q3JYR+9MIpbi3esZ5rdEjLqo3slNyI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 20:35:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 20:35:52 +0000
Date: Mon, 16 Jun 2025 16:35:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Stuart Summers" <stuart.summers@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_22019338487
Message-ID: <aFCAJADgm7teI-XD@intel.com>
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
 <20250615-wa-22019338487-v4-3-704830697cbc@intel.com>
 <aFAsPdQ8EsSdNUu0@intel.com>
 <mgbewtrfxkkqsejrylhjse4mr4eizcaipxiyl2vs4f4rhz3ium@dzsp52dzoy5r>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <mgbewtrfxkkqsejrylhjse4mr4eizcaipxiyl2vs4f4rhz3ium@dzsp52dzoy5r>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c28d8cb-61a0-4440-c34c-08ddad156312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8UEwhLxKiug9t15RtMvt/jLj6RmlxhII6bwKuJ1iY2MvBh6q3B8J76vyBnoE?=
 =?us-ascii?Q?f2/VNdaeVGyYbImD8EWLc47Rg7viRVq0gxxW2VsHywvpMsVqBPKn40RIU8FT?=
 =?us-ascii?Q?PJVNUT6AeY7rggrZYTnmWUyY+ALq4UqK1ApecsaTdIOMn92gNi5RJPViKoaL?=
 =?us-ascii?Q?pjv5C4Sz3SVdm5tKyxJRZTymilqHDTa1uEkFjDH82Z5iczyi3CK2ROsGaGox?=
 =?us-ascii?Q?n0GkjHkeMgHOi5ECheGpekt8y4p7okkyliBzNQ/0ANvZk3lg80sGQ9ZxelXK?=
 =?us-ascii?Q?7fKlxp0WSmk/VGGjsNpQ/i8afbkf7w0SQhl6R+PYDApFUgjKVKF3rmgWzEmy?=
 =?us-ascii?Q?bK1vOVyJpg8AdCdsxHHLZE2DsImnv+5DV16wDvhJiNo2AtL2cblODO98QnBF?=
 =?us-ascii?Q?dlK6Zh8Uyha49aFUM8rnM0GERHP1Y/q/STWZqzM1kqgC5Hf7/rijkYWBxmR2?=
 =?us-ascii?Q?xj13uyWg/NisT3JuLpx6S1WJZmSt1hNdnsf6ghIuS7cucC1IWmEb4UmqjiT+?=
 =?us-ascii?Q?D9CLgejDdzz5nudecVakW4WNlrfmfEJUTsIZh5k7YizsKBYQLzGI55BcBUQz?=
 =?us-ascii?Q?aYvZpKKzl/P0rbMjTfLS+HLlWcrfH0ubX3M9l+0zMgsP5athdYHIoLjMQ+jE?=
 =?us-ascii?Q?fncZRf8Jzg7WQtyR8VIHxtI5ZuhBHUgjGJ/fqoBBRuUu7tJUEBi0VZXASYjp?=
 =?us-ascii?Q?OKgm8OPM/MsklcZ5qTWIVkBvdO8nvAhFreTtCdXfd4uzAE3PFryqXvWx5J/u?=
 =?us-ascii?Q?+wRGk9hgEqk7o9wRZCZz7BoS0cYzl4qVZ83U66mAgRiu7gysAwpkf9BhzzgE?=
 =?us-ascii?Q?Jb8NfTlEKryvqW8O7UwCPqCF2BjErVRUGaOhkd39LWy0lSYVyK1eBAOKKiTF?=
 =?us-ascii?Q?X4Pkd3aDF4n1O/SqOFn21+e032Ly+XosXeSAicVvlhwiY1ZRfpZLSJRhpHEe?=
 =?us-ascii?Q?L5zadZQt2r4p9PpsaRzwthYHA5+QhRlL2SwiCRvV297y9AHWQQOHCJreHwSL?=
 =?us-ascii?Q?03gEQDYU3Cun3x2NEKt6yrqzO8RjPdIwpsAjKJEBEpk8Qt/Ld+k76UE+WAJb?=
 =?us-ascii?Q?jKgQ0PouRL6GWUD+a8L9muX+DplNUHxGHTuI5BdmPSGrxSYeW7p4Lu1pcuT2?=
 =?us-ascii?Q?FsQnlcmwBqvDVTCqlzxaUmWEILS00JmbkYYVXGbzIlk4+qFjStj7sHtxmGew?=
 =?us-ascii?Q?1FWc03k6RREPjylmzDEYsv9A8wmkGTSwHhLJrOF5STvtEbQpvKiLEufkcTI3?=
 =?us-ascii?Q?rCGKwHr8N87xy6UxkYbzWse2Eb0BEaMZKdkWGFKKn4D9BDOFcs8dp6++5ItP?=
 =?us-ascii?Q?/hDDvECTaZL3gPFwXVwZqBezwR6TL0rYOAMn+u/g541d2rM9gbDG71uGbL1h?=
 =?us-ascii?Q?tIlCW+cXQ4Lu/UNuYfGdkPq7ZvZa+l9lSWLTi2UufdyT0oS9k81AGISmxJEo?=
 =?us-ascii?Q?iWRmS93mRro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vIHBTpnJ/fr/jaYposyLd6X1rnoa6C8U3/eNSrVd6Ngu0970VzonpWbDuOsc?=
 =?us-ascii?Q?yUJYuxuaHt6FerEPtERFWVu6/YzP8VFcrA+CkelCYBKUlv4u2ad0k9U3AxyL?=
 =?us-ascii?Q?5gjoUvW2+5i5vwxBREcX3k7oj0mtQvopLKHqdK3M5RN2G+s4As5QfLluafiU?=
 =?us-ascii?Q?yJNVQpk260s84ZKZHiCzppGNmCApJlWKKaLG3XuJNVU8qNmDuiVqN3XfAJQg?=
 =?us-ascii?Q?aVRcWghwj1Frp73cXuOLvrwN3bB3kjUW3K0VUOHVgsWFK2lpVPq/8wMZeGPC?=
 =?us-ascii?Q?khz5tC7XzVCCAHXLccfdABTvfpjNd4t6Qn1bwvZU4ecDMSAiLUAaS8V56yq8?=
 =?us-ascii?Q?05oOfx/aNFhxlnsHtdyxEYeHdEjYVeRw9eOXTX6KotboXZaWP3a9ky5CzQwP?=
 =?us-ascii?Q?1o3t9FNFPBy0CAdVFIGk5AObaBNF9VrN6vJ7uyimZBBBC8YMy9f0XGVHvL6C?=
 =?us-ascii?Q?MaK/SyfA8VwozTpsOqgTe+8x9Xi4Ik0doLBzI9pT/N/sSlSgR6whPhkkuyLS?=
 =?us-ascii?Q?40fXO8Q3NgsHNBjSZsIIaVw5H9xyRSgftLD1rYVn0aowC0XnjyF8NqA+83Vu?=
 =?us-ascii?Q?VkUw2Ixk+p7AOB8Ib+VemK0H9xKocrs0uDWh7KMcWpQR9JWE8tqjReNTEji9?=
 =?us-ascii?Q?fj66TQZKuFG0J4vypqQ74nCDyHaA0ukwf/Bjf5TJxQ6LnMw5SuM2hJkUz+3i?=
 =?us-ascii?Q?nE+P4mwrbOBlIrxVI78CIXnoAJ0hQSUOqEixLqjtJt1E284vtfL+Ui1OUMDz?=
 =?us-ascii?Q?4b3XTFVyzK1xpLSeIhQRxoC/B/mCI11Tg/xO/xMcRcSWm99Gx4m1BUG1RLR8?=
 =?us-ascii?Q?Ha7P5C8TpJlP/sv38LKp5eGjjquA1dwcpKJFxQ+I6NAhUb7P6sLd7yBEpxAd?=
 =?us-ascii?Q?AiY0lpbBM3QBTCcNdxsLNLzQCrCJuykKQrDBA7NkSGKA+iChsZ5NPD8qI8Nr?=
 =?us-ascii?Q?UOUeFgm3G4okUMxz5ifv+XOKTGbZ1S+OZVSD6nPCkjkqL530dqZHUuvIGHU2?=
 =?us-ascii?Q?Lj2kW6Lsdopd1ZjAA+WtoK9mVqEJ1WmnyognUFdFsyhAYLRSxjItwEk77Jy5?=
 =?us-ascii?Q?T930VezIfl2MAN6Oaq/909dQPiMk6A33KDeWBeyXJiA6jt1MhylorsCPMHyJ?=
 =?us-ascii?Q?lDur9+K/0H/cEl+ZaZfcecXSbvR/3FrW/1AI0LS4RzH2hiIesScf6Eps9t1H?=
 =?us-ascii?Q?1KPbEslxD6d3vXFOnVQU1eV2M5fQQAi85riKyE2tiSqtWWqWlhpuzNxUdiQu?=
 =?us-ascii?Q?2imeG8duD5n9KacV2hNVPvUVnHnTbtf3x5qUf7fH8y2NpYD6A89MB4WdmicA?=
 =?us-ascii?Q?Pr2mvSwnkzrrZ1xKplhRSUtRSglCTsuQxxrjvy4IzJuks+c214PMw19TWcww?=
 =?us-ascii?Q?FaWP7ZNUyy+kq0pCL2fZGwoS/THi2Sv4b8iCqV9RfWi16cd+pkcXfdpIlx6n?=
 =?us-ascii?Q?glKnrbtOqZwnhjBVm9gpK5MB2PLaPiqEqHAUBES+8KOHW1im6w3A+50Jn9Vp?=
 =?us-ascii?Q?UviIjxXOerQ7DOSQqsCxnEIBzM+gvsdS2UdvN+vZDMEzAtkpcQcfy1pS97QV?=
 =?us-ascii?Q?mVMg6v/U6f20gl4CuIY5L6pMJw3RLNKUSzImzDRe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c28d8cb-61a0-4440-c34c-08ddad156312
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:35:52.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDPDqRNm6HMoupr+BB53zRRwmd38UQXawwwiyhBhp+nnfRcoVjVftaMhBsUSwpLMCMMXaI69+aizC5q2vz9urA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
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

On Mon, Jun 16, 2025 at 10:38:34AM -0500, Lucas De Marchi wrote:
> On Mon, Jun 16, 2025 at 10:37:49AM -0400, Rodrigo Vivi wrote:
> > On Sun, Jun 15, 2025 at 11:17:36PM -0700, Lucas De Marchi wrote:
> > > From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > 
> > > Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
> > > GT actual frequency is limited to that value before performing the
> > > cache flush.
> > > 
> > > v2: Use generic names, ensure user set max frequency requests wait
> > > for flush to complete (Rodrigo)
> > > v3:
> > >  - User requests wait via wait_var_event_timeout (Lucas)
> > >  - Close races on flush + user requests (Lucas)
> > >  - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
> > >    rather than root gt (Lucas)
> > > 
> > > Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
> > > Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c       |  13 +++-
> > >  drivers/gpu/drm/xe/xe_guc_pc.c       | 125 +++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
> > >  drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
> > >  4 files changed, 139 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 7e87344943cdf..6ff373ad0a965 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -40,6 +40,7 @@
> > >  #include "xe_gt_printk.h"
> > >  #include "xe_gt_sriov_vf.h"
> > >  #include "xe_guc.h"
> > > +#include "xe_guc_pc.h"
> > >  #include "xe_hw_engine_group.h"
> > >  #include "xe_hwmon.h"
> > >  #include "xe_irq.h"
> > > @@ -1001,16 +1002,19 @@ void xe_device_wmb(struct xe_device *xe)
> > >   */
> > >  void xe_device_td_flush(struct xe_device *xe)
> > >  {
> > > -	struct xe_gt *gt;
> > > +	struct xe_gt *gt, *root_gt;
> > >  	unsigned int fw_ref;
> > >  	u8 id;
> > > 
> > >  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> > >  		return;
> > > 
> > > -	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
> > > +	root_gt = xe_root_mmio_gt(xe);
> > > +	xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
> > > +
> > > +	if (XE_WA(root_gt, 16023588340)) {
> > >  		xe_device_l2_flush(xe);
> > > -		return;
> > > +		goto done;
> > >  	}
> > > 
> > >  	for_each_gt(gt, xe, id) {
> > > @@ -1035,6 +1039,9 @@ void xe_device_td_flush(struct xe_device *xe)
> > > 
> > >  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > >  	}
> > > +
> > > +done:
> > > +	xe_guc_pc_remove_flush_freq_limit(&root_gt->uc.guc.pc);
> > >  }
> > > 
> > >  void xe_device_l2_flush(struct xe_device *xe)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > index d449eb0e3e8af..eab932655b2fb 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -7,7 +7,9 @@
> > > 
> > >  #include <linux/cleanup.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/jiffies.h>
> > >  #include <linux/ktime.h>
> > > +#include <linux/wait_bit.h>
> > > 
> > >  #include <drm/drm_managed.h>
> > >  #include <drm/drm_print.h>
> > > @@ -53,9 +55,11 @@
> > >  #define LNL_MERT_FREQ_CAP	800
> > >  #define BMG_MERT_FREQ_CAP	2133
> > >  #define BMG_MIN_FREQ		1200
> > > +#define BMG_MERT_FLUSH_FREQ_CAP	2600
> > > 
> > >  #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
> > >  #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
> > > +#define SLPC_ACT_FREQ_TIMEOUT_MS 100
> > > 
> > >  /**
> > >   * DOC: GuC Power Conservation (PC)
> > > @@ -143,6 +147,36 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
> > >  	return -ETIMEDOUT;
> > >  }
> > > 
> > > +static int wait_for_flush_complete(struct xe_guc_pc *pc)
> > > +{
> > > +	const unsigned long timeout = msecs_to_jiffies(30);
> > > +
> > > +	if (!wait_var_event_timeout(&pc->flush_freq_limit,
> > > +				    !atomic_read(&pc->flush_freq_limit),
> > > +				    timeout))
> > > +		return -ETIMEDOUT;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
> > 
> > for a moment, the name of this function got me confused. I thought
> > it was going to wait for the *exact* act freq, and then it would be
> > risky because we can never know what PCODE will decide on extra
> > throttles.
> > 
> > But I don't have a suggestion for a better naming and reading the
> > rest of the code showed it is doing things correctly.
> > 
> > There's a risk though... if for some reason PCODE decides to keep
> > freq high for a longer time... but likely unreal for this platform.
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> thanks... I will take a look in CI later today and think if we have
> another better name or error handling.
> 
> While we are here, a couple improvements I noticed while doing the
> changes; see below.
> 
> > 
> > > +{
> > > +	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
> > > +	int slept, wait = 10;
> > > +
> > > +	for (slept = 0; slept < timeout_us;) {
> > > +		if (xe_guc_pc_get_act_freq(pc) <= freq)
> > > +			return 0;
> > > +
> > > +		usleep_range(wait, wait << 1);
> > > +		slept += wait;
> > > +		wait <<= 1;
> > > +		if (slept + wait > timeout_us)
> > > +			wait = timeout_us - slept;
> > > +	}
> 
> 1) wait functions
> 
> except from the call xe_guc_pc_get_act_freq(), this is a copy and paste
> from the other wait function in this same file.
> wait_for_flush_complete() was also a copy and paste and I moved it to
> wait_var_event_timeout(), which is a better synchronization than what
> this is doing.
> 
> All these functions to wait until a timeout are wrong: usleep_range()
> will sleep for anything between the 2 values and we are simply using the
> wait variable to decide on next sleep value. Worst case scenario, even
> if unlikely, we will wait for log2(timeout_us) * timeout_us.
> 
> The xe_mmio_wait* get the wait checks right. I think we need another
> function for the proper abstraction for that. Previously we decided
> against because:
> 
> 	a) this is the poorest synchronization method and it tends to be
> 	abused (see the preivous version of wait_for_flush_complete())
> 	b) adding such a thing in xe_helpers.h/xe_utils.h opens the
> 	door for things for doing other things there that should rather
> 	be using proper kernel infra
> 	c) previous attempts added that in xe_mmio or a new xe_utils.h
> 	and neither of them are good locations.
> 
> Proposal: xe_wait_for_cond() in xe_device.c. We should document when
> it could be valid to use it: it's not a synchronization between 2
> CPU threads but rather between GPU-FW-CPU; it doesn't fit the
> xe_mmio_wait* because it needs to do things other than read and check
> mmio value; and there's no other core kernel synchronization that can be
> used. Then we migrate wait_for_act_freq_limit() and wait_for_pc_state()
> to use it.

ack on this. But it could be a follow up right?!

> 
> 2) interaction with user requests
> 
> I kept the logic implemented on earlier versions, just changing how we
> are waiting on it to complete. However, should userspace really wait?
> Why not just update the stashed value that will be later flushed?
> This way, if there are multitple requests they don't all keep waiting
> and applying a random value depending on what thread was woken up first.
> For example, with thread number also meaning the execution order:
> 
> freq_limit == xe_guc_pc_apply_flush_freq_limit()
> set_max == xe_guc_pc_set_max_freq()
> 
> T0				t1	t2	t3	t4
> 
> xe_device_td_flush() {
> 
> 	freq_limit
> 				set_max
> 					set_max
> 						set_max
> 							set_max
> 	freq_flush
> 
> Here all of t1, t2, t3, t4 are waiting on freq_flush from t0. The end
> value will be whatever ordee threads are woken up later. I think that if
> we change the implementation to simply set the stashed value, it will be
> simpler (no need for wait) and better: the value is ultimately set in
> freq_flush() and is always the last value.

We could try, but I'm afraid that this will break our IGT test cases
badly. Because when we read back what we just requested, we want to
see the value applied.

Or we will open the can of warms of the soft_freq design that i915
has and all the confusions it brings...

> 
> 
> thoughts?
> Lucas De Marchi
> 
> > > +
> > > +	return -ETIMEDOUT;
> > > +}
> > >  static int pc_action_reset(struct xe_guc_pc *pc)
> > >  {
> > >  	struct xe_guc_ct *ct = pc_to_ct(pc);
> > > @@ -689,6 +723,11 @@ static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
> > >   */
> > >  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
> > >  {
> > > +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> > > +		if (wait_for_flush_complete(pc) != 0)
> > > +			return -EAGAIN;
> > > +	}
> > > +
> > >  	guard(mutex)(&pc->freq_lock);
> > > 
> > >  	return xe_guc_pc_set_max_freq_locked(pc, freq);
> > > @@ -889,6 +928,92 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
> > >  	return ret;
> > >  }
> > > 
> > > +static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
> > > +{
> > > +	struct xe_gt *gt = pc_to_gt(pc);
> > > +
> > > +	return  XE_WA(gt, 22019338487) &&
> > > +		pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP;
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
> > > + * @pc: the xe_guc_pc object
> > > + *
> > > + * As per the WA, reduce max GT frequency during L2 cache flush
> > > + */
> > > +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
> > > +{
> > > +	struct xe_gt *gt = pc_to_gt(pc);
> > > +	u32 max_freq;
> > > +	int ret;
> > > +
> > > +	if (!needs_flush_freq_limit(pc))
> > > +		return;
> > > +
> > > +	guard(mutex)(&pc->freq_lock);
> > > +
> > > +	ret = xe_guc_pc_get_max_freq_locked(pc, &max_freq);
> > > +	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
> > > +		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
> > > +		if (ret) {
> > > +			xe_gt_err_once(gt, "Failed to cap max freq on flush to %u, %pe\n",
> > > +				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> > > +			return;
> > > +		}
> > > +
> > > +		atomic_set(&pc->flush_freq_limit, 1);
> > > +
> > > +		/*
> > > +		 * If user has previously changed max freq, stash that value to
> > > +		 * restore later, otherwise use the current max. New user
> > > +		 * requests wait on flush.
> > > +		 */
> > > +		if (pc->user_requested_max != 0)
> > > +			pc->stashed_max_freq = pc->user_requested_max;
> > > +		else
> > > +			pc->stashed_max_freq = max_freq;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Wait for actual freq to go below the flush cap: even if the previous
> > > +	 * max was below cap, the current one might still be above it
> > > +	 */
> > > +	ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
> > > +	if (ret)
> > > +		xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
> > > +			       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
> > > + * @pc: the xe_guc_pc object
> > > + *
> > > + * Retrieve the previous GT max frequency value.
> > > + */
> > > +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
> > > +{
> > > +	struct xe_gt *gt = pc_to_gt(pc);
> > > +	int ret = 0;
> > > +
> > > +	if (!needs_flush_freq_limit(pc))
> > > +		return;
> > > +
> > > +	if (!atomic_read(&pc->flush_freq_limit))
> > > +		return;
> > > +
> > > +	mutex_lock(&pc->freq_lock);
> > > +
> > > +	ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
> > > +	if (ret)
> > > +		xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
> > > +			       pc->stashed_max_freq, ret);
> > > +
> > > +	atomic_set(&pc->flush_freq_limit, 0);
> > > +	mutex_unlock(&pc->freq_lock);
> > > +	wake_up_var(&pc->flush_freq_limit);
> > > +}
> > > +
> > >  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> > >  {
> > >  	int ret;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> > > index 0a2664d5c8114..52ecdd5ddbff2 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> > > @@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> > >  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> > >  int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
> > >  void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
> > > +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
> > > +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
> > > 
> > >  #endif /* _XE_GUC_PC_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> > > index 2978ac9a249b5..c02053948a579 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> > > @@ -15,6 +15,8 @@
> > >  struct xe_guc_pc {
> > >  	/** @bo: GGTT buffer object that is shared with GuC PC */
> > >  	struct xe_bo *bo;
> > > +	/** @flush_freq_limit: 1 when max freq changes are limited by driver */
> > > +	atomic_t flush_freq_limit;
> > >  	/** @rp0_freq: HW RP0 frequency - The Maximum one */
> > >  	u32 rp0_freq;
> > >  	/** @rpa_freq: HW RPa frequency - The Achievable one */
> > > 
> > > --
> > > 2.49.0
> > > 
