Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7086C4828D
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A4810F3ED;
	Sat,  3 Feb 2024 06:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j63b1BDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3431E10F3ED
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Feb 2024 06:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706942866; x=1738478866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YA2oKv6Vs44YHJIMV2irJYF9FPW7K7DYGp+hQLjfi2I=;
 b=j63b1BDqjDAsVeLbIJiA2E3fBj2WIbMVxqYiJxcCKy08+UyeEoRNKMGl
 M2z0P2DYv1JFRHKcrvGTLucYB71To2QYatEf6BdAbHtiofbPRd2OsVLJZ
 viQysjBqwhp+ZAv3c1LYxbvY4aDzQl2ho75koCwURwXf5iONmgWwd3NyC
 kS5//2a4uviaKflpDNM64We2/o+4mPKNsqbdYbpTlVpH8/leNRhs0NHm7
 FfXydUiHBHIm/J7G3eBIi0UeFGq5tarwRH7XGWmpEhnJcUB54FmNRV+7j
 OvPNDPG8IzcuoUFDpeWwqZ1KdgVZYPyBSf12VQplw7V3BGsUV7EK6tL7O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17710314"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; d="scan'208";a="17710314"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="482085"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 22:47:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 22:47:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 22:47:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 22:47:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 22:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJadgqfCN6uU7rwofJUBCTpt2eaIJbMFF1V2+qpnAOlirVFxmvQDfmqNV9C5cym/0bILCx7GaQPJEW31xlRbOhvez1D43EgNAWkweihoyUMiWKSxdtAc4kBx7Zapsgd7MhJN86bnPzKIKoTSkl6ZXj+KYXx55bO+cP0W6vMIVlY4U7rwVk4Ez6lFXz1Oq/nmk2koUcdZ70D6/VJHahiy4Rxv0/omgKj60eQOQ85REa+9WUMl2OKc0WjXkRjeE/fXLIWDL4jzK5N1/O6MkeKAssV4hZ6lK8jJfVnZ3TzZZjujXxVHg4JqhLSP/4Z7a1kUBQ/8dgXA2ogNG4Dz1rTSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA2oKv6Vs44YHJIMV2irJYF9FPW7K7DYGp+hQLjfi2I=;
 b=ogn7FiNIijtlbqSekun5ErSMtoBLJD/iz66YsHcG6LX7xiVDY3Kym+HglM5ENCosExrDOor7sJ4xWmr6THQn8eQweztDHORAmtvs4+VeOHUPK50yOcEO6ivsVtz4XtM1XELWt5qliDWW548/f1aLpETNFZmXiuQg/5GiEgjkQcryeQpA3qzpILdioL8bvnT/UekR2wVkfdHHpv3BvZP4jSlz/zwfWhU5Q0UHlSnDA/yclOxYikHvqqmSFJrhZTgeeFXbCErnBzmAW3D0i+Mtxq9qU2PikzWBSXMTOv8oYvLhxg0AKSz/0pzKEsrnIhGo5dvTczdr4m47UDHR9ecK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Sat, 3 Feb
 2024 06:47:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Sat, 3 Feb 2024
 06:47:41 +0000
Date: Sat, 3 Feb 2024 00:47:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/query: Use kzalloc for drm_xe_query_engines
Message-ID: <7izonvfkejpsvy4x5nmlywtixot7cdwiga3nyai6jzqp2z75ww@oz4iufa4vhdb>
References: <20240131051838.24705-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240131051838.24705-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 66bef89d-f2bb-4471-97b5-08dc248404d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owrZnS1xYaXFTd59yZ1BCCF0XUgllpSeFAweZvOAQpcfledJAATN6Hb6boif6krNEdQCMxEhpFRBZJlQKjMrV2ZY9UKyiBFiP3dACEGdj7ofgFfPy+BRLQsLw8HalOlfeTOSk7J51xgllo/4i4R018QkQrc1AcsetJDYs5qMRWonzD5ZD3ubQa8zwi9Kj0QyLfCB1KU/EXTT9EMgvV3Jv8p9jPZLtG95Ma9v7D0DhrYjy5Eat+BX1oTD0HdRTzYDZlAA1fHxzlKSnxAMHQn3zokPHkhez5nsoNSu7N3ZLa+7+sgQM+kbmvUSGUOxej+t+KQSgk4RDk/XQS+TmCO0CeIzo8uQ2HGFlFb7k3bVZPuDv9LvkY6jJGW/79kq+WGZTDC0t9k6rS5XXvpPa4Z39jG6CV7jrOHfcqv0C/A8kvo8LWbfFDp63E7Ushy0Z4qoH7IftYrDnnEdMrQQUIE5S11bCjWHlkY4v1wRQ9SjDKkSQLsQiWZ6QRWLDDmAbSTX7h1/IlRqUFriAZtWEPXMPzIPN0gOGYRwi/5sBE31OwgIKTUxMGZS8i8j+9Lp6L2B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(6512007)(9686003)(6486002)(86362001)(478600001)(82960400001)(33716001)(26005)(5660300002)(2906002)(66556008)(6636002)(66946007)(316002)(66476007)(4744005)(6506007)(38100700002)(8936002)(4326008)(8676002)(6862004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?udcMMhDpdrcwLsDyJeC/oXJ/o8S1L55LPPOvjkNJzXoiCFtjB5fz7bH+/ZWV?=
 =?us-ascii?Q?3zbSFsU/cylid1yIZ9Znipel1E/NhBMLd1B6AXASX+ervugW9ZaVoSS5XGkk?=
 =?us-ascii?Q?quqYKXp9T6OyTx9KN5OEN1nwN5wInn3J6UU8I94CKgSfEU6AjN1Nif4dE6T/?=
 =?us-ascii?Q?00kg402rzjNQGJGd0JLVgtx3rH41k+UNLTMZC/nzMjU0CSSiZrj+umWXxiAJ?=
 =?us-ascii?Q?eACiFU1/R0FjuC4knF85O6ZmkhbVOPAGw3NoGDagsAG1wKpxSvhWRbmmk5e4?=
 =?us-ascii?Q?qStgYttxypQUuIpcqQZB7L2aNH4mHMCjWpxfoU/X+Dt1KvNByXx1qrzpTy1W?=
 =?us-ascii?Q?IKbEdVq+Dp0h2VOLCNXTyW6tfoBjSlEmxMBurl9w/EeieK6JoYeCwmmvAQ6n?=
 =?us-ascii?Q?Kz2KklY+uP5K8oOXZWmN9qkYx6G+2EJ9VcAW0DKNj0EWrAWMBI2BXGVHiTaS?=
 =?us-ascii?Q?l4EWE1y9AXcXnerzD2aXKQ/fyQCaeB2bmm5DxdCMI0w+CUyuwhEXC7O4LawZ?=
 =?us-ascii?Q?c23/xdNI7doHsk2jP+haovaHIKuH6w3z7sbpGNptGmKCyQ/MSVvIS645I00U?=
 =?us-ascii?Q?Etrx6QqiklxIJO+tBy3CRpQnlnB7d+bEpKhbDwPRrXb/xciGOl9qZY0JjpDI?=
 =?us-ascii?Q?Tb5zbWKvfgMIRRSQwCVB3L7FbpSEhTKyEaDL3r99hvr3b3PNeIfsG4VYzAhD?=
 =?us-ascii?Q?SAUUSRfdum8K7CgJq3GD1eMbkweeVv0SSmzs3qnK/bJ4HJmIllLIjXnrUmve?=
 =?us-ascii?Q?yVOy9A46X+aw/OSsYiX9kzx5I3TruWsY82kKWiC6Groz1reexA4lITTW6nBR?=
 =?us-ascii?Q?fh+FQeRdpctlEMl0y9kizgsxhKP4ByWVlmk60yjmPNLTtltUxjXy2bEb1FUH?=
 =?us-ascii?Q?VPQF0XKOxHSK+Aft5JWdySxVRpMYzGJ7nPuNup3j5LWacLBrYaH/ABzx0M4I?=
 =?us-ascii?Q?I4VCpR7KpbBb19ycQQIo5iTZlhKuYE848M2m4XKwv+3FEOwyCfHkWWAD3slD?=
 =?us-ascii?Q?cFxXwHg5F40n//FQfhngIpKHg+7qSvHgIbG0WJkL8mmBf6JQJ4JmQVS5+BBQ?=
 =?us-ascii?Q?7jpIbyw373Fy6QnyJMXAJSrkzZKmzEHFcXZsK5AJgvHyofI5zVnil1UnUNwY?=
 =?us-ascii?Q?6kOU94QBaXpc7+ajXt34z26Ri0Hhrel96kdZ1iWjWNkPPqFjioCqx5ADi3v1?=
 =?us-ascii?Q?volHo8vig/3p5TIqGcCph6594k3Er03SjfXH9xlidCxCkFjcRFh7Z2mQIB2k?=
 =?us-ascii?Q?DyvIvNHSTpBawZySeJ+ZAB3o5J6kDG5ApoJnOE0Dj3rnA6E6jc/76r0IWy5H?=
 =?us-ascii?Q?b6Rpgb7Ax7bU0AE1Sx8Ha+4kppSYmU+HkCxWaYzyAL6Vb9z71heLtAr9wWj0?=
 =?us-ascii?Q?lsyFKF7UgopZlAYNxCgjDR/qCVqfRt42DbPojVcGIIE+GKrTazwc6VNqZBUv?=
 =?us-ascii?Q?AFATZ50lki+FWAtkY07jIRVUMDzIBib9579XDSdrlf3aWxiPKX4fIx4LBgN8?=
 =?us-ascii?Q?tlpxZCpzBLdjXczZpZ6DKRjFPChhSufmQrKetWWoGROyIzd/ATMwdGszLwj+?=
 =?us-ascii?Q?aB7suAWq0N1cl8a1NWJaaOSAm5h+QqX1Icj5DRDMS2EWMHx8DHuZaeJ+Q/XS?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bef89d-f2bb-4471-97b5-08dc248404d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2024 06:47:41.6060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfVnUUDyKRqjMzTO0vnhP84vyg1QdhrflDljE+gYQx+TpwZXfZCOQWjv8i3B4RuHpDuuLi8UiPIzH/Wmvp9Z0yg0UV+Kw5Ai6JOmELrok9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
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

On Wed, Jan 31, 2024 at 06:18:38AM +0100, Nirmoy Das wrote:
>Use kzalloc like other routines for better consistency.
>
>v2: Improve the subject(Matt)
>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

applied to drm-xe-next, thanks

Lucas De Marchi
