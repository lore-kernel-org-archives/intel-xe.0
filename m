Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C2EC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 13:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638B6112983;
	Thu, 18 Apr 2024 13:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zo74hljY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBCA112983
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713446107; x=1744982107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GedKaLtCCWZ5G8puQk//P+B81NRF9V/rKlYQRcCzMII=;
 b=Zo74hljYm0eKq0ERQeBQmVyCwBgovAxhk8KgaVRzcMZlalYHNiSobYze
 RUXKAczlVMgzFqbfCRiP7GB11nQUIjCIHky8aP4lIILxV1ytN7nIGVues
 sXbJDAcN1fACQV12PHtz5nWMnUIrfE+RsKKksyVasMVrqjZOOaL1SER1q
 OvDLsBmr7pDDcxrP5LV93uXSiUnZRvM86dljtA8PgCMwx5Ht9Pcmt6JrZ
 VYq5rzXsOBhOHjl8JI0B99sJMQO9JUZPwMBOxwQTyXbcscPQuI3ZQ94dp
 SMz+6+FltvYFStZNnGPe8ismPFvbkJ1aQ/YfG7ZcMLWYPMZYRghYqTXFy g==;
X-CSE-ConnectionGUID: VbrzJgkcQgmp7tKmsyxIgQ==
X-CSE-MsgGUID: X9Ct8dTSTRyUeryw1wB8CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9213347"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="9213347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 06:15:03 -0700
X-CSE-ConnectionGUID: pq3fNp/2SmGvEshlfbepkg==
X-CSE-MsgGUID: 65HAxD95S0KdUySsZK3Row==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23502431"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 06:15:01 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 06:15:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 06:15:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 06:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3Qo3/pYFhoSVVB+TljbSGh9gUGxVFICHDAUNuJ+FO8Akf9p6j9/oeAjJFw4mf5kLttd560umAPG2Pj2EtuuAkrKt3cYq/d5ziy5iBj9oVEGa8xKOAU5mywaH7pGpYxEYC2BOwa5xWiJb/aaQOmF1z0IlU6hjFFdXBoF3av+M2cL2j/kPB5jZDqsUVpOWd4Oynzy86PIXEHtc48D6RemT1cqv3L/LXt4aJ/5ccPiWQphoINYOjNTf2VkLQ68XrbNqQi8QGkd6L235fMcIRE1WBlG34fnn8+qK5MyDK5jlAa6q/KvZcbZO4/up8+7bw13dRJ4B18sA8mr6iQfLhiu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfRW2sbWzqLsWbr0yGLovZ3L+nORHCS+mvKuS+5N258=;
 b=O3hzJSlDYnEm8WrAWLeDn3INAx0X9foTHQQOShbH8Y/QhKBZKnEnzRkQ9T1w4iHpxIbb6XEP+s8Aeo4FH/1g7tbs4OZV4M4ajES9qJ6zQzVjvV2B/c1ntLK2WBabbgLT3mTtut/Ckzg1muOXW5rAvZHpN4uUEwgMUc0sN1k/ltEdeMibgRfjNt7TTk9um4R7Q1nIKd1V/0Wa+i2xGmbIZoMgpv/SoXQ8x14Iexj55cnOSpWE+6IZnkNb3yBe/BI0MvTnW1D35M/tmcAjsvbFGQTZ+aCxAtZX+95zQBlmLYX1ABGlERSP6N6TLDR22QYtoYwHsffo+xel7/NqRJnQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6878.namprd11.prod.outlook.com (2603:10b6:510:22a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 13:14:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 13:14:56 +0000
Date: Thu, 18 Apr 2024 08:14:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Message-ID: <yow562hwodxuhhobwndyphp52espvswyecjzzcncpo5xvghjho@f6tly3xklwjo>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-4-karthik.poosa@intel.com>
 <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
 <ZhWOV9puU8o3-qZM@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZhWOV9puU8o3-qZM@intel.com>
X-ClientProxiedBy: BYAPR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:a03:60::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f72380-92ce-4c0e-547a-08dc5fa98af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: ihWnhIi7XdNYN5h5mYU6nCghVz2SLej3CCymUwILyujsgjSiiSMzjNlE4McFZoxnGWA3Rip4C6B0eU/Lm2ASvVqTxaRrS2CrtPF4Sv1YarObhWY4dvtp1RA4RgDaR7EBfnz27U1j9oB62LxsPU6psgE4tgMbJ7eVw9WqgIW4PilsRyqxUgJoC05NCOhs8MwWzxyjpvpL9UCAvZ6/VihN2nuYTQxPAdmiSY6/9iby88hEntVSGIpwdT2QK1d7ibUOxbgPDoqQek1UF7co2/DGwrJVJASP6RSmN17qstf03DsD3Eq1Ju+B63nlMw6pAVr49ebnIv0flds54ImsM9XPOhGimuhZ60fVZSx7OI1tZXKNuIZuVvoOC/vZUlKcioXdDAGBMAjL19bAAfaO0DEud+taCzqJYPZygHFNdgyjn/XkVINYzxpAReAoRh/hSOyBAUHdqBM58CTVStcpb8f+2fcPlAHJxWnf2WtbVK6HweMEd3/NAh9tMDl1j8WEijZwHn+Ggxqn8vBAxr51aCBNa3ez0KvepoBDIn2LsQekiE+ybiE1ZW+iNhj059ArqrTTIzPhq0P5aHgKnzexmmqjXeQOkiD7NH9QrhGvyTw0qs1wIQJgEt4JwYGcyXzt+r9x+dSemB8yeHCie9XMytR+1Tgb7rNQM5tfGqv/LZR8/bQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4joAtYslIgAoxeeEDwiZqa9UZHWfYLVNMZYRP0d0ozuvLs2dcAXVYBHMqE6?=
 =?us-ascii?Q?KX0r6zVHvHSEfe/SrTn7RI/4f6dELh7fQKpcjLNByzE106IPCzPWbe8WfMx6?=
 =?us-ascii?Q?9ZFf5cKg83XtyWeGKWymAxjQpjMsPr+MlFBFDjx+/rZjH0ZZwKltu1D7HaSh?=
 =?us-ascii?Q?rrjMeCPLoQ3X9IBWKHqrqJ/eepkJmdJSVgRyli63BAB/2QPgTzhIL8CTohBT?=
 =?us-ascii?Q?dZSkof6CKv7DbatjYB/YD5HqITBV5NC9EY6Fo6FpCU+h0aaEU8s2ojCQobn8?=
 =?us-ascii?Q?MPLp5uTIVSCThmMQP+ECp0o5C1LvBeDoj/i2cWBV111nDTR3DExMlbTKthtC?=
 =?us-ascii?Q?wCoX7vvBZgZqIqjRxRn45lXf/2zwzy8lMKcE+x6wTV009FMs1vn9te4pcbTd?=
 =?us-ascii?Q?8l7gPhJn4fDqMk62OumhAdhjp7mPVt0neRrlnQTrVRKRppwj9PBQSqH4y8dK?=
 =?us-ascii?Q?Ptu4cSNPr8+/V0KHKJELLLjnCDEOoesD1KDWGur1gwRjYhYF7IDngolGnuGv?=
 =?us-ascii?Q?MKsPgHcCiXF6ZELMeGUnZiIeRquTSjaT9MlLZlSuvPu5XxJkYi5TmALxVOLT?=
 =?us-ascii?Q?mtggsSBV+oJ5e+DQY+Hvu5KSfxgmBgBJq9BIw35WNLqrQX9VD2gzsV8AJHTZ?=
 =?us-ascii?Q?7jdii+rm00c64XtHDP2n+ERuU+gVidagiz33jJOSNRT2Lg3AWXbDfzxn/XZq?=
 =?us-ascii?Q?DoVz6/u9uzBR5GkxbifdTrXXMC7t9gYDdWoCbqal3Bspi3lLmNQblQeum30g?=
 =?us-ascii?Q?yjMC5bCYgwlinJhAfYUxmE1DhIt3NAJ4E1TDddBP/ppyTCJB5rnmGrNigz7V?=
 =?us-ascii?Q?10XTLfsryTmQyBGitgzU4a2aqcJkfZLdel5LgIH3etkUh1q2B//iD9i2eCRx?=
 =?us-ascii?Q?BakvUuQBt5lRFfUVJzXBhzPdX6yXPgH5FAB2ovPxx6kSYrTH3cclKSiBhcE4?=
 =?us-ascii?Q?SKYX5OetZkyJneMfsT15T5Y5YVZH+HX6ASnfXHHnEL7C+O6zYkCkX6Ouy9Sy?=
 =?us-ascii?Q?wijTp0IUgVMdwAz3/vMLrTHDsFOzC+yc3dAOTJme6FpCjGgMCWcxcf1ZFkD3?=
 =?us-ascii?Q?8YJn1pDxQzsCb+CS7NFewpX7jnxgwxPxPYapFhPBPHuUw9bQ3wjqW26nbBCv?=
 =?us-ascii?Q?nq+hOf86nYFGvfObIbeRXNz8+9flntfx7hsMEdIlMZsWi/se2VYxZXlxAE+m?=
 =?us-ascii?Q?AeUOPzJ8iXNVstmwc2unwPoVpxQ+MDLt4eKhC4LYTCk8Gj/65KPRdk7a260d?=
 =?us-ascii?Q?+Sg3lgZFicenYWyv2M5ST3rM4tQpuhqypsrdFIx3dOpFdo6YG+TvA3PeA2EG?=
 =?us-ascii?Q?pweQOVwkP3wWK9nQNHImrC8uT8lxDuOAHk4kdNp+CvNNNRHsLBDDeBzhUsyz?=
 =?us-ascii?Q?I3t4J31XEtdSAKB54So6nFoycUwUCppab94YbPnB63Eth+1yG6hBcCHMyj6E?=
 =?us-ascii?Q?MUZvvbHdhCBx8gfznlLpahpBgV2azfEND81ThOPnoBvpfq4/avF4GRDGqgHj?=
 =?us-ascii?Q?UMu7+1SgDu6bs5evKaDmwOlGd6z6lfDf/zhA62CP33uGTdhwIqlPrOEXGFHO?=
 =?us-ascii?Q?rXg4gBgNsfBKo2C49VIjlVqcyDv/ycoPDA1p4mX6PTwgNDxMY52rz3aIlmv8?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f72380-92ce-4c0e-547a-08dc5fa98af1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 13:14:56.7149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3jVh8U2BUmB5yaWCa0TV9mxeaX4FlcLgf8nCpOVfnaMM2v9suGAkVY2xO8+ZJJ9PSRIb+K2GpLMNXzWfX8XFQ45RHVAYpcQlkV7bRFZBPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6878
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

On Tue, Apr 09, 2024 at 02:52:07PM GMT, Rodrigo Vivi wrote:
>On Tue, Apr 09, 2024 at 12:52:34PM -0500, Lucas De Marchi wrote:
>> On Fri, Apr 05, 2024 at 06:31:26PM +0530, Karthik Poosa wrote:
>> > Return u64 from xe_hwmon_process_reg, instead of a void return.
>> > u64* input pointer not needed with this change.
>> >
>> > With this caller can directly assign return value to a variable without
>> > need of explicit initialization and pass by reference.
>> >
>> > v2:
>> > - Fix checkpatch warnings.
>> >
>> > v3:
>> > - Rebase
>> > - Removed unncessary break statements.
>> >
>> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Badal Nilawar <badal.nilawar@intel.com>
>>
>> Applied the other patches.  This one I'm putting on hold to think about.
>>
>> I'm not sure the approach in that hwmon in general is good with the
>> xe_hwmon_get_reg() + xe_hwmon_process_reg(). It seems it's even taking
>> some pm refs when it doesn't need (to decide if attribute is visible).
>
>I believe this approach is fine.
>We do need to earlier get pm refs if we believe that there will be mmio
>operations underneath. Better more then less in this case.

see this example:

static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,                                         
                                            struct attribute *attr, int index)                            
{                                                                                                        
         struct device *dev = kobj_to_dev(kobj);                                                          
         struct xe_hwmon *hwmon = dev_get_drvdata(dev);                                                   
         int ret = 0;                                                                                     
                                                                                                          
         xe_pm_runtime_get(gt_to_xe(hwmon->gt));                                                          
                                                                                                          
         ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;      
                                                                                                          
         xe_pm_runtime_put(gt_to_xe(hwmon->gt));                                                          
                                                                                                          
         return ret;                                                                                      
}                                                                                                        
                                                                                                          
that xe_pm_runtime_get() is totally bogus. We are basically doing a
SW-only check, calling xe_hwmon_get_reg() and xe_reg_is_valid().
It's only xe_hwmon_process_reg() that actually read/write/rmw anything.
I think we are following the approach "upon any entry from sysfs,
xe_pm_runtime_get(), lock hwmon, etc", which I don't like.

Besides that...  xe_hwmon_process_reg() is an umbrella function for no
good reason. The caller hardcodes the OP. It could very well have called
the right function and just didn't because xe_hwmon_process_reg() also
bundles getting the reg.

taking xe_hwmon_power_max_read as example, why can't we
split the get_reg() / read_reg() like below?

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 453e601ddd5e..8ce8d9a66df9 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -160,10 +160,22 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
  static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
  {
         u64 reg_val, min, max;
+       struct xe_reg reg_power_sku, reg_rapl_limit;
+
+       reg_rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+       reg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+
+       /* XXX could probably be xe_gt_assert() or add a warning */
+       if (!xe_reg_is_valid(reg_power_sku) || !xe_reg_is_valid(reg_rapl_limit))
+               return;

         mutex_lock(&hwmon->hwmon_lock);

-       xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
+       reg_val = xe_mmio_read32(hwmon->gt, reg_rapl_limit);
         /* Check if PL1 limit is disabled */
         if (!(reg_val & PKG_PWR_LIM_1_EN)) {
                 *value = PL1_DISABLE;
@@ -173,7 +185,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
         reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
         *value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);

-       xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
+       reg_val = xe_mmio_read64_2x32(hwmon->gt, reg_power_sku);
         min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
         min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
         max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);


Yes, it's longer, but it also uncovers one issue that could have been a
silent error: if there's a programming mistake and
xe_hwmon_process_reg() returns a valid register for REG_PKG_RAPL_LIMIT
but not REG_PKG_POWER_SKU, we'd basically use the value from the first
register in the calculation, which is wrong and with no
warning/error/whatever. Btw, should we change the visible()
method to cover that?

I's my personal feeling. I don't like the pattern xe_hwmon.c is using
since it's very easy to introduce buggy code. If someone wants to give a
r-b and merge this particular patch, fine. But I do think this pattern
should be changed.

Lucas De Marchi

>
>>
>> Lucas De Marchi
