Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85293E7BDB8
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 12:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DE710E35D;
	Mon, 16 Feb 2026 12:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpcTR2na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E438710E35D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771246328; x=1802782328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JQiPJGrQ5clzHfqq1lwcEn5ykbLUez6Lysjp5UOgzzQ=;
 b=BpcTR2naFapPiOPbNubx9O2MkwY0lMYBiDKve+WfC+adsffZS/SVUZIr
 S9PkuCIqEqPQI2wpjKaSytjyoLsVSKNTW90lTDz35o0II5GnhdCm97qNm
 G4c0Wgt8zvyfnLagpzXue0Q5Xb90xJbfbz1mHBKQ7ddFEC9PBq9u1E4sl
 Sx7NvbSswU9y17PM6SHmCTqRAhNVj4ML1kFQerblF2Zk9U1LdJ+2Ekj/X
 VCYSMwjXlcy3Q3UTEzpoE0m78b4XGXkARMh9zmJvVZNL9rFQONOnoebmv
 YRkS6Bo/UV4mD9Nb4KwrNoNCsVI4P0RdI3AX92awMwK5lQdM/MNvtfeMY A==;
X-CSE-ConnectionGUID: RMRPCsuLQJOChoXUqaimIg==
X-CSE-MsgGUID: VlvW8fR+TZ+PmAYHfQWdvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83048885"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83048885"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:52:07 -0800
X-CSE-ConnectionGUID: pK75mKwYRC6sArsqf9eakw==
X-CSE-MsgGUID: DUbI5dYPQHyZ4stQ98ia9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="217601256"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:52:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 04:52:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 04:52:07 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 04:52:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgkJXhO/rKS/dryqvCDf4qHeAuft3Dwfqu2k70lsIkZfdCjZLwEa8woIlg/F4+l5dm8ODm/3Icn3GS1nt74XHLndxrrV1vKYLshsgp/EXvXsQXCHAk+J1BY6gENxSXXBbFL7N3ieBs3tCDfOAnjYxfMoo2rt6oNOd8Qfzov0XIKR8U6xqIgViPhdGeYuoe0bXcjGYal7QpisxNvUoiDXcsn8TGL5Xjgr3Mzfn2GzTo3QIHaV02fEDNDJKnJx/U+JG+/ALbZY8ZXgcxOEjf9Mj0MSI58yS0tiDzCb+whDm0U/+nFqsIpGNLUTKLunEc3NSqWrQ66z/5fSTNyN/nDuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9SoGSI5K5X7tsfbxCwtHa93gVy3yh/zjxWgH7xsxus=;
 b=g4eDHSD3n8KPht/OXl/7j4E1srQv9UhqYtopVNh45Q/vRwfAyDkAblL9cdiA1ryOKxixVZjsxFpmEM/Tk3QLIc9KWfWirOcpSZMAXGLEoTqWojOy8EwkK4koKo+BXq8k073gDlV4GoTlEbBrJ5aUyqHnIexs1XDma1to9c2Q1kulSTTpuQAf/NC1aehDVIX/ixHcvrViokqp3nK3ymiYNe+Sth27hJ3Z12mJ5Se9SLN9KbjIV9XmIgBxiHosxE8D9k9jvhptXrzjbuUOSv2r6OwzMd7RGNPc0m4GAOrfIcz2svY0XO4LlpAP0AIlqFhl8gcAwXB/haL9KU2Tw4uEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 12:52:05 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 12:52:04 +0000
Date: Mon, 16 Feb 2026 13:51:57 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Remove H2G reads in CT send path in
 non-debug builds
Message-ID: <aZMS7Qg5AvFRE_Zb@fdugast-desk>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213211625.3117729-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0319.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 9532e848-ccc2-422e-2ec5-08de6d5a2fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1A0BtRIU+bJxaQ4dnunv9R6JwqSb8TGHUcXfZkgjEyfcxc3uE9XNcEfznV?=
 =?iso-8859-1?Q?uLGjlLYBbmbdH7RsQf7TpWhUTY9gHe51NRRPvTQyvArRYCk9MsPl7y3Gro?=
 =?iso-8859-1?Q?3WDIVjCvlmWEb/5Q0F/JaGunqVMfI5pFwT0+Usy4zfRdGCnuBxqTiTpp5f?=
 =?iso-8859-1?Q?6Pm/WY33CrKDBP3bcTaANXV/mY4DrSo4NTNiNPWkr4UBS3wKLgB0K5YFZX?=
 =?iso-8859-1?Q?D5GrXNPNZnI4Bzg3PlldfCuiiYrmy0JREaSm18dNpaF1+PSG1HELuyrz+x?=
 =?iso-8859-1?Q?Z6FVYtnJFszvkQv2qluxBs4OswIpu0f6eU5ZJzaTlB5gckuxnPI0OpQ0gF?=
 =?iso-8859-1?Q?zuk/5nuwTfmxEWti5e1OFNO3qVF3X4lcR4kM8aPGrUPsoVobvdUVG+T5Nl?=
 =?iso-8859-1?Q?fi5GsJ5j8lD++b5+2o116Z5yyh6Bu2sXC84sl2QzpOqBSPRTWoUV3PTs0T?=
 =?iso-8859-1?Q?VjpFZaPog9gVNo+neuq0agI4dzRnmawoQjWTiAtalbIB5YEiv1bcDwF5Y7?=
 =?iso-8859-1?Q?StGF/prfk+igCaSzwyxlS/nInoCG5mHuC47jrv7ufhsHbb6drnZWCdukQO?=
 =?iso-8859-1?Q?pFa9mbJ7wcw8dV0YUT9MhUi5wNwrXc5shO1IxJ6ge+6IvHam5bpM9BPhaZ?=
 =?iso-8859-1?Q?ptm8uK9IIocYMx4TTlAamUdMK7uHp9uOru9fnZEJKB6IZ5D0ZQE7ftCtQ+?=
 =?iso-8859-1?Q?hHzsDnNO2zIecC0pRmlckyW/G/tTXyzfe71/wfP8hHxEpsPQwgvbNDr6KZ?=
 =?iso-8859-1?Q?nwk48XHSHzJLaErvUSGQzSBznpSkU19Flhc3IGGSxHnucLGYFkfDwfvHdS?=
 =?iso-8859-1?Q?5R7DSMvkEMSidudqO1AxMAdORoTntwCuQvQNIT3zRSan9saS8EGOD2NHiy?=
 =?iso-8859-1?Q?e9GF4/h3rsTJkyxaQarH6+Cp370qcKst3MWmsjTj8dEKw0k6lxZ6yJ7xiz?=
 =?iso-8859-1?Q?2yAGm9ziC189FP8vzo8mWp3sX0lQvqdh914h0BMVXJCpYO7+T/4EAZ/L6r?=
 =?iso-8859-1?Q?7VgTO9SjAjG/jkHAjkp5s8Fb1u7aZAbGe/EJvCPBR7uKYhPULhEdRLxOJ/?=
 =?iso-8859-1?Q?9YDRaaa2sdJLTebSzWLSGH5zW598uLjb/Q41mQinagnkbMKgDjrwr7iRBo?=
 =?iso-8859-1?Q?/uAbtz+CL0CD5eGh/eLc4f6Y+G4sVnPI3ylK3t46rr9eyiU2vwzUcqZcPU?=
 =?iso-8859-1?Q?3EyiAHZdQrvnVlQMjyFJ7wPyt/xuWskZQLWqOTs3qjGiMi1M8Q0yVUjRRT?=
 =?iso-8859-1?Q?E7pRCLot057gwQuE3AYoJCiqqm3uw5ADW4ESYIvKIiuF29CliKFKBvDwUT?=
 =?iso-8859-1?Q?FqbCWoaZfFm6RI+UW3BxWJKItEJVvrfsDbDJM+Prqp9s8Dfbjq6Nm/1k0c?=
 =?iso-8859-1?Q?+bNlqrsSrGK35oXAtYk0pODXJGDhmJKkUCpB1A+g3WX8lqiTnzeaA1enI1?=
 =?iso-8859-1?Q?I9KOPh710WpPCCAIDCMjhWx0Ll6AhdJkgn2aPai0QCaSxm2hH7T4atPHi7?=
 =?iso-8859-1?Q?kXymcO7K0MItNfzsrQHiK2iow7LG1tuQJZcErbZo4Fvf1v2tuM4IWTzQsa?=
 =?iso-8859-1?Q?HCE278LR5aPa4McTeC1Sb0kfC0/dkuZPfwBlGXp5QZP+QmGcrt3CM/Nyk9?=
 =?iso-8859-1?Q?+4oboZeFTz6UQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YdbW10j61rgddJbrPdcmnSCb4xX8ODY1t1pd83yZ+Bxi6SV2mFiWQx1uk2?=
 =?iso-8859-1?Q?QVLuLrdKLq2bW+eJApAg6zDoKv7w0b820/24DnpTguNaDEGY+f5reiBS2n?=
 =?iso-8859-1?Q?ANv4F1jPF+fgfCC//F/hHc77HNd6lEMlPKnoznnOJ1KYGvG1tC3uP7kkHi?=
 =?iso-8859-1?Q?AAMd6Zc3KrsOzTrGteASG4oGrsje6tUdhBGrlRKR0V4GxmkiYJE5pqYeat?=
 =?iso-8859-1?Q?5enDml+fruYIvzU7t9uGZsuWM8QniiPur+1RoIEGbfmUESVcMWOdchk9FM?=
 =?iso-8859-1?Q?TUwLbo1yi832VLIO7q2f5/69lLqyMgS07SPcaNZnOpwpPFAeReclOj6C0m?=
 =?iso-8859-1?Q?1cYtqEqOQ8NAXNIG2ZscHKQK6TsTuG9RdSAKMGhOcNV7NeEGjiIcb/prbz?=
 =?iso-8859-1?Q?kyvetLabrftGtjbci/mf2ty0UJ1Ahdb0egryAqLvuTMAlIo4P0fv3e1hPU?=
 =?iso-8859-1?Q?mVbKgNWZ5aYEiv9xYznH4Qc46M5WOWJLVs43+OMNswtTu2qMilRzTY3dvX?=
 =?iso-8859-1?Q?xP8tUnkqsMt5lpDDINIHbzQ98fIbHQzITu4Q89xQW5puXg8Of/wYXC1eP6?=
 =?iso-8859-1?Q?ScWSgbXoiWKZAif6uSJWutrKmi8GZGgXF07KhEs+MQwDEUM6kISKELEM6/?=
 =?iso-8859-1?Q?sqbZHQffY3MMB+tW6GhJhp1bbL7Mf1Q9HedUl+Sx+PqEEexjvqNhGtUXGO?=
 =?iso-8859-1?Q?ThCWTyC11ksj+25zbFUOD0f52cTy6URHwHjbBDdGM3IZ86x7eCHmz3FxIq?=
 =?iso-8859-1?Q?gXDtBiW0oOi7GJgzRtv12+WluwvEwUcqMP1jqCZI9frnNPSlPTw9H9vWUy?=
 =?iso-8859-1?Q?iEsOlgUJJFQyr9zac52q9sjCmXSoH52vDU7t/TCddMcVMzM6/DJbr/+MaB?=
 =?iso-8859-1?Q?+9IvrjGibsjrEHNSgHwLLVEW1lkdYI1S2F57/By1dFxWfo1tO7qcZWGmmh?=
 =?iso-8859-1?Q?mezlpmtwxir2jqijWBfkQ18ytAeMXEhvqHyDYEaw5askQpoY2Le3lhpptV?=
 =?iso-8859-1?Q?XK3Kx6x3zbu0FvOHE5KCR6oPqFNm+8Y3soAGXOCVExeLF6W1Gli++0BTQM?=
 =?iso-8859-1?Q?Pf/rMI1XIzpfr6v1eiOuPI56bi5Hw6Gzv1SFj09DjwDk5DKxoglvkB/Trs?=
 =?iso-8859-1?Q?70vUhXwRE64a6+l2s70UgICLsMUbQQANo4EKKjA2HWV2DV6BC1sDcmEZvk?=
 =?iso-8859-1?Q?Ov+uF7KrHfJIYK5xdP30Nx/+aPf1SrOUTjwbaDbUp/bqItF+9RroneDst5?=
 =?iso-8859-1?Q?NIC0XviBl0HyyeqsV0g0vWfXq3TeYQWGzSwhfYo14t1CiFW48SBiSRGTC3?=
 =?iso-8859-1?Q?af4B/486TDHT1b9R6yTHWEJJ/vJST1wn9y2NkJjnqsMBjK3icmhad7yroJ?=
 =?iso-8859-1?Q?Nf0JkeuARYNRsIU2lOYKFMy99BLKarP8xYeWQjloa0HMHEJ9+2VpMEVTR3?=
 =?iso-8859-1?Q?Z7t/vUB82bKTXDjgu9KunvUwfjdFEkBlJc4c6NbUo+yrg3l6yE/toQADUE?=
 =?iso-8859-1?Q?Pd75zoaVdwnYrkZi/sSgvtGylDwxj5obKD8bzlTx27KtX9Y7N5S24lHHpK?=
 =?iso-8859-1?Q?gIMPZj5jxpHNsEJVOb/y5KHDIpwpoKUgRmMk53+GreMRzThjrDQLkGl6SN?=
 =?iso-8859-1?Q?+rHjZLDQjsnNzUOAiona1BhNiNDcFvfj2XSkS6weSYIZKziqdwQlb48H7o?=
 =?iso-8859-1?Q?N4/PH4eLagR+0O6zbGihXjYlLu8lg+UTI4nu3prYFDitkYUPn0+qgcZ9Hs?=
 =?iso-8859-1?Q?FuWNq0i7yp/2QahA4vmWpzLr+IegQjZnb/z7+l4r4Z+xjGSGDXjjAeusd3?=
 =?iso-8859-1?Q?M0+KOeWZpkMTJrauyaTX0vSNRPw0SDQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9532e848-ccc2-422e-2ec5-08de6d5a2fa5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 12:52:04.9045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWi83qYpigYj6msqaOzrlYtccVKOCdGLWMqIxZyxCFCMoWtBWRGQ0PIQsaBn4LnYNIYDeu0FakxCRu1w4q0ZV8vz4d+gSpQgTtEKtmBPsWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
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

mOn Fri, Feb 13, 2026 at 01:16:25PM -0800, Matthew Brost wrote:
> A single VRAM read on BMG can take over 1µs. While small, this is a
> non-trivial amount of time in a hot path. Remove the descriptor H2G read
> (potentially a VRAM access) from non-debug builds, as this
> error-checking code is not needed outside of debug configurations.

About the change itself: I understand the performance benefit and this would
make the code consistent with the 2 other reads.

But the existing block under "if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))" seems wrong
because it is not just about optionally printing some debug statements, in case
of error the function actually returns a different value if CONFIG_DRM_XE_DEBUG
is enabled or not (goto), and this return value is used in __guc_ct_send_locked.

Francois

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 6a96bea40720..f200d3ee9d22 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -939,22 +939,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	u32 full_len;
>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>  							 tail * sizeof(u32));
> -	u32 desc_status;
>  
>  	full_len = len + GUC_CTB_HDR_LEN;
>  
>  	lockdep_assert_held(&ct->lock);
>  	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
>  
> -	desc_status = desc_read(xe, h2g, status);
> -	if (desc_status) {
> -		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> -		goto corrupted;
> -	}
> -
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>  		u32 desc_tail = desc_read(xe, h2g, tail);
>  		u32 desc_head = desc_read(xe, h2g, head);
> +		u32 desc_status;
> +
> +		desc_status = desc_read(xe, h2g, status);
> +		if (desc_status) {
> +			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> +			goto corrupted;
> +		}
>  
>  		if (tail != desc_tail) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> -- 
> 2.34.1
> 
