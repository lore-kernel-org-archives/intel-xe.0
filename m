Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D28C54ED0
	for <intel-xe@archiver.kernel.org>; Sun, 25 May 2025 03:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0088310E03A;
	Sun, 25 May 2025 03:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fnr6TziO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720B010E03A
 for <intel-xe@lists.freedesktop.org>; Sun, 25 May 2025 03:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748143835; x=1779679835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=twYvTAUL3NkY5Y7HQTvJFRNX+7t0I3+dJUJ9nEoIoMk=;
 b=Fnr6TziO8CVF8cXlqMUih7dYz2lheGbNAl4qEJaiBOiNwwp/8vgAWE4H
 5Uh8YTwusYDmx/rwY6yVKMX8cyXKnucVTtediXdUqxQtN97em75JE4kEd
 mVlIPDPlFFRORS0gdpfDtbmh/dTayawlXo67UztjRPHqSX4tlTLSW0zBu
 FFn6xjIucAY4jpUAdHJeMuVW3LyKYI4pvvpfpUiWgZJHTNq/DOGXgH7gq
 XzjBCLTBsMch3hYW5w82X+9SQLK0r7thncZXkBTlvlwzDOiRVGHGb5tSK
 DuwzesiMkAY8FhKh/JB7PsqnCOJG3cIqDpfXXPCbpeOV/LrVKCYRYrUjx g==;
X-CSE-ConnectionGUID: y3oPMdTfRam1txJIzW1EKg==
X-CSE-MsgGUID: M3RQaIRZRC2LUKskcMrkYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="52775601"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; d="scan'208";a="52775601"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 20:30:34 -0700
X-CSE-ConnectionGUID: ZUYh7TCIROadCYcdnwdXGA==
X-CSE-MsgGUID: 13flJgngSQiSP7SUMaS0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; d="scan'208";a="146989899"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 20:30:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 24 May 2025 20:30:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 24 May 2025 20:30:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.41)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sat, 24 May 2025 20:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy6cJ9IHrZcI0DYP3JT4OjMq6ol80ehjABN1xjONmhVz2K++y38r1cvEdgaMFE1qKo5L2dFeE1cDRAAuH5FWh4UA9Ccq64W3/88cbFzM6wg68nfchwl19FLRy0Vh5FyjVza1ERsNES+UsTBpZRPYejEd6LgLJ9bkruOV6OLeMaSiac4ToXow/XY0+ymqyxuKbM7aHu5Ngj5h3VzcFlAtzriArT+6wgsbyCEGdws7UJSe5v2IpBEGNdArjLpnMFin4Uj5Xb4E0PrFRuKlaC2D9YtZA2XDgWYdATmpclRxUIdwKhJjHny4ZVd/jauz5jPnIHm14I7Y0pI9D3pL+B/cPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UJlknOy5VL5J7W2pnY55Ca/nkg2owUTAkuNsFBkbnw=;
 b=osZNKMxdGlptpjEqsbUy71vPvmluVsUdebvokgf9cD6gAojpFpQScbEyKnd1wZnCoeybtJPCl28JbKUUbgQYdfHO/a203voXLwMN7uJqgOMvK5aPstiXwORTFtspHkRH9SywuHyKjqZ6BnryyKX/aTD9coG8/DjjqDCas+efhfkNRoYJ0pMyi2g/yTLmDN/Uh1DCIn8UJ9Jt+fxtiSmrGXlvMoWuhqBX3Vr0XX2TNNZCymkcpe0bPTKY/DIllAPWK4pAHPaGKPjfh4zIpCSH04dyurpKqTtYurfRIImvFdQZj3z6kPMiSoNvzbhvcpdrwLFSrZjZkEDUdMV+HV2ztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Sun, 25 May
 2025 03:30:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.022; Sun, 25 May 2025
 03:30:32 +0000
Date: Sat, 24 May 2025 22:30:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>
Subject: Re: [PATCH 2/5] drm/xe/lrc: Extract post context restore function
Message-ID: <apyca5tnlidgtkk2dgeyxxkw6n3vdhxnoewy36vntvrenheuec@obtgblltrfyf>
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
 <20250523-wa-bb-cmds-v1-2-40b337f71bcd@intel.com>
 <aDDNOq2ygKL6a5es@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aDDNOq2ygKL6a5es@unerlige-desk.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ddc05e-acd3-4767-18c5-08dd9b3c80e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jv4sZKEIJXUi4uDe/SvpI8OwpprmxzO2dBOYYh0ue75gakIUVU0cO9giqNL/?=
 =?us-ascii?Q?JsPXihxdqUXYCINeAWpmmKodugVowe7dMgw3Kxq/+KxTScVgaXa6+NvIUhCC?=
 =?us-ascii?Q?fWjk/KqOTb4Ljx1Dytil1JUkXeGoKnoqdHSYwQENPy5u1tqtcFdRBMTeIFjZ?=
 =?us-ascii?Q?ru2wS79UvRkzV+PdCE9JoAyr0WCBaHS3IDh8HCHTF1ZhgyCS5LtA8QwH9p/K?=
 =?us-ascii?Q?0Py2CCadHtDhJ5QpWVVZleSgL3bsEENwvkP/9g2H8buPvBh5oI9QVFoGmXuo?=
 =?us-ascii?Q?MCJruju9lxGRTj6dhmnweZ+Sht2ecoqZpWz3sJHHaGZ1D4gxLxKn13Hyr+D1?=
 =?us-ascii?Q?hBpJgvm+rHlvCJzo/9wKLhiawalPcp0ANgN+tAd3Bd7StNoIzeFjU73+uDlt?=
 =?us-ascii?Q?UsxjM6CtZyiQRpLKbCUomeJAJBPHMIJ2aL3xWhGQHedvMOKK28ZJ/oupwnX2?=
 =?us-ascii?Q?vCpTbC6tMnXlabLmNOJxozaY6DQaON6WfzhAKBDqkfXlnWMOUdurE1hfqupb?=
 =?us-ascii?Q?zh2JMchdiRF7ccpKCRvlFk9fuOo5m1XG8YnFp9XwyCF+f7SNOdFgKtViHf1C?=
 =?us-ascii?Q?p5w1R9575BsuUKYPEjYP5XmbEU68+GWRCDvjTmuy4+wowP9aTX5hiWD/kwH1?=
 =?us-ascii?Q?OldGMC7eDTa5wQmfLOjSzZ2rsJ7p0LLrFFX+JjwkaLhlxSN5lziUv4luOwgl?=
 =?us-ascii?Q?TZAwV1XWLzqXohvNXvHxQjM2bTvVJh0SmA87SvDoVdWrDgpsOAbbWpP8mS9+?=
 =?us-ascii?Q?hCAzrSMgMciH2ypWNkfiwqnAltZhgtyoUR8IGzbZNFhqKHt0s4ZVfaeastZ0?=
 =?us-ascii?Q?LtAht5pa/AI++s2w1LEXtjfoxePNK7//Q5xjlOzWyk7b6RBl7inHiBgSki/r?=
 =?us-ascii?Q?f4tUOsKmuNHsetBf9+3QEGgxsiRLxH5CNznJal1W5ZdNEYhwYOvOE3vuMJa6?=
 =?us-ascii?Q?dxQjfiGYx98bCPiq3rZqeanNOKHBTWu0jD/6wpPf2S9RcBcxbAwHi247Mu8Q?=
 =?us-ascii?Q?bwxaqI+EqqRDVAU+VyiTjG094XTI0MhDq8DzEXMr+NeEt31+7k5vKo8uS4ny?=
 =?us-ascii?Q?+SPrnzR44tixbjJIM+UoLP6goEKtyz8NjUvwy14EVID5OUEB7qAtCQBEdYUo?=
 =?us-ascii?Q?RwTAbD0NomJu8FDr/3Kw4I3Bzr/xQbId2SGjREFVMcZZmFU2zDVv9TCa99yq?=
 =?us-ascii?Q?86oFEgi/9brdeVN2S220e7fThAkh9n+W7wAAR4NCy6TUOnEiBHyKMRTpxM7c?=
 =?us-ascii?Q?C+nRxH4UZeO2oJEI9YFjqS3B99cZSDhbi6kxRla+rTQQgKLjCPVTdoJVCmFe?=
 =?us-ascii?Q?dv0cSsP92EShC9/PGV51oNnByhECzM6odpQ2DKOi+QOpC6X0ZBNI2M+No8Y9?=
 =?us-ascii?Q?trkz1Rx6Km151zXz1eN3YPKOufXmWBJG5QsVzw6mbYiHWBxT/qwT21+edwOp?=
 =?us-ascii?Q?8u3uaamLq296gMomaZdOFM90NUw76ilpT8okAbbkanpKVM0GSRC5Pw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uVVSyGbTl4xFfyVwPfpX7fxWGb5pIb4O0winBdxyZgMOTWvkKH3rg5uLEC3x?=
 =?us-ascii?Q?IKWU5VR1JXTQDil8kvXILWiu8Gj5pSdol3RmSXtRX6di1k0bTaRSsvCIEKEb?=
 =?us-ascii?Q?BpjY6fi7CHyfDmqun6YuGeghFqmSvCiEUYK4vQB2ce0qBEey065ji8egZEYN?=
 =?us-ascii?Q?K3CWbwi+h2ooebgsQQf8Dp79JddI/MuCd94XgtnSiIpPWwPKmt2e8hROfSLL?=
 =?us-ascii?Q?6tF7DzsjMMCqAQsDAp1GR+Ob+0HObh7sP8+x1tM/RGej/azCTDl0r7lXbV23?=
 =?us-ascii?Q?mxIO3emFXmD+QN2TU6l2hRq/CSfjNpN0xoUDJvcmtz9y23H6kCcS5lTCDPqz?=
 =?us-ascii?Q?KX7lz4rqbrhTrcgrBNmjygAPPWdZ/RiEta/td+ZkRgwT2jm3BdhKoZD35BIM?=
 =?us-ascii?Q?CwO3Szlpruo7b/6BfmEUHDZVZlR+9TSaTJOgZpXi4ow9clPLWza0zulRzSnp?=
 =?us-ascii?Q?8YRXV/LrLcd5V8JsJXmyOBPyI7eVmtcXXQK1QobgpWBcUStsSgqkHxtERDB4?=
 =?us-ascii?Q?+XzHp358/fuo1ANfLNvSvHXKcOH9CrIyJ9+CiHvjTfdEzmcIecJ+M3tWJaRL?=
 =?us-ascii?Q?3MFLX5i6P8XbisNYQF6WVhRf4NoJDwCQ5KIizbFQhdEUBT/WeojkoowevDI/?=
 =?us-ascii?Q?NEugFBQ2nvWqkLbBL0eD+D81CuJ2X+kyoDQ5yIiX3jEJ95/7YRqLJGjozEdZ?=
 =?us-ascii?Q?+QFv9CrKNP0wwkuINtwd171/80pabtOdWlL/pYa7DW+Ytsvx6VjGxV3KKE9h?=
 =?us-ascii?Q?GPdAsudDwOFZVuMZzVrXsR/LxVTGSuPPyu2JNOq70p2n2FNNnAp5q8LI6/A1?=
 =?us-ascii?Q?v1dERhu/6X66w3PSzB/qTLKhnP33tkNzt63lYZY7ibtN4faTHv2VshhoHd4W?=
 =?us-ascii?Q?F60PEtwkYO9IMcXpjwQSVS15+TxlCwiEyJLHnb/bvIdpu2HtIwm6kP+3hZxu?=
 =?us-ascii?Q?NpEnHb4PtrSd+zNoU8WSOUEmvobPPDg2GxAnI7rnxOspGKr3gRgu+E8uECFd?=
 =?us-ascii?Q?9eMxNNIHGPvVoAvQzxndlevY437BB1twPjb+fT83iGhO+IaS2lCiRvv50+C6?=
 =?us-ascii?Q?vjj4HZcCU7cAR1OUExYTzZM4ZfXVSkoPowFBTp9BeIvDpMCAuqhgDgpf+Tdl?=
 =?us-ascii?Q?2gv6mGjtzkzQbZGHtdRXGVH/NE0yn/UjSuRdi7uXWI6qz0tORwVB+fhFr+vl?=
 =?us-ascii?Q?jUrNhAtkHQdHzHmoADRf2TpGeDiFeeku1kVpM86hqvojVFJOXTGJVH8DrYpB?=
 =?us-ascii?Q?ht/BAmJKKO1lMY4NaNl1WlJrU5q1jc7Ln3ywBHXIo8JxTqWDvqXbNb5928C+?=
 =?us-ascii?Q?cnPd3kYen7ahjgC+In8qIHQTWQFpQ4C1b0JKG5GX7VQvyb9i35ptMoFVaaAi?=
 =?us-ascii?Q?+sdWfMXSiCIYQcmgUuMHgE5jg/9l5GsrLL+gaY06zyH+MaCYUqf89QOVu5Ex?=
 =?us-ascii?Q?3zJ+71T3Je07AKuY9bboqL6M1NV5uK7uOwbxvYCXvkN3PGjBxx7sUOXgJll6?=
 =?us-ascii?Q?SLUIldln40mek7ULJAk1mFJnTWnOin+EhoC/a3VEd9Dqs3x25VrnTWuLxC8H?=
 =?us-ascii?Q?YPGpBBy47lvwBb35SfTMTuvZ8icEcXe2MEt8wzXYWuA+82NAzjcOeeGv/qLJ?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ddc05e-acd3-4767-18c5-08dd9b3c80e6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2025 03:30:32.0825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4cC4ELD/nJAUcAC+YNm62YRWVHV9v/xAtbMU8XSFa5JfzBRtr4Cb3+5TefagxmGiYUsNgvlpMnpDzUnPYbItYn5gWiDrkqHXihm+qAvc7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
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

On Fri, May 23, 2025 at 12:32:10PM -0700, Umesh Nerlige Ramappa wrote:
>>+static void setup_wa_bb(struct xe_lrc *lrc)
>>+{
>>+	u32 *cmd, *cmd0;
>>+
>>+	cmd0 = lrc->bb_per_ctx_bo->vmap.vaddr;
>>+	cmd = cmd0;
>>+
>>+	cmd += wa_bb_write_utilization_state(lrc, cmd);
>>	*cmd++ = MI_BATCH_BUFFER_END;
>
>Why not just assert right here for cmd - cmd0 instead of putting it 
>into the next patch?

this is purely a code move with no addition/subtraction. However, given
the simplicity of next I can squash it in the next rev.

Lucas De Marchi
