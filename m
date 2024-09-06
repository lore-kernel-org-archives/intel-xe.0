Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0DDE6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19EC10EAF5;
	Fri,  6 Sep 2024 21:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2XKMCWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A803F10EAF5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725658814; x=1757194814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6v43XaKCKwYogo4TyTpXMhkDmr6lGwJO5ImBLTnqt+o=;
 b=Y2XKMCWAZwn08l3U1M9HRSGblI8v6jY9RtVZkTuppDKWUPnxbxURIaJa
 YjBsKvtHV8PKhS46TL84inbFyrbZwsaJ4k8CL2tssHcrsztt/cl2X/pcV
 X6W5VHC1vn9XUrgzx1kLRKkfBLoYhG6QWy4B8z4AmfYsm3ZVQXTj17OQb
 9c95ug6AioNEUP0sC6nRApvC6IrJkhty34iOe1Vw2/Xn3HAyIg0NNHq90
 7SJNcK/fhtdz0wxzEJK9r5yvrTzxhzLBd04Otf1AWi8kggQV/ocCblGs3
 O98gSHMUyhCyuJQVU84me9LyY+AxdJelD9rYvcqJJ44bGwU+kIBoah76A A==;
X-CSE-ConnectionGUID: Ff3drPT5RyKruw0CSvuEfw==
X-CSE-MsgGUID: B6dhtazdTXiqd5l+XsachQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24579305"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24579305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:40:13 -0700
X-CSE-ConnectionGUID: E8It/hCPT0atFzFg0UlTbQ==
X-CSE-MsgGUID: Z3uduW4hTVy1KI1fianwHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70653235"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:40:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:40:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:40:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryErhoDndPWHgPT/U8/Th1L5H+h775ZPP8q06G0se4PZm1vXpeqIsd4xmpqB/P7/aEgT0LqAeUy8U6FSQZeoJbnoqu0T+THU3LNK8g1BYFokLNZj+oRnUWDCMHd80sIGM0iM20tgO3o0VfS485YBjy2P1ovkSfhg3GamA7Qq5BTHuaYWZ9Rphbi9BBpgsPZ6abCNFp0JhD9xfMK1/8BUWI7otM6Tm30PWyPUKdyFPIJzaSCySWXMIKU4vxnEqT+/rU7JJ8x8etS2eXZF6P/ulPLIB7kFqSKD5Wy3dLnvzQhnnlfNG5e7X1uZBF46un/W7oTvn59i5H+MyQFX+FDbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWfrRYGCfVNbbnc1k2TboLeniTrfkHfiJfyROJj4FGQ=;
 b=g2/V1dO1iluHTcyjyKM8MIWXE869Ft4kwTYAyfR3BFpeiXU+8IjZ0u5AysONduhXiPQGw/d3OCQXDQGf8TlWtWzU1U+ZFAlphHtTBO8L07TOBV1t7LSkX0uJiPnsFp7YNqDfcENAYpQAS00XXa18bYnahALXAMc/BgiLLOq7l54aZ+SfBCF9B23cTNTPlagUT6ICsJcqclQHyFUlhCqxHT+p+VZwUMcVXgmtX6TimJnbLHzWjjpKpmeeMRoJWVSlWK+kcammJ/frqrD17w6All7eZ/B7mxPf3Dr+3IuzM33irirBH8bc6ifsEACz1P6yRuBPevH39s/iSTSAcgcJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 21:40:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:40:08 +0000
Date: Fri, 6 Sep 2024 16:40:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/43] drm/xe/pcode: Convert register access to use xe_mmio
Message-ID: <764fltlsvuvym2geuupveeof2sd2oxsii6jlq37oybu6s5oqnz@cvhuhut7vkf5>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-56-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-56-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8d5254-e809-4acf-31f3-08dccebc7a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/wdECWoYF1JKNI1cW3UqfYIPGE71R6UEC/T0fpCa2MSjIfRN6spYyiRMSS4?=
 =?us-ascii?Q?KE2Wc8kLl2G8POy3CxkacdD+ewJu0Kwv2aFBMQt393bN+j7h6AUa+d1dNC28?=
 =?us-ascii?Q?ZyRJhggliGcEPuedvFoylXVUZZHf5FVDUXbQT2xcMaFmElk4jVKL9n1+3cDl?=
 =?us-ascii?Q?8pNZMO8Mx8wnVviDG8WFrqPK3VQIXuCobphl5vKre/z4ZP99LP9Lx9GjNS4o?=
 =?us-ascii?Q?yxeLIjEWcwuQ8nRu3GPTF3W0VO4iu4CgBbpdSLAf03eZQ9rwileb7VoQngcU?=
 =?us-ascii?Q?s8kBUORLvjg9M5svwduPcRPmGGfYyAgJSxW60/s6QrYpGAI/JVcnZpHpL3kF?=
 =?us-ascii?Q?C0ujrfC2mIzbeZzEmKv1ssz59wypByVnD4QW0TNSUsHfkM7m4B5s6BbuIIzy?=
 =?us-ascii?Q?APgGHDOTxXLkUR37/GJHveYtTAxkRaKfa/5A9IDKaoBm7v9WH4uxERNmWTCt?=
 =?us-ascii?Q?pLp9zSrQwq60/DCsw7EjGMuaCy8/jg6K6xcfi/KNmFnO0DNKWvqLXURw9/DU?=
 =?us-ascii?Q?v35AMdf5lvGqqijLGh8yrYtQHosmQrn6HFH7+sobILkO59Zhh4j4Fa3kL/n4?=
 =?us-ascii?Q?GsjQP0Hrg2EStw+Sb2rVI8pgxN2a2MMYuokYzpoKAK0ACo9xmkHIBxRg9IQd?=
 =?us-ascii?Q?/mGzKxmhZkD1KnHUTxEThCvDk4/SbqvoQjkMZ7WUwgQ6tVHYYNuMkYexc6fP?=
 =?us-ascii?Q?2z0aZ+Pe0hb4iFa40PMQa1MB9ItD7V0mqNSs/A3Fff8TKfcFkcAeD0obwnQ4?=
 =?us-ascii?Q?mQaF7kwiWFrtcxEelQWa6AiDPmxPg9HrUR+N4uWt4xI32HGVIbh8oJ588gnj?=
 =?us-ascii?Q?D1MFwngvlFA74U1cKxGkrHJg0GJdBZ7aPv59Uudb6ZQs3xWcxZQ41+raJC3U?=
 =?us-ascii?Q?Mh/IVmVsT092MPc3rsBOuLH0OU/04pJ4CKBXUDPEHeGGT22j9MxCqXQcYmki?=
 =?us-ascii?Q?1cM29sF3YX2gYsujPV+GQ8AjRv7Iapf5nUY4P4e+AYQ/om7djLZfO9O+zYA8?=
 =?us-ascii?Q?Jkhr6V0zIE9v1zR4vODs7ILZsr4bNMeWQyipqhHyX2Dc/sqtesOcGEn8p97Q?=
 =?us-ascii?Q?AN9yqd6aKmHY+PnIbDWYgE9VNV6PbGeXymiIEoW3OKfTczdBhDN42kLlhpIj?=
 =?us-ascii?Q?pe6Kt9t+zP1Fd0K3XGpQ678Vl3AyWgeTkvELeJ6StYUwy5tpo3j2SACiBC8p?=
 =?us-ascii?Q?RuJQKZeBxOVL6SMaYSEd9nM8wGJ8lIty6EtOlelybZylV43YAbLHWg7dx1qF?=
 =?us-ascii?Q?1JFittM1JI8Adx+F6Db/rd1dGhlMRKg9wdGHE8miW5Ruh3jXE8lu+L/oRMg8?=
 =?us-ascii?Q?cKgwhZAzmN+EwXmxBtq8OBUT0XpIvyKAg1n09CUrSCRTLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jY3vlgblfyoMLeNYXMuat1JPzuXyZgspXLXf0ddSjP4O0ubikWQtXPHySf6r?=
 =?us-ascii?Q?+IF7ef/NOxdKvZiR8/Eam2DAOvFSOihdxIJuSShbuyKshbCHW14HSTAGccDy?=
 =?us-ascii?Q?/CXmEStSnqFcyp57Iv6sFHB5Mj7AUaAIN5Mn5AYthVVa3BFO8bKT8ggzvHEZ?=
 =?us-ascii?Q?CQBQSQ8qrMVzbRP9dTV1c71MqOsztDrQLvZNAuT7AOELAQbJWEsMWmZqIelV?=
 =?us-ascii?Q?kA5/XgI+Je9HOZGumfRhg0DSQZNxzO7IK7OfQKqy/2Gtvl2q9DEb4jFdXt7l?=
 =?us-ascii?Q?rfPY+KUiPz64z81I+XLBMWVFGW7lq0GHWPxIDJfrWm3SRSXy9/0h1VW8LSM9?=
 =?us-ascii?Q?1ogENkwWBwzb84QeWVSKOGh02Eg7X/66I+Wj1n1t8G6ErVnUN5hrJAFXtAEO?=
 =?us-ascii?Q?hC25BrzCWXXLnpyz19sMs7KY0PRy3TIRC8EzKhtadilQWZEX6IV1VZj5bKWH?=
 =?us-ascii?Q?3YPPAuycTVAuQHVbjo7ICuvg16YjGv41bHjNT+oGa3EhhRI5kazIc61h8L6N?=
 =?us-ascii?Q?0HbmGHqcUkPF5keJiEFBkowO8wMQR6soLAua9AIpueAYHDZUEUrM/ExYqEVs?=
 =?us-ascii?Q?y80DYWlIeSluLtaAML6xnORpZHxmSJNazwRz3KXXRv4yxXKhfdZxQKh6XuuB?=
 =?us-ascii?Q?6P4doxWiFJDwfR/BIYVsf6NeO87qQhUzu1co7T+rFX1hVRMfuAC6kiJRhGnG?=
 =?us-ascii?Q?a0LgkcLz79+bVNyh1J/amaco0JQbkKY3V5EKW00zHoSv0ZAx5de6g/I7aMHE?=
 =?us-ascii?Q?ekqDkyNtfTuyPPSGf/tQ7GQku092PI31AxnDzS9Uy4W5Ex2aFZsuDTmDpBok?=
 =?us-ascii?Q?g01ilALcxlJTb6jmcQrSB7A3VPxN4uIRyxln9KHZ9UMPUkEzw/A5fH5Hk8Di?=
 =?us-ascii?Q?DT0BAwI0WZaFlUbgB7TD1r3fyehXPdIhtx1qYoqvfE+en9FSsjqqFYNqjiB4?=
 =?us-ascii?Q?LKUHJbes5qBGm0NgnLSXmzQ8NnwL5b2kNbXbU2gU2WORaW2iIlSK/bgI1CWi?=
 =?us-ascii?Q?6SVwAoeg5gPhbAJN3fbGfK73Bu3cMRlOgl2bQFzEforCp2Bpmfc4Y9WLh4yK?=
 =?us-ascii?Q?WtK5gQG2INtkdBcQnM929unddiv3Dt5AUjBdqmz1lsCnl0YkNQV+BDsfhsa+?=
 =?us-ascii?Q?fjCpSp6QNU5OztTGi78j09P//YxEhj+/d5DTIhpcm4eCceNpnq/gra6Q8KSq?=
 =?us-ascii?Q?scOhavvk1Pnkm6sucdsZ8yhlPrUgT0E3d2+CzaO809S9iagqiVoM5Q+0P/BU?=
 =?us-ascii?Q?bmGxGjk5xSDp9zfWpF5qGKYgKRCBA70IokAqr9Y/VrmvQsobTRitAUYicTme?=
 =?us-ascii?Q?0F9L9YrBVP2WDHBg2JVAbtPmIn1T5d+NLim2DitLBaTaRF1P71Ta2bFnWBz6?=
 =?us-ascii?Q?BiRrci9LE80LgVIMhFFlLH0pAIatfBVloU/mSmnGqPrXkLzh2M2+IzM7Dxkq?=
 =?us-ascii?Q?Yi9J/JUolMhEkjD8bkE6NLXjeTr5nCEkKfmWUx2NTB05DC1jwtj+kH8f8KJh?=
 =?us-ascii?Q?Vbdgz8fqfFeh5QKSKNp4DbDpOWYHS0sZalSOuE5Fm8mDU8wReznQgalDlRUf?=
 =?us-ascii?Q?i7JCqPQjiVK6Vhp2MsecnCIpF+XhXpVdHngA3PbR3VmNc6lvJAjhzc6OUxU8?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8d5254-e809-4acf-31f3-08dccebc7a8f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:40:08.7316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUaDLR3yx4WF0aNa11P2QZoVUxcVLTMTSG6ScSBC230qp/928DhU8v3kzo0adjYY8fpJcq/feaAvFGJCPTWlndguQp8X2T/yk2Ox0J9I2dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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

On Tue, Sep 03, 2024 at 05:21:12PM GMT, Matt Roper wrote:
>Stop using GT pointers for register access.  Although some of the pcode
>mailboxes are related to GTs, pcode itself (and the register interface
>to access it) are outside the GT and should be accessed through the
>tile's MMIO.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
