Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390A4CEB2C2
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 22:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF00D10E0DF;
	Mon, 30 Sep 2024 22:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbzQrMof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C926D10E0DF
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 22:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727734449; x=1759270449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XHc0XThFmvXFAKxKTamz66sQc+YFYEo2+8/WmCqG8VI=;
 b=SbzQrMofU1GCWNyxzkyUy2+eGnxqbR9Mjo53a9x/NufTVWj48P8LsMQj
 sPyCsj1AyC2q3tdHmW5P3R7381WUH+5Rv5hC1MFSYk45PbOQVzxIVY7th
 0niSE3qApZ1Dc9q60f1Sd/1GVVT7Nfs/N1nbeSUDsBZsc/qstRxQpgrXm
 AwoeIRWWXNoiGW3XdUq1ThuUQqvqU5Zy198pj/3VwJ2vM7YCVa0w0cEGm
 VSbe5sD7SAbjMbjwFoyG3K98eFJ9MwU+Eh8SS/91iLiXr62eX6ZwOGq8r
 2hxtG3QuAi3HktpgJJt+C32BHLAgijsu5u11cQFCzxWvDULFDPWwHYvj3 w==;
X-CSE-ConnectionGUID: ZZrVTDM8QzaTlESOYTdnBA==
X-CSE-MsgGUID: 6p6cBLdLQxu2HYK3D+BShA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44307180"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="44307180"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 15:14:00 -0700
X-CSE-ConnectionGUID: kwH2iutBSuinLBHTyGonlw==
X-CSE-MsgGUID: DYgLwcOgTsyjSufEOpxJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="78297800"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 15:14:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 15:13:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 15:13:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 15:13:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 15:13:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khQP6nI7Wo8ihCfUAI8rkbwou02apwjuo/790lOfOsl/PHN1TpXvR+E0MeXLy/Awx4GYJnWwA/0mQTCcXSdI8nJD7PO8cVRCOlidghaRevSKiIYutm0p7L3wocMkHsiXvzhHVox7ndCkoVMz8nAiILndN2bmyFzfyLoXTwzmCPq499TKJ2LNGHi+JYlDR0h8Qekx7qcsAueDQCjl4RybR3JqfOMFlf1+1q/EhHpDdKZHXlbpx3d7s6112SEYUuMsez1bcgWcWXdO/n1Xe56vga/L21H3GqcoqWLJoItErc3W0POXS/2hZEbZuW+uKbQ5EUhxKO6OnKBAOv5gtTlc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE6x2J1cAghIIMdjq6AjDlQoriWOKu5fTlpCfl7sZxs=;
 b=Gq86xFLDUrxk7UCrwopCe+KeOgcdo1BpIcN4UPs7GaxSjdrtk1dKAhiRqGv+VynqyZ7kMjMCQmY4L8g8Xld1z28oqDoLzEqzpRsfOgDjUH/9BcxoYNK/S9Z1scGLMGDW4waEnrn3j867Ch5/dkFy9g52uzrczbCMzxEwCWGUqtHYFPFBkdmJjTYrzpXSmMcH6DnZ9q8sNfU/iCqC1eYAsWsUNa15Gap0p3oorsjcSuIKyxft0LpwJk4vh7+jYaPddN85ZhT7Vq4dXtC+gSzC46gHSkKVkg6/koiB+67agtFCq6A8R/1YAorZrvAx+cYvAUy/AjRstzsBgrZQyhTNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 22:13:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 22:13:56 +0000
Date: Mon, 30 Sep 2024 15:13:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 04/25] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
Message-ID: <20240930221352.GD5725@mdroper-desk1.amr.corp.intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240930053149.1246339-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cffd86-07e9-4a60-9694-08dce19d2ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UI7sIAgmvN2UqSNVw4QJFKQlfreZqBaf6g2l1oNF/P9pwMip8x5xGQDoYOUi?=
 =?us-ascii?Q?tEMcK89sPjlQd3Bg1K9zdU4Y9w+CEuxIthybVxr/15TaxZoAbf4Yps2WvCJI?=
 =?us-ascii?Q?uBTw438qQ3aBXhR+s8vzfkbQa+FcoDQgyk6mqpeYmn2whtymHvb7GKlkIG96?=
 =?us-ascii?Q?uvSe0cGxIBTrqGdketVSDwT/FRYXVH6pz04DhnSzH/34MlUJOaYX25jkp9TJ?=
 =?us-ascii?Q?j9hpmLxkhb4eDhiAYwYi4JeJtO6vDZdkJAyh4XwgiB0vFhQtqT6xO2VRA0Re?=
 =?us-ascii?Q?gfFC3ZLmE24LquJlovbToSZgGx1cB58lTSgmzqLenV6IZsshgcme9cqKtA/Y?=
 =?us-ascii?Q?kP0EN22QVhwl3tOenHQSaxxkpbMxX3C7dqovxXGcQL8YRIcXv4uJjll8jLK5?=
 =?us-ascii?Q?0EoLqCjZp/MrWi3iDhp3Gx4mc4japUzoBHmk+/xrUvQtj8CXem+aNyY9si7T?=
 =?us-ascii?Q?E/Yw4SRNhbgmN68L+JYfITUuCZxjb6tu5V/1VwWeSD48GyADiRxueQHuNSdg?=
 =?us-ascii?Q?5AzWZVTHCq/c6Zoq+S55g2/h6ZxQkig1fiKLC7Uu9RGauff/+4L5r3k/3JsW?=
 =?us-ascii?Q?5ocDNVN1n/vY8r/eWmRyWC3r74mX+8e71ERxtukeKGxui8RYWBc+56uUnYuA?=
 =?us-ascii?Q?JbCNmf8P3lLLXIqUc24Daz5KxZcC3jZ6E/1FPG/p7HN5LcXILqfxeB1GJKEh?=
 =?us-ascii?Q?2bRCKf+YDUwAI0TY2Upp+PErvQsC+YHM4OtGyRJ5uRqoYC/UkuB6BMhVWqam?=
 =?us-ascii?Q?AJvvBnAaTmPSoLA3PQ9G5KC7GPKwT1tE4Vw+shp2ZTKdzaDbZioR8WOLXq98?=
 =?us-ascii?Q?+j5vpAYZrTW4nO20B/x7z7gNR0h3Lcxl32EA1ijKbZdawlVrX0ePpZZNqzx2?=
 =?us-ascii?Q?0yH4ivihd/Tebk7HOTFBX6840GJFw96wqB8S5oqctUNoYIu9ujwkh780go1j?=
 =?us-ascii?Q?CMo/57TWa6qO2ThxV0anoGI1JYqFKLl3W0/cTBYLp+7aYX5989KLy7eFecBm?=
 =?us-ascii?Q?xFaN6AmCVXupzjemGKNZ/4iOerZ+FCDC+BgJOeHW/3/MAeIU4LM/qUsL91Cl?=
 =?us-ascii?Q?KqoiFEG+RJrpD7gOjjjKxt+4uowh2ddtoH7jfLjAM74KGczUf2/pXmvnQoYO?=
 =?us-ascii?Q?am/CfNWEPCYA5b43tp5QTRjpPskT9cgnqZ2AZAl++Shq6gnpwSt826UZMcyP?=
 =?us-ascii?Q?AqUWAEUJX/8PLKDHZRoqHpihQGW56b1yb7DqQWgq3aqZwbxFCscZinuvTCYG?=
 =?us-ascii?Q?qrDVOwJbwgWSmULo8XVuU2DfBMV31Vlq9XPA+Gks4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFMcVV3XkA+S9/vSXtvbDVCoXKUkpPzqXSYo+tdACch9e1IZ3RV3TJg+qKkX?=
 =?us-ascii?Q?+/b4tNKaHLFzmgdovJaRtFHmKAhjlzYFIUG0QL0uV6wkffRKlwGFfNnPae1m?=
 =?us-ascii?Q?Ja/UZRluscttAgyDnLBVYl5lFVCmUaUUiAtYkfPPx1U3gSgmOw0pC5kOiVvh?=
 =?us-ascii?Q?So3gHMWF1b1Sadc4cO1w/USsaHpvjVIYdjF1n7moJ8OgV1TtSLuhQNI2ULa+?=
 =?us-ascii?Q?v44uW/708WAUl8SI8Yz4jLohQiiF11EVifIqZu235Keglil3NDNZWc3cSBYw?=
 =?us-ascii?Q?1pFXKeuLQTXUtb7CBtetAe328K5ax9nDOpe6hBSYSb7JgYrwuJNkeDMOQquv?=
 =?us-ascii?Q?1Wso/cOs5EQoI5nmE4AM5PqHzfVn1Q4FVHeJbi0S/+B7W/vp2LNgeT8JvrJk?=
 =?us-ascii?Q?sVsGUS1vzdXICtxAirdSdmPt7EeiQbXGZdrUh28MwVBxJGQzz0nTY/K2ehkf?=
 =?us-ascii?Q?IxjsRjxfNw2rWwc9XNr/N3UQVv15ERmtSOYKIrmZoG1+6xW+FIj5WjPdII+/?=
 =?us-ascii?Q?9T5LB2rbDaUNUbIRKQhobNWY0efxapjdCUqYTRljrRzQSALJ3+gxH2G0BaUW?=
 =?us-ascii?Q?x1pMhJ/nlqdML7KDS1CAdhm8fdzSHuui0/naGfjUls27KUqrlvNRdFpHdIlh?=
 =?us-ascii?Q?HNdJ7oAz1TgtMCIlJ6JtOUUFl4Wevl9lAjQhlPuByHLFDSStZgSXgvKPhFZc?=
 =?us-ascii?Q?3CTrzmVThRNRnxMB6T/cadp1vBWza9N3IwG8br79uWchBNXGamzxG7F2qSb0?=
 =?us-ascii?Q?VbUaxPY5g29dS2e/zjBnkGQdhwBCQ53eZi9qYtSUbbgtL0/VktwNXUSmp/5x?=
 =?us-ascii?Q?3EugNeNDYkyHU5JMJ918fY+8nWjNGr83o9bM4VhiTseUbwqsC8dE6xTsonNr?=
 =?us-ascii?Q?xnKIeJbAkA38pDYkWPOV8hTYyLDY6WH2wtClczWLpr+4Dd9aPK7t2Ub5L4mg?=
 =?us-ascii?Q?TKtOq1DW8rNSgvVZ9d6wSehQHcMf/CH+0HrROcC4U+kZv9wdi/njzWc5hljZ?=
 =?us-ascii?Q?tjatpGcodH7GNhz0Fxw3Ji0xtVXbxqGbO8Hbxhyc1BnFfNbPSKFGARd0FVc4?=
 =?us-ascii?Q?wUMwJuUunQDE4TifAmQl/+9LgSMPiwj/ktdZUnGeYc2gDNEcF5xBoRf9Rrlx?=
 =?us-ascii?Q?ZQ5+JaKk3MZYpsNgwW0ESuYWifpN/wsU13by1h8OZufKfUKZws6iyLyhpy6I?=
 =?us-ascii?Q?SiQGbt5sfiyiJWLcQ9gbGaptNZmjK5vzE1ZnyKD85v6HIsuUyCyzhXH2Ub+F?=
 =?us-ascii?Q?00HVkgJRanVnxjdJkO5t0cyoPPFxKf++whVMVQqv+Ki9wiMbYb6XLyKMIqXT?=
 =?us-ascii?Q?Si8TeLk+mymuyobcC6P1Ps6y6VuPw0C8Ku0ZCsXX8cEO+GKmLMsrnmBocmKI?=
 =?us-ascii?Q?84Cv4h3Yp4ZqmSxVKDvM7covipun1HSlDWUWLJCwPczcHzkxn14e2/VZXXfq?=
 =?us-ascii?Q?4CiUKb2tGLPqpG1pATyWA9Amx+Zwk6kQqFfDX5d/08tI7h3O7CbTTXnVUfbB?=
 =?us-ascii?Q?6vswm5SJRf6xVQKMou11RFkTU2HC4OU1pqU34j6CWcnEUE2rlhK5hk3krjQ9?=
 =?us-ascii?Q?IM57BIcv2uYdG9bRgAspyUIpe3b63RqhMIdkVr9uNfdgfMOYCSEoxHCHp9WB?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cffd86-07e9-4a60-9694-08dce19d2ce4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 22:13:56.0668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0ZZBDV6cfDYTRS8satlldk3yZBuXE8/HZiHzcgbHcM/VSaCMtz5BNY6f2fJupVfsDJlQBpKDKx7KWjQ0l2Dfe8MXHm00nnMzb+tDV5KTpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
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

On Mon, Sep 30, 2024 at 11:01:28AM +0530, Himal Prasad Ghimiray wrote:
> Instead of calling xe_force_wake_put on all domains that were input to
> xe_force_wake_get, call _put only on the domains whose reference counts
> were successfully incremented by the _get call. Since the return value
> of _get can be a mask that does not match any specific value in the enum
> xe_force_wake_domains, change the input parameter of _put to unsigned int.
> 
> v3
> - Move WARN to this patch (Badal)
> - use xe_gt_WARN instead of XE_WARN (Michal)
> - Stop using xe_force_wake_domains for non enum values.
> - Remove kernel-doc from this patch (Badal)
> 
> -v5
> - Fix global awake_domain
> 
> -v6
> - put all initialized domains in case of FORCEWAKE_ALL.
> - Modify ret variable name (Michal)
> - Modify input var name (Michal)
> - Modify commit message and warn (Badal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 28 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>  2 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 7f358e42c5d4..372ea43b0d06 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -211,26 +211,40 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>  }
>  
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +		      unsigned int fw_ref)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, sleep = 0;
> +	unsigned int tmp, sleep = 0;
>  	unsigned long flags;
> -	int ret = 0;
> +	int ack_fail = 0;
> +
> +	/*
> +	 * Avoid unnecessary lock and unlock when the function is called
> +	 * in error path of individual domains.
> +	 */
> +	if (!fw_ref)
> +		return 0;
> +
> +	if (fw_ref == XE_FORCEWAKE_ALL)
> +		fw_ref = fw->initialized_domains;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>  		if (!--domain->ref) {
>  			sleep |= BIT(domain->id);
>  			domain_sleep(gt, domain);
>  		}
>  	}
>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		ret |= domain_sleep_wait(gt, domain);
> +		if (domain_sleep_wait(gt, domain) == 0)

One of the long-standing bugs with Xe's forcewake implementation is that
we shouldn't be waiting in the 'put' function at all.  The idea is that
the driver is supposed to just submit a request to sleep and then move
on; the hardware will actually go to sleep asynchronously and it's
perfectly expected for that to not happen immediately when we request
it.  Waiting here adds an unnecessary delay and slows down the whole
system.  We probably/hopefully don't wake/sleep forcewake often enough
in the Xe driver for this to cause a major user-noticeable performance
impact, but the current synchronous sleep is definitely not the intended
design or what we want going forward.

What we actually need to do is drop the wait here and add a check+wait
at the beginning of the 'get' function to ensure that any previously
submitted sleeps have actually completed before we start the next wake.
Usually they will have already completed while the driver was doing
other work, so there will be no extra artificial delays added as we have
today.


Matt

> +			fw->awake_domains &= ~BIT(domain->id);
> +		else
> +			ack_fail |= BIT(domain->id);
>  	}
> -	fw->awake_domains &= ~sleep;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> -	return ret;
> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
> +		   str_plural(hweight_long(ack_fail)), ack_fail);
> +	return ack_fail;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index eb638128952d..b5a75544d86a 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>  unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>  			       enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +		      unsigned int fw_ref);
>  
>  static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
