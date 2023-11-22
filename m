Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB51FC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 16:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876B710E678;
	Wed, 22 Nov 2023 16:11:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881B910E678
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700669505; x=1732205505;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=/mtLrXHtOtooDrBRi7AD7kEMitMCJUl4wxo5QXgNWTA=;
 b=gCxg6yKL1RBeCYCLI+dJw9+IoqbCiUGn3CFeKj9C+hr6lY1FnJT3bRWL
 h/dk7wuOAkLDRqxT31T2+StYeoimRT4kKYxZ5hvB0jgePx7OFCH/hkLLT
 jIgbtFjaD8NPXloNUpygkTiyc7XXT67qixaMKI+Fn6ZVv2JzJxlbZb5Uu
 FR5Np3C8jbnl/18C0l3fyJoikmHwT653qcrBzReFjlKDqxnEApkalUqiJ
 RCD90uMUJZJhqyNLOqngy13DMFNe6sQmrQq0ACbqh1O1Wucdfz2dpncN/
 w/NAzbQ0dRv3i7laOt4LVhocp6sxzCJ1+lLjnR4yJXZaQwd96W46BWQTw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458581988"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="458581988"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 08:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098480229"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098480229"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 08:11:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 08:11:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 08:11:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 08:11:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gr0j2O0/NtZaLg2ouAppB5DWXIIM6DK8/JNbVGlzqua/POUoeCK/8tEsjsr6lcdRKt3mNu8SOwlSrqD1cPt3ARhF0r+KImJ9ZtfoL7mcj44hIMFS6SH3jYgBRRLgFegiOooVSJ6rTBt4ewy31KTSwMI2gVfXDa7uZlck6qdRZ5WwbffUAX5ZWinnWkzn4vCqaql5/ZFfi/DsCFe+4T5U9b5aVW9agDwkace2sKjnS1XCV/TOiw50o9cH7uv02EKY3WvNWkHYlhAiscz10+LzL6aTN3GDnggDdHX80zSDIuFjoeTuGDDXK9c1jGNakkH7xxMZnjgx3JUFGdKa7c7qwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp08q9aVO5pgd1yWi/W9JjpVLA6qcyiHq+FFd4tLDlE=;
 b=G9kGtRJ4ieSDy8+DodqiLQ2NVIgbo6uvBtuCvYQxcx9daw7r91grS5CHM1SwKbcsfWRCcn+/K5x1bReiOLo98rjyZuBs8gDOKC3jaxKh/XLIhO/REJYhZb+ERKdwpImwe54SAbb7ym+d0lLKMlFWw9afbKqcaETseaowp3x3e3FILabDwSPHoyeHXY7POcmVR7hC5+E38MZ9ff3QEWkT4JoOTl0GRrHO09pCy9aK0EjxnrGWxvj+wxPFr5rzRMbW8ngp3FkKycoh0FdjCzpw44VLpd6mcB5S5SeoDjtL7Fxh0WGyQmTRE40YXIZpSX3aBjGPVgOorp/RtGw+S7CMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 16:11:37 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6%7]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 16:11:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231116214000.70573-1-gustavo.sousa@intel.com>
References: <20231116214000.70573-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 22 Nov 2023 13:11:31 -0300
Message-ID: <170066949116.1549.18160079450360303713@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a794c38-fb1f-4c59-b671-08dbeb75b3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: msCDo1SCtiUE2Tdw29Bl5eXJKT0wbMu6/OXxiATeBF02viMRrpmxulV2I4ir4LiKVx86irDQjUXSXvrsVmfaSA3UKJZYmi7Rj59DXkU6x1CzCZCxXWGA0FICl8BdQQvDKKAT+8Mm4nqIYFOtD0hESuehcAbi4Y6R/sJff0ywQAd5iuohqwUlF3yqZwo33EW/0oqwhYPZJO/kvBEu0VyzOmel3UM9dtN3V7tF6zZ+Ma5ovdeybLj8VoXRC6KivBmDY0XSasSqTG5lSFeSNL029UzKd48W01Cma1EUw/mROxFd0GVYoiE+oUVvbkQYFQG8Lvc3bjI3FudyXBj7x1wETdHvrYzN0ltHJUwKHRwHXwC3gXkaKH2yBWEPnUHwBDVT8mWlSEo4MCMhtKzAWnq8a82oKu5s/BDTLqkTCFOOcjPBO235Wo33IA3XeAY6by3aGg5aY6uk94kk7ur3AfDwdE0BazSn1Pnb+R47uLASRuY1cKT7XrR2b7BJ3PF7ZPj72WSvI0TP3c0bk3J6J7wq736kVgqulAvI1OH6f3KCA/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(33716001)(107886003)(6512007)(38100700002)(4326008)(8676002)(8936002)(478600001)(2906002)(44832011)(4001150100001)(41300700001)(5660300002)(6916009)(6506007)(6486002)(966005)(66476007)(316002)(54906003)(83380400001)(66946007)(6666004)(66556008)(9686003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmVwS3RGbWhjQ1NaOHdIN2JML2NFRDFSQlE5WE1QMXdVQnYzbjA1T2FYV3FZ?=
 =?utf-8?B?b012Y3d0aUR4TmlacGd0RFFqb2VJSlJSbmdqczZRbzhPQjZ5dlh0eGdJV2Mv?=
 =?utf-8?B?YTZyM3Z5ZEdXMVlGRDF6VkRiRkpBby9kMklPZnhkUmRQRXpPd3hJUVBQVFYw?=
 =?utf-8?B?TFZLZXdJQWo1U2dlcG9maWpaQ3RtTm9WT1ZKSXlXUVVnZ2d2bTQ4U25zaXpD?=
 =?utf-8?B?M25WWkRJaGlIYUlBUEtoZnBlRmxnWTQ1UHM1alZJR0VhckFRT1hGY1VmUmlh?=
 =?utf-8?B?dndTd0JITVBxTlhzenJ1SDUyMzZYaGhkUm5BVE1kSTJzTEs2RVlhSkpFTlNo?=
 =?utf-8?B?cXBVSyt5VGNWK1piQ2dLekZvUXFuTGlPSzBuYmd2bFlTZG0yYUJLMjNrbGIv?=
 =?utf-8?B?SFR5dnhRb241dVUyalZiTS81WGltdnZBZWp2NzRRTGY5dkkzR2R6K00rRk1w?=
 =?utf-8?B?TWxvaGl2K2l5T1RFSTZSMDN0QlVNMU5oKzdEdW4vVEhHUU1oN3Q2Z3orMXV3?=
 =?utf-8?B?bG9aa3JtQUcxSmRCbHhoeC9NU3BhNGpYQmhDNHl4dU52VC9RNkdoZUdQQXNK?=
 =?utf-8?B?QWZpc1A1WUI2dldEQWtJQ3JiMEVJaVpsbndJNElheEtQdDBrbmRMN0lrM3hk?=
 =?utf-8?B?WE5qblVCaXQyMUhZVnAvUDNJT05xSVljeE5rY2hDUGRwN2lScVNUNDdHNHNB?=
 =?utf-8?B?MUxZWUdDNEhibngrUkxmNGQwSHpEQ0ZpOWRvd3N0OXFRc0p6bDdqQWFidGRh?=
 =?utf-8?B?ckxKYitBcHA1dTRLYlplYkQvVVNHc3orSE5kT0dScGhXUkpIUnYzUWIyeWNm?=
 =?utf-8?B?czNzNmFtUFBTL3B4a0RSWDdGbFExV0Nqenkwa2xzTU5aMEVsZVVPNXBNMFIz?=
 =?utf-8?B?QlhUUnpMNnVrcHFaY21rMjQ3ZGNaK3RHdU13TnMwRjJYNXlMUVJ6Q28wc1A3?=
 =?utf-8?B?RVlGa29xQ3JqNFk2RGhCTVJVaDJFUVNBWndKbmJ4RDhINUU4QXFBd01GQ1NF?=
 =?utf-8?B?OVBrM3crQmJpK0N1a2tSZDdWZmVVL2gyQnJGSkpRZGxHemt2UUZyK0VBS290?=
 =?utf-8?B?ZE9ybUdqMHF6cUJJdGV1RTFscGY4ZjdZdTZ1akE2MTF1TFMvc3NseVhzaHdI?=
 =?utf-8?B?c1VSaFFqZTVIZ2dFRTVjcDJ4RXk5Q1hpOHRuc0N0VmREREZTb1ZpSGRrMFNy?=
 =?utf-8?B?ZFRZTHNMQVRDYTI5Y2VLY2tUZWN1endTZ3lTZ3hyOUJqWnJTcU9PUlhXYWYr?=
 =?utf-8?B?dnVrSU5HOVB5ZjY3a1RJcUtyYXR3K3BjaGQ3QXlMZ3dEeDhlTlA5K25QcktV?=
 =?utf-8?B?bTZDdVdNcHRSaHY0VU1QTis2bm9qbjJxamNWZ1RZZE80Y0FNODA1Y2ExR2xW?=
 =?utf-8?B?YzRtejhLNW9oVTMrVTk0alRaelNWYUpBMnRhdUlqcjdjV2NtN3cydnV6Ujc5?=
 =?utf-8?B?Qi80dkYwZ3BLN1VqdGJLM2t1VUJIcGFrK204aFdkZGRqZkFUYk1Kc3hrbkd1?=
 =?utf-8?B?WnFuWjRQQk9HOXRudFhwQW5JVGRaNVZFdnJzS2UzZjIxM0lTZGJhM1NpWDFy?=
 =?utf-8?B?dkRLQ0FoaDBWNXBFTUVNZXA4MEh6ZTdqSFVhWlBPa2FxTitXS01iOVZkTWli?=
 =?utf-8?B?dUhiR3NKVFRoVitBSVBYalU5aUtSR1p3ZnVuWlZrRjFwL1FUTmE5bmlCaGdR?=
 =?utf-8?B?LzZTQktYZGZFQVRySGFLSmdrUWgwcWIwaDEweTNndmlJVDljZ1NqaU5OR1dL?=
 =?utf-8?B?elljeFF4ZDBCVnZjdWRNYTJXc3VLMS9xY2VCaGV2RExLNnVqL1ZoRUVxK2tX?=
 =?utf-8?B?SWZ5RzBwRTZ1WjRMN1VuK0UwZ1YvMW5Gak8wdzdUYzFtQnRJckZaZWR4dkNh?=
 =?utf-8?B?OUdHL04rK1J2UE0wK0lNcWUwUCtPb3JZUHBmamxUQ0UvdUpHa3R5Z0swenEz?=
 =?utf-8?B?aHNiUnhzWHQwdXN0RmxSL2dhQXQxNTQzMndPeEQrb0g1OVpZRE9jdWY3T0J5?=
 =?utf-8?B?bk1NK1VCMlpFaG1Ed0hEVlQ5Zm9UbDlNMGVPMWRzdnBLRzlmYUtad3ZldXhI?=
 =?utf-8?B?Q3ZVY2JMeGF4YSs5dS9lUm1ZSko2WXZQUzlMTzBjWWI2OTAyUFQwQnQwVWx6?=
 =?utf-8?B?SVFrOWxHWUJJdXhNTUpJVVlIZ2hKWm5WSTJEeWFTelFEeVdQSFdGSXd5TjdR?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a794c38-fb1f-4c59-b671-08dbeb75b3e6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:11:36.7081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAf9z1UOWRH7noe8K6GY+/ll+Ev0u2YL0CIpPsvZdk12k1dvKiFW9RVJwEuCMCnGqs8oYAl///32dkvKCJXLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/2] drm/xe/mmio: Make xe_mmio_wait32()
 aware of interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-11-16 18:39:58-03:00)
>The current implementation of xe_mmio_wait32() is susceptible to
>preemption/interrupts causing false timeouts. This series proposes a fix
>for that.
>
>Changes in v2:
> - Add a patch moving xe_mmio_wait32() to xe_mmio.c
> - Use a barrier()-free implementation.
>
>Changes in v3:
> - Tweak documentation for @timeout_us.
> - Add note in the commit message to better justify the move of
>   xe_mmio_wait32() to xe_mmio.c.

CI results for this are avaiable at https://patchwork.freedesktop.org/serie=
s/126428/#rev6

There are no regressions seen in BAT results.

Pushed to drm-xe-next. Thanks Lucas and Rodrigo for the review!

--
Gustavo Sousa

>
>Gustavo Sousa (2):
>  drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
>  drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts
>
> drivers/gpu/drm/xe/xe_mmio.c | 60 ++++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mmio.h | 39 ++---------------------
> 2 files changed, 62 insertions(+), 37 deletions(-)
>
>--=20
>2.42.0
>
