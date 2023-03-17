Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D23BC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 16:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3728010E3DF;
	Fri, 17 Mar 2023 16:33:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CF810E3DF
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679070802; x=1710606802;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2sAAJW6Ojusf+fygJKTQeQKfjuU/QnmfYhIRclpvvGE=;
 b=VnwwPbnvIebIr1O/Rckjb0SVOAljOWus7IncG3KgLjADVKHaWxwHRGiI
 byb6Cz8O4CBkcGXyJDhGRznclmxv70NkdOS38UHTLFk2CE2zadSyUCo4A
 oQoUtYg2SVPZqhoaMUI63hBiwE/kdLIczAQImZM8KEb8rnTh1imnFklch
 UnBFqTFVPRKcXoU+dPxJPyLVHwZhzuT0ThJzEKY6mc6YaNfKOq3ZEhUZv
 bOxktGX90WBc6EobkBl3JdBfxUrulT5oju++xe7EIkEWYrEd1kGTk7YG1
 jc/ailwRH0C/ORnFVQXe9s0fpPwAQoFjdfSuJiwzLoxDvkWnPsMaK5mg8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340663124"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="340663124"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 09:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680334622"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="680334622"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2023 09:33:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 09:33:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 09:33:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 09:33:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 09:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNHEuHFvHdC86mrckmmOCZRv5EDuRysSyqXTl1S9pIpg7Hpg8msGZ8SFNsRlMgzORXWyTUuI4zyR5rqATdR5p9acdnRxyPn06EliW2T47hp+oZZk7BK5aJsszS4ZA0ja9UcE/56g92p9CpMRwcI/yMiBKhju8WU4V8mZTMM808ufy018SSToaCR3JdjgeSKb67gB25m2uF62lxm+FrTC1uAxEg+UmNdAkj+aS68mnBFo4eZ1DshPHsOh73Cv0/xznY5+IZIy9EmUXIYXr/Men5JA0puAdGOMeuyeItNzg95SLk/vowb/WFiluiQtpeNDsty+gX9MM+6IaE9T5HA2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH9TLZzrp23pwqXvPB7bxZ4AOmBK5shsy1EuzSX93Ls=;
 b=PBrPB20lBe0We8uC59IhrCTdc4VUli2n3d8hG3qgirpjQGUblyMuB2tFBpjPmU6xuTuRFyxOSrzAM7AejXa+lQeYPJRaaYI6ndF2yIbCc2FCZJ32ZCCdoLm1r3oPT9QWYhutLQTWmPFeyHmZhT8NntYW/fOvql0n4GEblBb6agM5mXbW1sakIIIqlMKWV33nezlrc0SKk8QS8LDn4G6eepChVdvGTZCCo9KGOUXDFfOhIWiiZygAbZXvmjnbQfoHV1PnK9cr9J8Ly6hVfcq8MEchV22MW4/Tyj6PhMBxc2hQprkmHPjRApyXEfP4Lamx7/n3JdJMtDE2pr2Ifq5OLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 16:33:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:33:19 +0000
Date: Fri, 17 Mar 2023 09:33:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230317163314.x4kxxpfk5kum52zx@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230310191430.2229799-1-lucas.demarchi@intel.com>
 <d8bfeaed-3e3a-7718-fd74-5c4d0a3b43f9@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d8bfeaed-3e3a-7718-fd74-5c4d0a3b43f9@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: fba41e38-faec-4337-b31a-08db2705514b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Fyu4yKMmmMp64XyDmfmK0umr1e+r3WdO9C8LBgQ4f08mNrrGCR3kAJelccw1A5OKy7r3x8DXopGQWtqIx70qoKsuJ4T+hxPCSillNZ1xggQTz4qsCWNRZfxobIcRARZoUaCKq+q5/BHsM6fV9+C/LFtEXL/o1FtmBjgivp1A1UTbavZZCIk4ojK6xSsysxZgjAqPLg/YQJs0kh6ZIReM0zmDzgOuiFupwE/YXJdMxW8Q1gXW3uBsw4z3eCVV1jR/8KLHMULlBR+xxnxtc5jvdMiJhuR436xYxLVBxtfcoBWYPkjW6FiEnuyQ8Jeq5M5u0Dj3hgz1OUkJYIxYIzGkdL6fPURSSbpN3Itu1uHK9XGDT1KqupOu7kkuZsu9dKRtB9nJrwfj8ERbhlkiv0GIEWj6IA6cbXGc4i8zNdVvxVLXHv0Na4SyingDbED0AQh5kR1RZg/MqXt0Jc7QuNYi1cxtg7kXiF8TLWoMFfWsZp+WPeBJCZ5vrI2w5d5GGbcx2w7TgLS/2llf8nrGh+f+vuRarat6z3leVDX9NevXDKqrS7gmY7hwrDbfYbZ7X2WnfonH9hTNgh1vjtyPJFpycKgplW2CCOlIoehEflOiFQMCCu32INGz/mYdj5QL0XeIE/CSfDanXzvqGUy+ePCTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199018)(82960400001)(478600001)(38100700002)(86362001)(2906002)(8936002)(5660300002)(41300700001)(6512007)(26005)(1076003)(4326008)(186003)(6506007)(316002)(83380400001)(6916009)(8676002)(6666004)(6486002)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KBK8w29APQC3R5s61N9PPDsrw4g/rXD5/X8kph/mBzMs0lGhOWjBd34CRapP?=
 =?us-ascii?Q?Wxz9c+ZNR80cDnjN8rIWVQH4oluyZ0pP4cC1td1H7g1XgnS7qhVHsH7luDYz?=
 =?us-ascii?Q?0FLmMu0Om+LPVZm+WozoP5E5Ixl+ZDcahhwe6KqzS3YhfV3fuIh4UzAL0gxY?=
 =?us-ascii?Q?7MrtimRs5cH8+B3aJLutixwqHKYB2k2fl89IVZnrAcH7nvFWoXCFX+inBqSV?=
 =?us-ascii?Q?aC5tCQfV5g1JCEsbVQNJMowpmpXiin2WIuRBlNU973vILhnhT6ZW83j9U9Jl?=
 =?us-ascii?Q?XPcp2NiNDzZzKg/I6t0QEo5YPX1dZErocZMVPkeT9XZaLWoxINIvcHeb1Vtz?=
 =?us-ascii?Q?iQ69GW2pxJnb3fHnNx34QfVRawPcE/Stgnct0tZty0X8Sfw+Kxkt3t1T4wPv?=
 =?us-ascii?Q?AIPSOJgZ5pTXoP8Ye5CpP4lS7E1BcYXCYowEiTiSeGkCqULFwxjCFLgl1x0M?=
 =?us-ascii?Q?nXcVl+2f+qZdcm8X2IJZ9otGDCMQMRd11LavznpEzRSXRWS4HHirfZaABlfr?=
 =?us-ascii?Q?1MMJaa5200RaKbQGB+VAsK71DX9+D38paHRuNkQ9GwyGMDb+APOElu/Zxdm2?=
 =?us-ascii?Q?+QQSYr18WO+cQnUjeCkImuu4lD4N9ROCN4ooG9dQINF5pgwAyrw9OGkPfcSX?=
 =?us-ascii?Q?tmcqXzNo8SNpSLDoLNzFo/rDPn3ip8MmGaTIXlz+tY17F26NdVX6Ld2ztQCe?=
 =?us-ascii?Q?Y1zWyPZ35RilYW2zq8JpB+28/huaXv19HUdXDxtaUvSJ+lsWNY6X5jchSI0k?=
 =?us-ascii?Q?377h4+OPRJ2UQSgTIEyMlCycYduCGkmjBPGMkLQnrXwJmHNXYet+YPPGiW8A?=
 =?us-ascii?Q?pUSYq7aUT4AzwmQj+4UpvXQUyEBsbpSE05CZr0kG/vj9s2f0YtjsUxL1qY4N?=
 =?us-ascii?Q?or1Z+GH1nr4W5ePbxfpMips2rVHW3Tb2dlRJHPwhY1f0Jo+qgMsog8Wzw7eS?=
 =?us-ascii?Q?M1ZCpEemry35Uu1G1UhuFp3UFTghyTNf7gP503DQ/+1CgsAMis2noMXhieL3?=
 =?us-ascii?Q?nXviBxPZXSnq93n3VrvHnlB7nhxi3x/eYGYYGMrLoShSp7YuQcGjrA2XC0/d?=
 =?us-ascii?Q?/eOvVpyrIyC4GXMdB2CzgBB492B4OkFJ+yDRRye9MN36oZlXLp1hYctDu3WP?=
 =?us-ascii?Q?b2CupuTTPsvnhzQ4Ps1dd7odbZw/302VCCaRvEgOflSbjCKCg0hjo+nkXfO9?=
 =?us-ascii?Q?hdT2wp1ukD2R4oVmI/FIPqKtuznjnjX9fzK9iCU6kBjbrXag+Ule+sbJcTPP?=
 =?us-ascii?Q?fUStt0izdz8VCyIRF9AWWSNDOSJNk9+1yMUSTmnTs2YERQpzQlPQk8dEX8RF?=
 =?us-ascii?Q?zlJbsJ9EF7tYSTo6r7QDEh5iPlxq8xQvrIK9nwTf7jiUSeg/14hkCSyMlBH6?=
 =?us-ascii?Q?uIHkp4DUJIn1HaAbvbLnVv4D8gqKyd0lohQPbBkZm1y9/s/PI/7OFu9tJ4RZ?=
 =?us-ascii?Q?zXMw8ltl1RIVT5b4QuA55qhhPQbv42LJ7Tks+c2FTg7pAQkpMiihTz/ol9ZZ?=
 =?us-ascii?Q?BzIIrpR5JpSoI70JuQGL0emi1VhNxMnvkdhaKJpiPGfb/TcTg7n8FNVwax8E?=
 =?us-ascii?Q?Kd9tp4ytBSc+X17JyiNyyzo45c2HQXIBboOkjfnz/KotXaQBmkE8UbNee/Xk?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fba41e38-faec-4337-b31a-08db2705514b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:33:19.7478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcUzF7xACZFIYl7P8x2ckzP0yaaCIxJWiO4JKWuWU57xDr4wbrcu/4Icx/Cx9SrqgrbnII9H1DXQkXipcQua4KKkZl8kbEEcvcK/xzUukvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix module load without display IP
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

On Fri, Mar 17, 2023 at 04:46:58PM +0100, Mauro Carvalho Chehab wrote:
>
>On 3/10/23 20:14, Lucas De Marchi wrote:
>>When the device info initialization moved to the display part, one use
>>case was left behind: platforms without display IP. In order to keep the
>>knowledge about the display in xe_display.c, xe_display_info_init()
>>should be the place where this is set.
>>
>>Remove the warning and set the info accordingly. This moves a later
>>check from  intel_device_info_runtime_init() into a very earlier one,
>>when no HW access is being done yet.
>>
>>Fixes: 01a4268df2dd ("drm/xe/display: Move device info initialization to display")
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

missed the xe mailing list, adding it back.

>>---
>>
>>This fixes the module loading for me in PVC as long as I also remove
>>the ast module, due to another unrelated issue.
>>
>>I do wonder though about the need for the drm.driver_features dance. We
>>set it very early on probe to call aperture_remove_conflicting_pci_framebuffers(),
>>which may be needed if the device supports display, but should not be
>>driven by xe.  For now fixing just the most immediate issue that should
>>bring us back to the behavior we had before the commit being fixed.


I'll push this to fixup PVC and think about this later.

thanks
Lucas De Marchi
