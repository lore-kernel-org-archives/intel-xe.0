Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC146C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01AC10E3CD;
	Fri, 17 Mar 2023 15:45:13 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A03010E3CA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679067912; x=1710603912;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U0YlWPZVGjENRt7/wfU6Be2BVhcyHFqDQxDAjniqH0I=;
 b=V340wBvSoNEO57tAVBop5HLO8CYfC0PCUCup1/qjNBitiYrhlFZJantW
 1OQ8rpF73UhZUV1qR+JYdSnX8/EerOLd/5rFMNbhZ97lgLzjEX31+fQ88
 nmP8MxxU/ArWXCZCUEpQLNUI4XqpP/e7jO2xv06GEdh6F+zd9nc0zeut7
 sJw0Ergbccnp+UbfT980tnzDBiqfOC7V8P/wi/c4M34rahhS/dkJpnxQk
 z0MklDBfPyU9Fl4YDbg1m4RhmHPNww2xwHMEjRkcwtWfzgNlKK4v1Hf3p
 ibnRwfwyoMiwW3td+1IFA0BcMkankQ3T16APd0ccaAPudW+rZoImKAKwp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="336990368"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="336990368"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009663648"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="1009663648"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 17 Mar 2023 08:45:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 08:45:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 08:45:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 08:45:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 08:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OalkouU3BviHAvvT6SEziHwGOJ+2JvAKMy5EQ0csQzFvJbndOJGfLQ5qSbayiNhbqyVYJ2+XC+F0g9pCI1CBl4tzC5HNuH5jsZ0G13cVjzb41H43WrIF7AM4b9I7FRNYyxFt9ffO2x1o0fs5FfGtS3Tum0d9bn8q6ZO9/Z0zDGcht4DLoniyNdPaLAv2xs02R+x42PC/d9dmpm3C9foMNNhVv5UKazSwX3B5QN+S/CB6zNK4Nm+amC0FT8WxMmO9TBocVF6w5doozgVCAnI3MHKwRdJlgNAaSeG1UdSlh2acupYc2hArxVGm1iAjVnugSKjW2aK3QICPSai/9lXDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0YlWPZVGjENRt7/wfU6Be2BVhcyHFqDQxDAjniqH0I=;
 b=Mq3nI9dQCUKrDbgegTf/KjRL70UFxUtXQfYdLvKXilrQciHcVdN+iTt3W1aS23dGh6kup2DJGJfCugHHzlg3J0HHscbeg99Jn6nBbSG+sSgRPoJ+HuE/tnTwNaHfuVTnBDpbbh6Fu+EUaT8Re0EI0bHlBpvtn0lpwChGf1lgT3Ntm0grkIbOeNT56kzmI2vyJjSIHX6jQoXG4UNXHfqiHlkIgy+/VByEZ5FY4TdPMYw+CFqiU8OVb2fOyDyBR/r9Y5ic+TBG1Nv93tZlojVj4oQDeUevYKgVYkLnYmStpeM6aE/8O2RmVir9gum0pi2IGGnRk17zWRlqCZLlTjlAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 15:45:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 15:45:09 +0000
Date: Fri, 17 Mar 2023 08:45:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230317154503.ckbb64gbcxwhzouk@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230317062213.225989-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230317062213.225989-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR07CA0100.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd7fad4-2d1b-49a6-b224-08db26fe9658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdo7ZCAyIMgO7vTOvHWuXXlXhe0LSggxKuaICp4bJS3hlHeJ10M+loYUHUbcZVrPnEao52hYwwvPIKZBBakGC/S3UlfKKv80m9V8OYjtImeOuFTvA5LJ3Dihywu1oANOgGAPt8a+dmywExIUp55msCIf9fvUr+S6wDCF4/oZIDvLO61hleS0aThVuv5Q2dZW19OukNqxyEwB7+6rmSYJVzTK1KjOtKyZIedgyn75AD7rH8ReeHhutKANA1JygO0pOqfoeeytFKJlx0tq2PqIgjzZivQpFXECYpb9ZlxUC0+mJ76Wckv1EKmFrau6sGypzmanrP8tkJxA02AhZdj6JEkOqshyEFs1CcK+dGH6J2UhPs3T3BIGzIaxz/qQXz8qeDYxb+JhVjf1N8rqc3CgcDrFAY3yMjFwy4LkIeJWzFTA4K/SNJKkJt6yV2wfMX9JIxjzyBcV7mb/xtgySUJ5BuYentktRJWdByq/LgIKxWHoUrLSM8YLo8jHKXNMGgYrnsgPF9+MHv3WPB7YahmUxAShX5DhWJnb8AsoLaDs6ZOWXGCqE8pwPox13RYup3pwOz8Zqr12hy/97cPo9Fek4RcK+FV8o8nD2dBMPuBtRtm0uRZK+tPEJgRHn11UmoCqO2st1KkwDWus+kOYOMuIFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199018)(83380400001)(6486002)(186003)(6512007)(6666004)(2906002)(26005)(6506007)(1076003)(41300700001)(82960400001)(66556008)(316002)(38100700002)(66946007)(8676002)(66476007)(4326008)(478600001)(86362001)(5660300002)(4744005)(6862004)(8936002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JuraRkfFtWI2ZUcZkk0BaNeo/s9Vdwg5wu8iL0b+nhkuu8AYQlMwPUfSmps+?=
 =?us-ascii?Q?s6w56xyEUTPgEX0IzVK/6NrcBozP854Jb47pu/UQ1k8WgFMcwxkgdFuM6CwB?=
 =?us-ascii?Q?Eq3xFkokMbA8tV0GJXr2ZU30oqwvdsrBxiIfACrreORg+pB8O5sXx2egh2f3?=
 =?us-ascii?Q?tfu98fKKiroHhzw1cacnlXNGeFi6e58+RCqM7wGVMkH46BbU2UHPkq7vLUAo?=
 =?us-ascii?Q?eOPO9fHfxK6e8BlGDlLiF0hGyRcogwRvnOu6I6Tk7LjBune1++t8OkcfWkvy?=
 =?us-ascii?Q?X6RAPLIyv1HOGTDIpfs0H/GSqEnNH1YPyI+MTMeUlUNShlfAE+77O/PbGm+N?=
 =?us-ascii?Q?SfQDybE828s775xRNYzhrJGKrCN0NTp1FsbeHCh4E4z3Jw9Of+ZvxZywwQvU?=
 =?us-ascii?Q?k68zRcsq7eKUoLrwh7450mvRJIRyiyLrOdoTlmucDrF91XV4HrZjIRB+I4gW?=
 =?us-ascii?Q?NimBbZTrcUbsHf/XkFTtVcA3C6QvHzaFV96PnKLoTnZbkl5la4+ov2KbevRh?=
 =?us-ascii?Q?zRPsoJKTHv0OsMJvLRC3jtPGEoprsa/oGuEmIb+r2qELSHKS9XXVQtrF/qum?=
 =?us-ascii?Q?c4fOD7V53Hg+Uh2PA1y40Aoz0Pqh1zhleCeTroPFHaDObsQckJmQFV6FtrTF?=
 =?us-ascii?Q?bcmrf64q/qLgzkZVvzqJE113S9ZPb7UeFN9rxN01eZBpoVJx6Doyk2/yjE3U?=
 =?us-ascii?Q?PjN70lytkvqnfFPxboI2qq6vIB7ACO397kKQ3ufFrSUUyINVicZyvCwt7b21?=
 =?us-ascii?Q?W9jIqO1D1TqX5FEovH4e7W+wrev4/d+XYhgltOrjPrAm6cI5TZMi7NaJzNsF?=
 =?us-ascii?Q?SWp6ox/kHOITjwdrKfdulcbrmNn3viV+CV+qL578Q5spdIzD+WRr0JAfRexC?=
 =?us-ascii?Q?FbWBIYZgjlQktriHJF31LTI78JTUhsOdBdDbMqipPwD+emdN+Kvn5GBp3jtj?=
 =?us-ascii?Q?Y52SZzlYlTTopP1JF3ZE1rWWAopzCSroHisNfFGS4wmXS7GoZH6ok8v5S+w3?=
 =?us-ascii?Q?6fRAsxr2x/57+YvveFbKeohWFr8P0ioUwvcHnW6L+erlMMacV/tPdUUi76E6?=
 =?us-ascii?Q?frTAF6A63rhozgdCWEKwszqp+doPabVo34B00EEFXHVxivvZa+EmJd8hjipj?=
 =?us-ascii?Q?c/aOYEQxKuwT+pmsgbKBrjGYDov+E+BdwXuzOY8jU0S6yHTBqoMkt0lGhvEE?=
 =?us-ascii?Q?D+i8idXwZChwh/VmII5wuAVUASqySWePSQWVz9XG4eBfwsxt//o62XuwxSXV?=
 =?us-ascii?Q?lAN3XmdkQKeVKaPBOwsy5OK1Kb/sjXLv1g7/NoPTPmH0aIVIlD0lh/U7osAm?=
 =?us-ascii?Q?jD4xFeEz49Bsm+wtVUgA7vidCeYMx6lmtG4yuBtUNsSBfYmXmq5Zx/f4SV/H?=
 =?us-ascii?Q?/KEq3W/oGHowRtsbOsgT9sG89x3XeiFw9BpaJdttkMLL2IoJUeQucYCb322L?=
 =?us-ascii?Q?iBRgKsy6hb1I+Y4EVNh9GJ3S1V3T4C1r/MvxYAiu7HUR/wqDpsmmHFrQsZkp?=
 =?us-ascii?Q?/k6MUSYga2cFfMhmW99nDwho2kRW+RzZgisGF51aDbedutGUnW5YawZhKrvH?=
 =?us-ascii?Q?ONwS65S0AeD0yCgZ0YWYnqV9rp5W5+Vio4PTYBB4sfJVSXMGXLK/QkjbyYvq?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd7fad4-2d1b-49a6-b224-08db26fe9658
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 15:45:09.6355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7OmLoYRnJpDjAduP5iMIFoXRK5iJQsP36c8vM2bLgHVZZwD1fXYbNU0G7P8EOA4RNLD9TVRofRfyrlLpkaWC4C8W9PfKeV+AGo6Bws9zTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Decrement fault mode counts in
 xe_vm_close_and_put
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 11:22:13PM -0700, Matthew Brost wrote:
>Rather waiting for the VM to be destroyed (all refs to VM go to zero),
>drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
>This avoids a window where user space can create a faulting VM, close
>it, and a subsequent creation of a non-faulting VM fails.
>
>VLK-45296

you have garbage leftover here. Please open an issue in gitlab to be
able to reference it.

Lucas De Marchi
