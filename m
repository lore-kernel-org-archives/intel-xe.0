Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8874EC61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 19:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4982910E253;
	Thu,  9 Mar 2023 19:39:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE7E10E253
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 19:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678390753; x=1709926753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7OyWyM3OvwVkS2gWpj6lCJTVHWP3S5oTqtH2g3Bxt78=;
 b=LV2ZrfctHY7/+HdNrcAi6IQr2HPAlGFhZgjVjVwxziMvDRQWSlK5q9mL
 mwPNu9QIlqs0qNYmVvUVnD5Ap+2c56mlocIkH9UmLvGkTfTdtt6Ayupt8
 zCAW6WuzvJzABrQlvGvRjr+qn+uIGUovu8+XNBgUOhUxc701m9EXn3ZMc
 F7kdamuHQ/P4OAkglYH8l/Qfss3pglp5+1ohoEVhKtBBc4qUNx/VNbnn6
 5Lj5kmRtbvpd4g1WgiYaWkweQq/XrtxUS9HtjEsZIqgA0jiiOgTKbHgjH
 ZoNQEi3qS66XzvgfMwhfNMKJ7WzE0N50yHWOJKs2TN4QxVfTGAEvBN5NR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="336564797"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="336564797"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 11:39:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746442639"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="746442639"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 11:39:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 11:39:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 11:39:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 11:39:10 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 11:39:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJFeLgPhtGzL8yZpX/y/lDekyVCz92Y70sSk53vj0bLN+JoFDJ5B4bWIRbIGSqMUEub9UHELeD7e9zfM57pwDmQTJZlu5is0h3wgafvmRvtKY3nZ6Nt6NCJXO3VioHL4UXR2VKrvpaS1GxEz5sOIJ+j2KcQDBOk/s1ZhY9ehUs+z6GvaYMQjjmfTJ0w+AOmjzZRzS8yB3dA5NtxqEstwKSguc7h9eUvjNxC6oNx7DE/xVNZNCl/9oOKSUKsXrKTb8Q1t2boLK900XZjzqxPbFWZMrOuxJjlniY6vH7TOGQ1+qSZEDDDdViGtn1eyhWAaVN8EYeA7i+JdqU4EQFzvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9dffzkLy4QWIrM/EqZRQn/fNQnTXVJUAvHPGgz64Mk=;
 b=GuA155shcbR7uNFLClZN+krpX2BZwHzwTmxiA14MmI1an4bD02kLVtco0nVSskOoLLKVwuUqifoOPZg28c+cwpuRL6vIANrAzlyoH9D4+3UA0ZinYWu0F499jWhK9r+sdhh8C9K73C9NpQCTTB+Bq0MYBknVtKLwTglDoD5SRfFUdBu9fslA7FF8pBxmUP9m5trs7Tris+rbXF5yrj8H8OaT/XdIqs1Ca7zPcKIQejpbeUM0gKNFzdoxAefItfXuQMUkmywjBmqReHCTZ+koSla+WYAB05DjY6WrXHUH6sMoql3f/atrR3VeTy6KRW3xvFJy4OPK/3LezeKm0c7fdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 19:39:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 19:39:08 +0000
Date: Thu, 9 Mar 2023 11:39:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230309193903.lms6nijzpkqm7jad@ldmartin-desk2.lan>
References: <20230309192553.3206772-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230309192553.3206772-1-mauro.chehab@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cdea28-5259-43d6-d62b-08db20d5f2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FDN0/aqEsx4LyvFSGU4Fi47scaT6fGvIiDMgvhRPvU75c4yTlQMhPf0E++1XT0eDysDnrABjAPJEBZoa0ZN64WIpz1CU2FQD7QttwlJybR1VZahkbEL04EujnXNtsLw9nK1fCqsRgwMPJ95Ub2anKZ1etgzVoKA3kNHtMeO/VrGsQw3C3MoDbm3zvvp4OGl3yB3S5rmIwKCiwv8e8yRsqJniUoyYgRjbjM5p1DayheQMLWHjDY8UOMJ4Ugt7DPwroHqd6/b08CXt4o7kzUnEvMyj/F9Ke3LmNcZD/WQwuNsJR6PSo7J8hPPjVnyZS+nEvBrLnbLG8/Fi6LqXMDk/OR2YhQHRvDeU3XkuZ4izsvzxVTJzS5cqDdF8eK1Xu4pQqhdZG01g5TRE+4RF6KDH1g/xQoWQm/pI0C+fcpiRP9ZSl1vhzztPTwnWzQRqOgcMfmqtIs9873CZ1Gfu+F8eDOSn6DwdToXoeeQYodymJvy/HvZeRhKr7r0GgcLHIrqaU3f6ArGWS3o20w3QGrmOZUR3N7Gib+Ks2er8rQ5K99NCRLZbFP2772S0s3RHpzBAkFzF76u5JSNMRimmxNat3St/SgHApcJ6h9QPm02Tpa5WfVKtZ1OFW2AJc/MqWtTU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199018)(36756003)(966005)(6486002)(82960400001)(186003)(26005)(6666004)(83380400001)(9686003)(6512007)(6506007)(41300700001)(8936002)(66946007)(6916009)(8676002)(4326008)(2906002)(66476007)(66556008)(1076003)(5660300002)(86362001)(38100700002)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AgISRbEIUkABgHIJ4Ypmu2q1G4eX7lp7ysnerpxg87JDfwWP1SxwcFSKa2I9?=
 =?us-ascii?Q?sf0672bdgbVVs/SVa4rLWi68JLnbwCeWx/tufpaKl4mGLH99Gqhrx1Cb5WkT?=
 =?us-ascii?Q?nC5rnQW4ygGUjpBiVBY/s24agI4MyfIHIuwXcevBmQgRobtAsw4sfyWquhsP?=
 =?us-ascii?Q?z3/VnwdsUlZD0vh7lIwbSO5yWsUVTn5eeKLfswrKl3ONpNBq2ySxSj5hs0ft?=
 =?us-ascii?Q?JTgrS3fuUDraodRNEfpDll15bqeMGhDPPWcPww7b8FvXWM7mXCChX3cyxiNb?=
 =?us-ascii?Q?m9oI6kP3pX9RRrJ8qA31eMJbrpl8GfqsXc6cIFhRec/sN6CQ6/Sl80ot5Mjj?=
 =?us-ascii?Q?eaFg/uPnzOcjawxOaS4IDiF+Vli+QaCR0GqHytYwdF+ZZVpbx7nvjKfB5VPM?=
 =?us-ascii?Q?pbJgM+VZto41XVQ7enCC+sQ/WC/irFIm4B+mUmAXuveu5GOylqmxeOBzMPh5?=
 =?us-ascii?Q?aRzl8kZ+x5Xh0a69BDLdmkvEeXP3zfovZpiu4NpKjfXImepKP5uxgXv9YfHc?=
 =?us-ascii?Q?2253IO156++1nESmYxnyeqSpIh9n/5tPNodrTIqTP/aTenxpoksN43CC13fO?=
 =?us-ascii?Q?tcHCmVslCHd+OPRpDSYCRxYy/eD+U/nrnW9QjGj2NZmIWvlpCacRnYJO16v8?=
 =?us-ascii?Q?jgz2c5s4UIVAwa7gJvJC1I62sbu3OJy5rTkBOwFooAfNBhXMlJB73kpaSA7g?=
 =?us-ascii?Q?RjIBTW0R1Rw9hb9+c3bKjkS/rv/LYZzfB342U5tjaBHKw3+yeDJ5lPbZNKVd?=
 =?us-ascii?Q?rbnbs/u8sjc/PvFEsq+VUFxu8onHwuk+c1bCtIViBAU97xm/yPt9jpgx0BKM?=
 =?us-ascii?Q?eVkmOz8Yv8Rp2lMqd7vUzb0Ez6xOP789UpfA9M1uKdFgMboz8CdIfuVtGwob?=
 =?us-ascii?Q?FmD9oI3oz9vazacVXVFeFbj28jw4pyPXYopdmM/jYsL0CK5aLVEsUJKCC+1e?=
 =?us-ascii?Q?mo1i0aDgYRcTkvc4moBurMi35XZYaNygr5bu1M9J7OGlkvRTNQsAv0g29VzG?=
 =?us-ascii?Q?R7kGfxxFBb6XawTfsrutppCdHSuHsZ1sm2SZq14s5YHSd0kXxtqxFcjUNxcV?=
 =?us-ascii?Q?6+wOC/wLbAN8zO3HYGvv6CNlh7gCy8PNij6Z4FRcNlWUl8I8Kf/ITXWYOQCO?=
 =?us-ascii?Q?TuGL7/NrThGusFo8BaNSvVpQbwlxM19feVex7FZC1SMNBZDs1Lx9GQfsmZHx?=
 =?us-ascii?Q?E5M0snUbB7AMO26t+uGv3g040SiziWnID1gle30bmIWcifGulxkJhcVc0pZx?=
 =?us-ascii?Q?kJ1q/do2wAdY9fhIpw3jWmqOf3YqleTaW+rucL/89dK4zlHXmOFTi+iS/li7?=
 =?us-ascii?Q?NNesKcl1plHESmUZP9qcHy03CSCpUJGdU6jqeebUvcgXZTGJdibj/zgrQsZX?=
 =?us-ascii?Q?qaRUkIQdtYbDwHEnWjOwOD2KK/IZnywJMksGZukDdblj7VMrO0lt4uHjrNvk?=
 =?us-ascii?Q?yoCRuiA2sJofy+96LLmyK8+zUon9gSCwHRo9dHfGjcag/j+WO93lw5VGNoPE?=
 =?us-ascii?Q?b6SlcarQB8wmNhiOLz+mmKhM5Qr1ig9gPqwMLibyU5v0o6M4LYpoANVYKAzl?=
 =?us-ascii?Q?IqRY0u5RZKWjiWCbCIHrFCijTDJdQ/bRbgpaWAhrEfIrVpCyYEALUOZc88wv?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cdea28-5259-43d6-d62b-08db20d5f2cf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 19:39:08.1286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60eWMObUkRL9YhAgTdlDc/zvYhM8OmVExgKyb+r+Rpycqwvva9DtriD8j7SDKOHFlZ8MFMG5apgyMJ2SLD++Wm0HOsE+rkkrCwyvaGqObKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_uc_fw: Use firmware files from
 standard locations
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

On Thu, Mar 09, 2023 at 08:25:54PM +0100, Mauro Carvalho Chehab wrote:
>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>The GuC/HuC firmware files used by Xe drivers are the same as
>used by i915. Use the already-known location to find those
>firmware files, for a couple of reasons:
>
>1. Avoid having the same firmware placed on two different
>   places on MODULE_FIRMWARE(), if both 915 and xe drivers
>   are compiled;
>
>2. Having firmware files located on different locations may end
>   creating bigger initramfs, as the same files will be copied
>   twice my mkinitrd/dracut/...;
>
>3. this is the place where those firmware files are located at
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
>   Upstream doesn't expect them to have on other places;
>
>4. When built with display support, DMC firmware will be
>   loaded from i915/ directory. It is very confusing to have
>   some firmware files on a different place for the same driver.
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Lucas de Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: David Airlie <airlied@gmail.com>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index ff94eec9cafe..00408f1b73e1 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -55,12 +55,12 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
> 	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
>
> #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
>-	"xe/" \
>+	"i915/" \
> 	__stringify(prefix_) "_" name_ "_" \
> 	__stringify(major_) ".bin"
>
> #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
>-        "xe/" \
>+        "i915/" \

Looking at the old branch history, it seems this stayed as xe/ since guc
support started.  At some point I think it was thought about having the
xe symlink in the upstream firmware repository, but I'm not sure.
At the time there could also be the issue with the firmware versions,
particularly guc, that needs an update on the kernel side too.
However we dropped them from the name in i915.
We should probably do the same in xe as a follow up.

I agree with the direction here, but need an ack from the other people in
Cc.

Mauro, you also have to change the URL in drivers/gpu/drm/xe/xe_uc_fw.h.
With that,
	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi


>        __stringify(prefix_) name_ \
>        __stringify(major_) "." \
>        __stringify(minor_) "." \
>-- 
>2.39.2
>
