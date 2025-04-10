Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B403C369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE9C10E376;
	Thu, 10 Apr 2025 17:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6QLhMI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DC910E376
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744305765; x=1775841765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ByUB3tQhsOJcLBWYt9HWzUz4hyQ6/ziroQ9JXaoIFxQ=;
 b=P6QLhMI408cFij3+RVlrcumfVCxzhbHBR41NJY5hKZwR031CppDlw3LA
 UBMk7ycACa+jGwMlEsGE51OLKcC/XJZGo+bI3jwQQUJXD5yPm6+KVyQYn
 Hk+56Vjd97unWmOChodte9AKzjqSmwCgjr+om7nMeX89ovoNRx1uXvdjP
 Be6v0o8aQdHo1xuxU3DI2uOyxXnpbgCnYXEOZoFEAZSrIzBOdxMX+D4Ad
 /Xbn3ILDA3P8NqUEJnE70+dYZXz43ALquGRZmhtdKE+4L8ytCxsnw2ADk
 UtkAiwtLP3ObALiESusUsKpesIGB7KHoSmy5/cqJWjvYie+QP8UGhFUiF w==;
X-CSE-ConnectionGUID: kmKgT1NFQhu+P5pHBmDwuQ==
X-CSE-MsgGUID: sa7QJeVpRzmgBz1F0DNPWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45731093"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45731093"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:22:44 -0700
X-CSE-ConnectionGUID: h4l64bJkRCSk2EQ3DxZ2TQ==
X-CSE-MsgGUID: 5fVaNtJWSoSVVYzYXDX15A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="166162937"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:22:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:22:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:22:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:22:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwUt6YQ/EDORGXja9FLWoOfesbTkU4pTdK+SQ/gZs3A5n8QktLcFs0qJQYh0Fbs5JfZf8DC1xQoovVTyJiwt94mPcDEyPJ42ic0rEIG3l7AjGzkYLEKit2RC9G2CJEZDnS8K54bDWMN3NJVLzodzg1AVgwoPok5R1Pz9VJjajw8FQMAQbWt3/7ObwVhtitjz8f6HDj0kLu6W5UrJaNC3vhWM0j75TKCEVNA9SM/x5al0ODp9jwZIPOwx2Wv0O4TIz/GJDF6VJlxijfOdn4m7h21w1CmUVYFcQ4rglvoHPvNdyV/Ww5fSh3jqHoezgBFeFb3Qqp7ec1S1sRktqEcbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElsPNd3QXK/jzSW+Yi9ScfeRthGWE8lS4LTfSm9vkCY=;
 b=Ikng0tVEmjwR3PqhUzKQqjCAILbX5sUGi8Pn+BpNeMo9qM7p7zE9p5zlIH5Y0RESYbhxLjVHtNjTpWikEpAV+1b6+qOxcadxAJUSeg6NgXmtfeOQWvG23tQ7AEbCtqLa55V/5bTu7TPT82KD000KgeYkEWRMPqDJCKa2HvPcbmBtyhpB8ba5vY5E8GXewZlVCfnDO8DPiGZ5T6KlKU/wOynkQMZoXWWXLTNYfFcTwLdT5tR9OSgdVyq1/bFqcSkFH8svr1veBqb+2T/A5wZQn4DLue63qXX4+ImWLhvdI5+cy7AU6LnIfY9Ks/uFAz0rG0Uhi7AZyCzeeV+2ylCuYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Thu, 10 Apr
 2025 17:22:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 17:22:00 +0000
Date: Thu, 10 Apr 2025 12:21:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe/guc: Don't expose GuC privileged debugfs
 files if VF
Message-ID: <o5huwphm72sjhk3hnki4yesnsedfh2fwyb24r3iditvc5tqmef@b7i5ingglp4s>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <20250403142635.1821-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250403142635.1821-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:303:dc::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 660000f3-4544-4780-55cc-08dd785433f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u78g5dJ/JHZiz+n7t8ouk1RI4B/QvuxGvPYvfPxvvjxDU9r+ER4MLJaGwspY?=
 =?us-ascii?Q?6tSnldS91EQ+BR/QZg/fIlAA5DpPyt4Gd9U43SbeA66uVz6NmJNKAYw3PZRm?=
 =?us-ascii?Q?tmq+7Mo3gLK1NRPLoZ6ae05awVVnBr9QftbFVzE6uOZHH2C1i3CPd8uadmb7?=
 =?us-ascii?Q?ajdViTGraAtyvU0WDyEWOCt+yfaB1kJeRKapg/R53fDVrFRKP4Rgn3WDjYpD?=
 =?us-ascii?Q?KNMFKu1lXBAm1RoENt4kls36dOdpBL0uGB8MiiZXqP2AebdnB7kwa2LRbfT4?=
 =?us-ascii?Q?NiSL1kjjNTv+fHnjtRJfX9x2CjuuXD4vjlA1tbiQpaQ/bBZ8q/aAodHhBTNF?=
 =?us-ascii?Q?W9MLUllCBGe59/xyPKjKLQS8jTK/n2bkSnQTzCThXAqychR+D+e+oXenr64J?=
 =?us-ascii?Q?bME7yK09l01t3N0e4UN07glqlM9OLvjkZI9K0Tw/12QFBRmwHUm8Avx/R7rb?=
 =?us-ascii?Q?NB34jNz78QySuSLwehydtTb29Y52Oh5j+G+rpEfkSThRRg4Z5bbXlKw4D4vH?=
 =?us-ascii?Q?qqN578XtkDHy33V4FDyoMpUHlpHc6dtNSwQk5rcHTGMki3ZWKDk2xcxTLiNw?=
 =?us-ascii?Q?OpNPuz6Hy5iL6MsulToNKtSz9Zf2s8ThVRSsf7zg0WsG/FZXiLVmjpVLfaUQ?=
 =?us-ascii?Q?3di66dDHyXPkmeXDT0SkUkkkJTztB4Kzs3KaDRP34CNI7BI+lCefwpgo8Zi2?=
 =?us-ascii?Q?TweDPqjVrTffqrP8Zci7yGMjDKcZuGIGa68V8WItHEkG7kuQ9Ep99nzoedFE?=
 =?us-ascii?Q?d1toTrVzmc8KRbzYIBzoXYH9nm9B2Xg/W+TktCdc/4fXjTbih4ACOxryrSrO?=
 =?us-ascii?Q?CHrWIGjbgWSI1MNvqnEB4jxZHOv4JM0fkwLxIH2AdoCay54+0IiQV6FjoQk5?=
 =?us-ascii?Q?qhfXq+4MV/fjz23XW2qRxihFFmf7Ac8228PBR0ynXN8+QLSDzmaf8R+QSGG5?=
 =?us-ascii?Q?NIc6JHZoVZGeCZ1tZ6+xG7amtp3o9O7zCEq3VMOkz7GbCbHvUt9/b50JguOb?=
 =?us-ascii?Q?87ES6g3WQcgq8kdbXb94In6TE1ajkkfljDopcD/xruS0lTL/vp9JvBk/oOTL?=
 =?us-ascii?Q?NgfA6DoOrUfXBCiNFUowEvJOXMLioAu3do3G0riFGN1PUbKyhvWyYEG2gqLD?=
 =?us-ascii?Q?5D7J4s+r6S77Dp/h9zqYfKO78YFp5IAEmOU8qwQQoTKfuAHq7gW5er0lpL5o?=
 =?us-ascii?Q?b0xSfBv7URC1BNg3jd4yNQcr4P67cMHj6YILenjJw0jDgOJhsbDLuT5AzYED?=
 =?us-ascii?Q?QVSGqI8D/F6zIitkPJJlg5Ku3jfiNt9SsZAOtuPhNWxgVeVzZ4UwijtMyTyz?=
 =?us-ascii?Q?lyyj6KKAyfj5Kz+Yk1vNfMfLDUC4Z7kWwzlmFj4HbGww7t1VSgtwT48k7ITf?=
 =?us-ascii?Q?41N/9bqHZCAcWRI6X0luKa/tKBuE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgvc9E264ADUTFXEsVWVLzFLkz6H2RRNfX6Cj4srAALiBxTahsslwPpQJDO7?=
 =?us-ascii?Q?IqqwqhprmdCkYZXv9uIJGP6rNeoKOFcjVkXv8lTvFfizzCIMXj9yG//gLOJt?=
 =?us-ascii?Q?rsUeGfmqaPCnvKItSqiVEXcrblC1AOIfInEp3cPKyTlXZwryWcPQXjOI1syZ?=
 =?us-ascii?Q?QgYPeFdBp4cqSDF82UqPIK3j3KXxZVb+gS2w6aGvwUSisZMnnLveEM5h2m/Z?=
 =?us-ascii?Q?1H/Acd8t4N8rpCj9X/0zTqkxjQMeodBLIB+N+xA/QIcNOjJ4yWjr2pXfCxYj?=
 =?us-ascii?Q?HUxQRK804/ySdFsPyq3kWNf9IDM87KvgNTYw4mkrEj9rrCJh1ind3xYPRBZ6?=
 =?us-ascii?Q?vz1RaOKEAkv3NLQOfkrNLPJE5t+Z/hy//bf0VSHHALrfnOsIRZktTM7SSV93?=
 =?us-ascii?Q?d+y/5BuXroA/k2YYHDcoqoq4AXM656AHo8hh3JT0Fv5OFZ7IdcjUU3xEKAlg?=
 =?us-ascii?Q?TvTZB7pGleTlq+NHKjCQNeT1z9BTfiVFHNLS/vAR6hBqdWqf0zs3VdbqD5Fq?=
 =?us-ascii?Q?zrsSq4+dk+kYIVz+7I8LJIakyAHyFVq9I1rrKMcO1VOZQ8zedTZ57uRN4eE4?=
 =?us-ascii?Q?oY1iWvRSdWVeTLRCPIMoFbwaIWEaXkXjZPh6iHg/WGNqAmCTs+w1rG5GQS52?=
 =?us-ascii?Q?lgSchz6Xz0XJOevqpdlv0ftY9N8Lw+DYIk1wzFDyzgsB4M6zmqoPkrj9toMI?=
 =?us-ascii?Q?pS+sUxI744+HmmNrmGGxSerRRIDXWe3KVqzZOxx9goWS50ZnLk4IthE9xeMS?=
 =?us-ascii?Q?d2SB4Bey/YFrR9JiOp17Mb0TFunxZZqiaQ6tgHHAKEZ/vwpb1FPasJ9oFc6c?=
 =?us-ascii?Q?x8TlyMirAGm8622ko0t+gJDxukCWWTSdHVnsEdjgwbbudV/saa5OD6fYrKb1?=
 =?us-ascii?Q?jholUrZaod3o5zqiNGLxHk7mID2fa8trKkesBbY4EMHvUDk6sAQadSu08lxU?=
 =?us-ascii?Q?Yu2McnZT03bIL2ZzvyAYlw1I1u70bi6ASx4SGnxampg7J0MnpX3SOb+Lg8mM?=
 =?us-ascii?Q?swsv4rF0Iyt6c4ZDXIYDLTUtSiq6jPQv6r91aZoxXmvaw4aTCRDWoUte/AKn?=
 =?us-ascii?Q?YBM1s1pZJYCwaLuK7sUwSGEvIRqhusKyswstBKNCf7xMpgqNCaUqXhibsC98?=
 =?us-ascii?Q?3t/kTT4RzPUWCcp/c6h2FEybrlflb2fzzFubfy6C+8pj+xjg14DhUXGwbHAw?=
 =?us-ascii?Q?d6MEgnH22NZhUbwe67fNsSosPVapsNQVmm+hcSdLFi2kakRyoef75GbPwgLw?=
 =?us-ascii?Q?efw9L4GkbLI8iOIKXlLWxOOJvfTv230avsLiygqJgCPFms03ho3DU2/M+Qug?=
 =?us-ascii?Q?Y8EMGWUqfb5BovaUhADwyxt53Q7z0qky29BrKxLawBLJYp7AkOOAjZ0CKsZU?=
 =?us-ascii?Q?d/Di6GV/6XgvhY9QuW1jQ4I/ip3giIFh1RUH5hoscu22IGKdxtJIga2+X06T?=
 =?us-ascii?Q?jTL+yc9lNuNODIjCXFMIxap6+MTLXO1GGW3BDQmFIy26aUKc5Rm/2T8oHE8N?=
 =?us-ascii?Q?yJG8zLX9NKHmmZ58IMkHevT2FPGgsnQELimmdaZmCGDFT543xQGlRM1Po0LL?=
 =?us-ascii?Q?KtwLteqCK+EWZ6wmX7mvvL/srIY7pSY3PKx3aQ7jtWY9c722G4l0VCLLbTCZ?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 660000f3-4544-4780-55cc-08dd785433f9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 17:22:00.2672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT+eIDPZaX8aAjr8NsGGwWWPPVZ69k7uGcyp+cm7uuXifLous3VPtljKVMjyXhZnGSlJ9GVgXWPkdrs13RHdWxmrXkdHrxdRVLcWDsamI3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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

On Thu, Apr 03, 2025 at 04:26:34PM +0200, Michal Wajdeczko wrote:
>Some of the GuC debugfs files require access to the data that is
>not available on the VFs. Don't expose those files on the VF driver.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
>    add hint for developers where to add new files (Lucas)

my review above stands. Thanks

Lucas De Marchi
