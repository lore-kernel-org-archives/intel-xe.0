Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D888FC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 03:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A348810E011;
	Wed, 19 Feb 2025 03:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSwIqX4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4510E011
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 03:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739935175; x=1771471175;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WaZz4NcWKok728C5voOUbUAZweLdaLHFCSp3R5jdPN4=;
 b=mSwIqX4giOEigEPjMClbC2HnP0fu99D++vUCLzGIPbdxtv/5O89iyKqn
 fSEfOlvOmVHSZBR5BgoDnsVNPq2KFewwnl+eAgPrxsKWWgWx7o1+K5v6Q
 s/4qPo1wAXNwzVeNyU1DnRy4DcEJOI86K3nyjnPhM4PqopBstVQ7iPFke
 CRdImIghJVpzNEBmE45NAtLVOwiHk8nP3XtUD3QezJFA0dseEM0kWCS2T
 w/hL97UEKMGPbUl44G4SjYk2vN+RFtfm71Pp1R+CJ3HPptYBd/7N+0uLH
 4wBiwxKB67RMWrLJbTpqv86+CwEusprWneUGZku59zDG5GCc8fgx9u2F9 A==;
X-CSE-ConnectionGUID: yLglkhXEQ9+tngqRzI58Iw==
X-CSE-MsgGUID: l6pLrf2zS6aX1Uh6pw8s1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40523529"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40523529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:19:35 -0800
X-CSE-ConnectionGUID: dq5kqgJuQzCDSUR1cC36pQ==
X-CSE-MsgGUID: 7xesZuGWTwGGjeP6bWhmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114438868"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:19:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 19:19:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 19:19:33 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 19:19:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIi3KaG1jtI/w6ybK520dy6Q/BdS5yl37Xjjz6y6iywy6O8Vk3m5Uz2/d1icQ1aUmTzeYKQ0pqH8mhIgAnWu8Y95aFoJuMHLKIVglB3nbaPwDKHSk9kaCu9FH7D1gM8UjRVGq1gauk9f0ccsQcXZPl5YnfW/Izz60OtiQVlSKLLYUm+tCrs21RyFnGu5DN05Klam+PQR0FdIoxrNkc54eDKSaZvJ+c4rd1bK8goXL3FtqRlqtiWr6kdh0sfmRPgAC/r4bvXoCq4hZv8VCBpqybIoSdQm4bFgV2srkCetSzaktcGkTau+CKLT+XKpI1LfYOs8raboNavpCnVCeKd5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAyLi1vWbNdTkzykhrv2BYJ4e/Et/HWpp4HhaE1zESI=;
 b=rSnRiefIb2MWg4G20N37cdcmhFZZzfvaKmDgWPOliMdSqFeYb50OWry0PbghLpUQoodNgOBwAU3XkKFSazSRyusv9dkRhH2PQMDXAJjGEuqpjeNN+WG5HHd5O3fSVicvbU/uIXYM8Cppd9NHWmWvJ1mcnkAaeqGyYgMS9VzkKDqExaMuvdJNem8Rgd6p/S0VB/ZiihI3o7Nn8HN0vQkHGVP10D2UZZaY9ExxNS2jvmwFBuEvcQlzeFmRb+z3UfP5Ga5ObYKLwuNYHp/9amYtIEBVdXIBmwqgm9FmmSOQvf+M+J7gqocBy1q9EhVFlZpfwEn0uMrw8pukLIfTnNzYOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 19 Feb
 2025 03:19:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 03:19:25 +0000
Date: Tue, 18 Feb 2025 19:20:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>,
 <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
Message-ID: <Z7VN+7p5eFfrZcmx@lstrano-desk.jf.intel.com>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
 <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
 <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
 <1cf17877-18ae-4cd0-8be5-9a5abd46c58d@intel.com>
 <Z65T4j6Z81Hxl0so@lstrano-desk.jf.intel.com>
 <e7a999a1-f5be-4fa0-8557-2cf293da385a@intel.com>
 <Z7VNhu4kgfEqTjb5@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7VNhu4kgfEqTjb5@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dca158d-26d4-4837-8d8c-08dd5094363b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ezMZjyd8cx9lXKOBIvOTb9za2aj/GVdIGCUKcBlK0U4UpwWgjvy7C3ACZ3?=
 =?iso-8859-1?Q?Ar3/g2gKuZu6xYFnfBpOktIBaLiB90+5JfZeEHA5kv9lZnmpBKim1hVG1s?=
 =?iso-8859-1?Q?gNxcWHmQXcXQ4z4JgcGDrHSq1axdTYxCueBcd+cGYPUGBeZHQnoAmVZsTb?=
 =?iso-8859-1?Q?LYCQlTodP+tr+0EziUOgoNMpjTxbHjEUXCOZuer+kmIBObfI61MLh9Yy7D?=
 =?iso-8859-1?Q?BfTr702A4wcItzLahiqcXVZ7rIv4oUQUktAV2A7hZlKUUAa8LNtOaZG+Q9?=
 =?iso-8859-1?Q?WEyC+E2tHXWuU/An9v84xUxW151lD8U0gyhIKxcIa9LSB6fdRvmoickPGp?=
 =?iso-8859-1?Q?wN/wbWnavNCIXiVFQbVfvaH1RJaZSSTgOj9qARPluuZ0pt7jFqpdU6q2no?=
 =?iso-8859-1?Q?TpQO7KQ4Ztn4TcLup7oDZCtuFn10Jw1R2u7s0uqGeJ9fzEF9Z+gYEjgWQB?=
 =?iso-8859-1?Q?CRlYQi+HlKwaAPDvlY4PebhjWUrvCWjLvl95Z933tCVoXu8dliH3GBU7b5?=
 =?iso-8859-1?Q?jNACYeTUnuqW4EBOKmU6rjb5FE7v5GL7HGbEAecwK97bSjpHEthjaripVz?=
 =?iso-8859-1?Q?pD3I8J0tB0UI6pzkaCw9X2Bcikp/+10x3bgYjR57xIZJM73xYtnZEGN4cm?=
 =?iso-8859-1?Q?iZrFvcNm+Pf0YR39qYG5zTV4EylCsWDFGTSqRkIAWtdzxsfx+eoNhNd1uP?=
 =?iso-8859-1?Q?+acDq5HwYROxuA35HzV1R/hOttrfzmJC0l7rj+YZEJ+nxbKs6nkc1keXG6?=
 =?iso-8859-1?Q?I7ugOKxTW8ncMbsRgioYkvAdxgTMQDJ3v0WehO2aXnSvskRRt5VloYU8Q/?=
 =?iso-8859-1?Q?MoZXBQl9/szQra961uXUasmwVl07l51ApXQZ6iJzDuJLaO7mhfBsAWdabh?=
 =?iso-8859-1?Q?mzdjqMNW8v2khXsfMYk+LDW4/cJKcR/n1OtRlg0jzThwYkRlF5LCkzANj2?=
 =?iso-8859-1?Q?Pjo6R9KxBdGLr0/XpUVwbI+Uc+3YTpVV+Px5D9wLE03zetcHiIULay1akJ?=
 =?iso-8859-1?Q?7mstF12Z0caShN7qYRcyIjmnA7eGxp/Z9B0NFuWlcF0F9y/eEcug1VJIql?=
 =?iso-8859-1?Q?ULX7hnrR6Awx/JFtdWxWqusGxba58HOSAW4msa+QI2l0u8z9USwQU6pfns?=
 =?iso-8859-1?Q?oKJtp2FelU3eZKEk07TJGaSGQjRD/S2DS9obBW69rcqje1LMYEURIJuTEL?=
 =?iso-8859-1?Q?bLiuSU1EjC1EunMLYmIlnR7UwSTMtDORYSQ2TPdhIVUldpcoMUu4QQuV7H?=
 =?iso-8859-1?Q?6lKYrpO5wGHvJcSJMvtZdtArUUTy/XC+2S2OeqB7ownyQ52+Wp/wwEPVfo?=
 =?iso-8859-1?Q?fT1fx/RTAWQEXW86VI8IfkH3a9UPPcktH2SGNLI5sRisE6wOssng6fAJ57?=
 =?iso-8859-1?Q?ytWoLeANi5Pqb6M12Hn8plG13F9gGzTdEwZaPcsxZcC14LhkVDwPUor7FD?=
 =?iso-8859-1?Q?STvwveEOd22If2gf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NADCIXPlDLWGE+MT62Nt0hl1pH535Kb9XCr1z207xxwB29lbUVWmu+EiBE?=
 =?iso-8859-1?Q?6OdeKVUS7Cn25QUxsffooGeEQRTkR7a4/0nyORfLfll0SYvu8mxjaUId3c?=
 =?iso-8859-1?Q?au3yj3d0L/J49sKzO5jPZLcDzm5V20/NYW9uQgXcTf+ivrbu6Zmt/9rHBn?=
 =?iso-8859-1?Q?DCxDlzldHKvSBITwqsKBu+x2UauoQHvpo1TZsJJK4NI2BVMB9boACmLEJ5?=
 =?iso-8859-1?Q?1eXfbmctAAWJsXfNDuu4mdQCvldFvTwKjP+RI5bdn61lTEDJk6SIshussI?=
 =?iso-8859-1?Q?5b4XDCBhEvZ6xh4v8NnlVE4qvYfou3J2e4eocuGUsXpqwKQQTQNj6VlITu?=
 =?iso-8859-1?Q?SWMvb8BnfFROCGWvgHcIGVt6gdoH70f5nvupuCdVFE3Kq6Yp/KR7dQbPHh?=
 =?iso-8859-1?Q?CYCFEOX1ZVWuOlI0Jc1pOwD7vq9n700b9YY5iUYzx0XauFEn5NzjbizKBo?=
 =?iso-8859-1?Q?xF52ZcSUSIfTXKWbJNA/cUDBB7QI6sQpX7HhMNus+BHk1IoBMxym2/X16v?=
 =?iso-8859-1?Q?oWzbwIa4R4+uUnYcGuoROcpgh/TemEJ7F4VbgdBmpUAAzC9Hdj+Jxx6qHH?=
 =?iso-8859-1?Q?p4b+7sh6JnReIueZe/0vM4K80Ae8b73mQFsL+/9AOytJQMN03GbB8/Fl8A?=
 =?iso-8859-1?Q?eLUF2xEj/W+qH/EMH5rcr4QQAEkUHrJ6WYFlR71GvDQ1YekBtksz4qEh05?=
 =?iso-8859-1?Q?MbeDmx/u5g9S67gHQA/ldpEt8uoVMvxFh/5AYB72cWQx7+Oceo+bVfjcvt?=
 =?iso-8859-1?Q?YSVcOlhGJ+ujcZunJ464H+ijjggMWcCVr0v11b86hRDCBBl/PyHJKmOGjO?=
 =?iso-8859-1?Q?h7Aah5lHvx/igzJ4VwJitJ56sAqDetorTANpj9N8NtfABnuh0P6MtLRLP5?=
 =?iso-8859-1?Q?cuFywMYShE+/lPE4TTbSqS5SY4LZBwd/n8a0uaEfjr8IcgS2wyQEQB0t1T?=
 =?iso-8859-1?Q?L3Hhu1zvfymCvoswGqOxwacLeKp57ce/MwJuTLuMWd6VFtRH8iUxGE/ECU?=
 =?iso-8859-1?Q?kGMunY1HZ1/t+KjhXbb2ON58n3ctCRznsPQtabEAa7Z4SNM8xQHlZt2Sg3?=
 =?iso-8859-1?Q?1BlI7azMqKRMb1U1YL67h+oQoHj6USWa7kGAiWNZoMSYiKkF6kozasLAeF?=
 =?iso-8859-1?Q?fTmMM0kUWlTte1YJxiKcoZAWFXirs4lqHaQi4Vn8KoGkB2WtuCeVcuEENp?=
 =?iso-8859-1?Q?VtYgA5BTfwtFezIbmhMvFir9bOjth6a1+FAq+W9U4gixXa2Wc6Nj3RN/SD?=
 =?iso-8859-1?Q?JXa5KB0KkN5XxKfl1KkKq7OvQyn86GGy4hCQrM/BqyML7pv3lum8YKWKd1?=
 =?iso-8859-1?Q?TaYCEsPEMPtvhgTNLQiwwfIyd8uD/ZsU0H0WqXsNKGj4vCTVuvXuOmyHmK?=
 =?iso-8859-1?Q?ffVP5kSZVA3ycmQ33YQn/EUacQB8XkCDyI+IHd3qyfytdwhwF9HZgXKvcm?=
 =?iso-8859-1?Q?2OrnNZ2e/JPpAl4+G0/6jn4CQpqfYYurwGTmvulVxxkTkUB5aVXD07wX/b?=
 =?iso-8859-1?Q?74FgjLGk0no+1ehz9qeQYCpP0MGUNFppGNgGdi1t3fUYidElF6Yx06ErXE?=
 =?iso-8859-1?Q?7WHCm7DMoi9cIqh9jWruQf229Af37v+j7wouFk6aW9GlFdgFk7qrfjryGN?=
 =?iso-8859-1?Q?4JS6CwsfoD8Cyev0gXsQCFZmJaRkEwSGpdBgscfi2EfejFjn6h9sOlCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dca158d-26d4-4837-8d8c-08dd5094363b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:19:25.3161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 745nYx9VQZFQg0rEt0eJvX7myLvfQea2mN3CXzLFH9XT9AetpRm4/b1eiOUewl0Xc3YijkGYIqo5a1rEA4suHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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

On Tue, Feb 18, 2025 at 07:18:30PM -0800, Matthew Brost wrote:
> On Tue, Feb 18, 2025 at 04:38:34PM -0800, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 2/13/2025 12:19 PM, Matthew Brost wrote:
> > > On Thu, Feb 13, 2025 at 09:23:26AM -0800, Daniele Ceraolo Spurio wrote:
> > > > 
> > > > On 2/12/2025 10:42 PM, Dan Carpenter wrote:
> > > > > On Wed, Feb 12, 2025 at 05:26:55PM -0800, Matthew Brost wrote:
> > > > > > On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
> > > > > > > xe_exec_queue_kill can sleep, so we can't call it from under the lock.
> > > > > > > We can instead move the queues to a separate list and then kill them all
> > > > > > > after we release the lock.
> > > > > > > 
> > > > > > > Since being in the list is used to track whether RPM cleanup is needed,
> > > > > > > we can no longer defer that to queue_destroy, so we perform it
> > > > > > > immediately instead.
> > > > > > > 
> > > > > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > > > Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
> > > > > > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > > Patch LGTM but can this actually happen though? i.e. Can or do we enable
> > > > > > PXP on LR queues?
> > > > > > 
> > > > > This isn't really an answer to your question, but when I reported this
> > > > > bug I didn't notice the if (xe_vm_in_preempt_fence_mode()) check in
> > > > > xe_vm_remove_compute_exec_queue().  So it's possible that this was a
> > > > > false positive?
> > > > We currently don't have a use-case where we need a vm in preempt_fence_mode
> > > > for a queue that uses PXP, but I didn't block the combination because there
> > > > is a chance we might want to use it in the future (compute PXP is supported
> > > > by the HW, even if we don't currently support it in Xe), so a user can still
> > > > set things up that way.
> > > > 
> > > > > > Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
> > > > > > catch this type of bug immediately?
> > > > > There is a might_sleep() in down_write().  If this is a real bug that
> > > > > would have caught it.  The problem is that people don't generally test
> > > > > with CONFIG_DEBUG_ATOMIC_SLEEP so the might_sleep() calls are turned off.
> > > > We do have CONFIG_DEBUG_ATOMIC_SLEEP enabled in CI (and I have it locally
> > > > since I use the CI config), but since PXP + preempt_fence_mode is not an
> > > > expected use-case we don't have any tests that cover that combination, so we
> > > > return early from that xe_vm_remove_compute_exec_queue() and don't hit the
> > > > down_write/might_sleep. I'll see if I can add a test to cover it, as there
> > > > might be other issues I've missed.
> > > > Also, I don't think it'd be right to add a might_sleep at the top of the
> > > > exec_queue_kill() function either, because if a caller is sure that
> > > > xe_vm_in_preempt_fence_mode() is false they should be allowed to
> > > > call exec_queue_kill() from atomic context.
> > > I see what you are saying here but allowing something 'like we know we
> > > not preempt queue so it is safe to kill in an atomic conetxt' seems
> > > risky and a very odd thing to support. IMO we just make it clear that
> > > this function can't be called in an atomic context.
> > > 
> > > We likely have some upcoming TLB invalidation changes too which I think
> > > will move all queues to a per VM list with the list being protected by a
> > > sleeping lock. Removal from this list should likely be done in kill too.
> > > This is speculation however.
> > > 
> > > I agree some test cases for preempt queues and PXP would be a good idea
> > > if this isn't explictly disallowed at the IOCTL level.
> > 
> > I have a test written locally and I've managed to repro the atomic sleep
> > issue. Unfortunately, I have found a second issue with a locking inversion:
> > we take pxp->mutex under the vm lock when we create an exec_queue that uses
> > PXP, while here we do the opposite with the kill() taking the vm lock under
> > pxp mutex. Not sure yet which of the 2 sides is easier to fix and therefore
> > if this patch needs an update, so I'll hold the merge for now until I have a
> > clearer idea.
> > 
> 
> I'd suggest q->pxp.link to pxp->kill.list + a worker to do the kill
> then. The kill is already async so likely not a big to deal make it
> more async.
> 

Or if we want to make this generic... Add xe_exec_queue_kill_async with
the same idea as above but in non-PXP specific way.

Matt

> Matt 
> 
> > Daniele
> > 
> > > 
> > > Matt
> > > 
> > > > Thanks,
> > > > Daniele
> > > > 
> > > > > regards,
> > > > > dan carpenter
> > > > > 
> > 
