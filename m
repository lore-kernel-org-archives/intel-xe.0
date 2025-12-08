Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E58D3B7E1
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 13:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDC589622;
	Mon,  8 Dec 2025 13:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdeqJdCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FC789622
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765200504; x=1796736504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1C37hwzinaetYNhffiXV2K396BobrEsnwoWfBwcFZlM=;
 b=ZdeqJdCDIiER3UeTd5FsAsQ0ZkUsuuv+fDpX0msin1vqcTkLQYCXSaXH
 fDLIYGdyEsqnjvwMI0lZW3NAa2wDxjb4sxzw6q93iAIWGskdA3RxbcG3v
 aLGI1gxg5NJsfb+2L6uFQJT4YzLxsDdgbUbLzj37gvXp2Oe2nYyWQYCX5
 6Q43/nAiaibOa+ffaKbAc8Yrf877JT/4nSuWdwzF+wtrFHbC3pKZlNbn3
 5Ni00yj9BOSGI3lMQ5pReIZP/5xelJPDE+WQotUa5q1Z4KcdLnTcHJU+i
 SPSaIIbVWTNOj0kqBDKygQt2IHMO2d9MenY1OGqAogK/wkSJaPgfQzUza A==;
X-CSE-ConnectionGUID: JFGotPT3SE2Y5ZNEPslmkg==
X-CSE-MsgGUID: 3CZZIQtCS12e4RgsdKBJPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66863068"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="66863068"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:28:24 -0800
X-CSE-ConnectionGUID: yVXHKn+UTle1FcOgxE6EZA==
X-CSE-MsgGUID: x0zLf4fST5i2HbJ2Wp9wIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="226587675"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:28:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:28:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 05:28:22 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:28:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIjHDlJQ7w6bhHmrkUGgdvog/KXcI/csq6KNQbr6TqUSO1uvPkn7P8w2LUxljuWwQxYkB5ScyNLW4Z2lIHmkes3nB3+7DuK/DWdjpHbZtcGxyc9c9II+ZvhuQk7NPCg4094Jy6SPquJIQQqTCK4dHUUtAErADZt2ZV5ah1nb4aL79cPAuChMXxiS4TNVe3ugdbHtamXhvpomx/gA/kaootvE64F0HNPAN5ZFTESM3TMFLG1RgztsbbmttFZ62NSXNCEc9drM/Hnhbp5kgWhnTxj86IIvr2riEByfB0E+8ylPxO+/jnFRz4+O/GXeLLhu+nm6ei2r/km/RShC33yn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYhJ3XgokShP3MELcwAqY8VKlSUcZ62DHMsy4/WiRgI=;
 b=r1sTLZSvxmNEfoM0fPARSkQFkle90bXwPxSlbRcJIQl0+PLpX0+JWw+X1CDFhRMlBLYL3KPf+b7lWWfmdK++P3zaNMWeZvwQeLjUJJEthwVXH9wAopQiFomZzvI3nZiaZRFsP/cWv7sm9jsDKwFVghVNNMh3yVuECkd7U6o0hdFyWxougI3/uswaibzoNWIkwvx5xWNu1z7Sp5w06v+NmxxO1iNT6z9JbepiMQ62qr2zYVQqPCNJiKYgAU+4EdfQigbH/mhihOqWg4iV8xJPEJaZxUj2+RDuopE3ZlrGvmKSozahnBZXFo851TlG3QYlOmvX87ZFu2sda311qNor/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Mon, 8 Dec
 2025 13:28:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:28:19 +0000
Date: Mon, 8 Dec 2025 08:28:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Anirban, Sk" <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe/throttle: Skip reason prefix while emitting
 array
Message-ID: <aTbScFjNkVDq1dIC@intel.com>
References: <20251203123355.571606-1-raag.jadav@intel.com>
 <764e770a-42af-44c5-82f8-7dcdb2204843@intel.com>
 <aTZV7GBn_kBbMC9w@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTZV7GBn_kBbMC9w@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b4e335-ca0e-4035-aecb-08de365da701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MwEW9WlnAXWbvshOXDqyhaqaOkzlYJsm4pqvHDzk3Ir0aTnmhA+mm6lA4o+c?=
 =?us-ascii?Q?P0Uoa6jq9z4HLQFGDczTzDmhC4rHW6EITe0iIfWubv4yJxRBKmrOAvIrEEQ7?=
 =?us-ascii?Q?kH9feJSf+QI4EJYwh3FPVYHKmknsSXAPxvTNIsOeXIK5P1wplJO2LO5XBCFu?=
 =?us-ascii?Q?UKyz4n2UB1z5nPbu0Zr6CMgZZ6ePoanvu8atk4zmLzsi/1cmq6gEoUnA6pPN?=
 =?us-ascii?Q?ioFuDGyQYiYYPoEfGyScI28Yvpl9qZG4I/nnVRJ0GybXaC9JeEwpj01A3N97?=
 =?us-ascii?Q?tn5VH5xIWZeyAdBiPcxJ30lwMsYVi5San3HRUni/b54bEIBBn289Un3TrB6Q?=
 =?us-ascii?Q?q8EyQ6WR13tu0S6yohF01M7CfzyR+an6jIjrf4qMaEly9Kj3lA4tqhQ0it+Q?=
 =?us-ascii?Q?DIOBGcBldLByyrdmCwm2Wu6Fw4HOccM2e/QmzKFQpHEyB3nUoP5MD2leoXHS?=
 =?us-ascii?Q?TzyRHi+HmvcPSSBNQSW7LrycREU+QYSp/1GpVe4lBbWgna3a8xDw9SjaOp/P?=
 =?us-ascii?Q?47qF7QeIJkOalhapUEmriVVYK8wwzz6fmycSmNmLodkG6gljhUvg321imtH0?=
 =?us-ascii?Q?CMN+FDIEKcwLUVR3lWqZzV77gCJtW0Or7rMoFDMCSExOo51GWQ6z3HfwsUvE?=
 =?us-ascii?Q?nObZV+usg+73ia30yj+8IQuAVa/yCkSo0G71sG7ktHmFz6QX8VkCdPoRN7eg?=
 =?us-ascii?Q?OlMaoXzyigS1zAAZai+74FGwXQy+JcMT7dvQXVKI+VVPrD3t2zf+IB8UY+2C?=
 =?us-ascii?Q?Fp6gEU3rmeFIYpetUYe8B9VWMuZJ8PUWnVCaUhxXs5gWLqzBAsqJ5xIo2xwJ?=
 =?us-ascii?Q?pzDoPxu+N17rLGQDcwsNZm62vacgAiSThrqk7MpMBTR6nw55tr7c3NpCBm2y?=
 =?us-ascii?Q?gILjcjecVF84/RwENBAffcP7X675a/CjBTVqPwBBsrDKQM7rMvI8CpH4PljD?=
 =?us-ascii?Q?a7uNiC6n86T4ep5vuiiSd7qha4BzGfCQ51xwxwY/GsAt/hD8zs0dYm6c3gnZ?=
 =?us-ascii?Q?4IYVCb9KVKRktd7OcGGVhLa9pBw4pZVNCG+CFyUcw55sfEh4vAEpg/ZTXYiJ?=
 =?us-ascii?Q?OqjnOieAayaKTCe0DqqzHq+K6TXNOyidNNHgXh+oaIyCzldO/1woBnwcbz4J?=
 =?us-ascii?Q?u6R+INCe/e5N00nAprslLb/Oll8iiji/0XTiPRM5mQt4Xipyw8SjlnD3uSXG?=
 =?us-ascii?Q?RoFYbKeEnSOHQynwdcryAWNORfBu4qbLwz3+pvzTMSwlmx7YKOrh6d1LW7+X?=
 =?us-ascii?Q?q/+u4UbEw+qtqg+QN9q4iuA+8BrG7t+4v08Dn/reyBlP4nyIqxo83LMbsoW3?=
 =?us-ascii?Q?qaawht0UtHFFfCmjCMglQNps9AQhITAdaJMxBm5peqZIyDH8BMNoVTjGisMc?=
 =?us-ascii?Q?dltvc2DaKTC+zL4O2BSLL/tViOUWoEl8ZHJXBC8VyiKzn+Ec+DtjsaY7tNJy?=
 =?us-ascii?Q?9rRSKTWBiq1TnqT2hKXzf6fyZQXbs4Ej?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cw+3kzUNf18IoXPpCNdMg/WIma5l+/M8+uYH9jP/CmUfH4N3P00r/QRpoS+Q?=
 =?us-ascii?Q?aONE/0cKgbs5aXMFNOM2cJwNmj0GfqDEtYQzCXfEfSArAfbXbUF44u+94FG+?=
 =?us-ascii?Q?Mh8nIxjHgy9atBzCQbXlY3gXJFFcHXtj0mQJzgZYEhXdYfKF6a/pf0hzcOs9?=
 =?us-ascii?Q?ZS4U+kIzh3wEWT5e8KtfKCqPLL9q1f/mZcA74SY7bHE86D+SJKpNPY4tCPSQ?=
 =?us-ascii?Q?HCV095YyPiH8q9iflW1u7P2lKUuSxrxW6rStvE4b0lMJb8+1qoG3A9tZQgSt?=
 =?us-ascii?Q?fxsPA7UbZe9dHhR8dgRcXTzUFB52OdlWlJh4PEmfpxIOC7Nrz+vENPAYAobt?=
 =?us-ascii?Q?cK8jf3bI+CxnClBAAMRD4kilnyjzqgW7oseHRXVp0fmbXFhyQ3Ny9DRjMoIc?=
 =?us-ascii?Q?dIuZ2vttYJHa6raYSXMmoBwK3iU6YWC21go4Rxkx5+mzMDnCK+/Wv2ffW4Lj?=
 =?us-ascii?Q?L9AdQrgJExwX7VuxLU4iycYYit2LgpOFttzTrtsKYWLcw98CuxtzJRgWnm9Q?=
 =?us-ascii?Q?kttFyYE6dtnyx3bQ9y5b2hfGm6hJmJLJjYJx5FqhXhYLaJE2489IiIWLWRXN?=
 =?us-ascii?Q?VADs3rHcH95NccmD9xGsX1o8eNoMDkb91H5/V0+2dHvazNhZ+92z77KFzxTD?=
 =?us-ascii?Q?66fFbtH1bp616XuJ8IYZaXvgE8loXBROpzjXH/4aW6/FtcVz3MnHHwcRCl9P?=
 =?us-ascii?Q?HQ0b6TFHe0a8A8VB+2WoRVDyJkubebzwLLa7H3AWqxJMMsD8YEhieGCexaKA?=
 =?us-ascii?Q?zFE7pBwTZGdBt7DNaiOxMLwxcCKkPkEy6pEFAmMMt/oZXcSxyaatUsCsWXGm?=
 =?us-ascii?Q?y1UB31Lvk+1fwSfCv/mv7FKrzMoo92S0JFk0yEWa4Leq4xRn2iS68pvchPtp?=
 =?us-ascii?Q?cIXufBd0eZ9M2srqDLTMTxSmeoy94YDEsAygkbhpAn7UydkxmIf/QA/iyPKN?=
 =?us-ascii?Q?K3BNlD9Pm06bYEHDnIQ3x0P47F6ohZ18a5/5iEO9YeZGCwjh5Ym0gTLBarra?=
 =?us-ascii?Q?sLDTrxYJbKlNWrUVJaOfsvfztUUcFIsgtEqayCj1nCqdcpaV0xq4yYQPyV/o?=
 =?us-ascii?Q?coO97jRFw5cmRmOtMyBiIBBm+DxURHjjaRd0hnSv2PhaksswseinAbMGGtKH?=
 =?us-ascii?Q?8wssU5YAufJMZtwpd/0a494ABBukoKZa/8pxbGIxfUKrCPTqf9RXJgXKMy4T?=
 =?us-ascii?Q?DOJTYhEG6L1l7shdvXt0jDEj6NVjeexUaJ6kbrS4VgKjbQ0sBO9JRpdxZsCC?=
 =?us-ascii?Q?Lv4jhhDok5uhsOwNn2+uJpTbklZTyw9pUiE22i3poX8SSCNW1eLOZOUD3LKt?=
 =?us-ascii?Q?RiT3dFwoz7ojQEs15aIOrPX7bElNTLocKEZfHjGFs9aSIp5862eQYbhiEBcg?=
 =?us-ascii?Q?aQJoZNhWoVp2l2HPe+sqjqCgVH2Rwe3vtrBANVpbmNdf7yUnq+YZcr+2AKYB?=
 =?us-ascii?Q?L28850mM2P2uN/mO+GEyPNj8YNWrDSZ2iWg5H4UwhBsaU0UZto7ITOML/mqE?=
 =?us-ascii?Q?Aw+qMrTgHcEnSwbt3HJuxuuBKlG9VOX/nE5pja1w5CsdODjVOJwAQ8mqAQkb?=
 =?us-ascii?Q?28+Ttu2ndS/PO6QArcxaT2Wg55zmt8F6XedHjh1D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b4e335-ca0e-4035-aecb-08de365da701
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:28:19.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSf/wrM0RxOit0VStqSE1aCIOSy49MX89sdsw2Vr2UlyP/8Ds4vk827X3FW/fLOj2kk5NfVYhtJAS5NPl3M68A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
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

On Mon, Dec 08, 2025 at 05:37:00AM +0100, Raag Jadav wrote:
> On Thu, Dec 04, 2025 at 03:12:39PM +0530, Anirban, Sk wrote:
> > On 03-12-2025 06:03 pm, Raag Jadav wrote:
> > > The newly introduced "reasons" attribute already signifies possible
> > > reasons for throttling and makes the prefix in individual attribute
> > > names redundant while emitting them as an array. Skip the prefix.
> > > 
> > > Fixes: 83ccde67a3f7 ("drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons")
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> ...
> 
> > Reviewed-by: Sk Anirban <sk.anirban@intel.com>
> 
> Thank you.
> 
> This is fixing the newly introduced ABI and needs to land ASAP.

pushed to drm-xe-next.

Thank you!

> 
> Raag
