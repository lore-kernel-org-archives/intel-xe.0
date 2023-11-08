Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEFBC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 15:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2CA10E16D;
	Wed,  8 Nov 2023 15:55:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4F10E16C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699458956; x=1730994956;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Id/KLwmauZTn6yXxR60E13yBNM6jQn5cf27O1AAvMzk=;
 b=eNRs4LEO3iNtkY0hS/pZLoUc/StyImu3SFEk/lxzOq1pGWntJRIRkYRi
 vm391OQSKHibP2/Sueaf+CJKxfmFNaF8zbKHnXu3bY1zcDdW5r+Gkt+wg
 IsleFSsAVd4QCOCePQLDoQdO9NfC3y2xcbNVZzn6GqwzdN6xXZ1voU4nJ
 Mqzrqvziht9MB85sZ+V+isPfFqPU05zTtdFrIRT2O393iTg62Gh0FD9YA
 rULKLIPfUeZRzs5wALcUfRX4J34MoTHRMKYfyyzm9S9nKtzVfz4RD9lEc
 D/unrk4uaTjAf5Sc0d/B+n7pmxxWdTKW7Nazt/aSTF55CiDcu8W22kJOf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="393705544"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="393705544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 07:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="4421398"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 07:55:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 07:55:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 07:55:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 07:55:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 07:55:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7TLjDPg/I0nqtKUwJjaxrDGidnRIM9icXVgwR4ZAV0CbQXKgRR4Z4xUH4WAra0C9HBUNeF+zDYw6s6ANdCTL7k2X+u1BSJdxoHv2uQdxKK1uF07WG5m9qPeEVZQtzTbIx2S9X5A5XhPh6MYWqwvBiYxN98VFMDzLAw7bQRJB4nblOzVJyKgtztgN69Ubtsl3Z+a/yhMUlOCaVOAHKIp/wGF2+5bgFfiHFLYD3dB+YzOQMk6Sz00p5adgxtLM5+eIyVW6esVgx6wUELUZsIGf9GB6bUlJPL3ZH9We4wrkRAP1JmWJdj8MnMi3umwvTY/ZOvJuzpIuFtfTuJgBSlrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeVVtyyncBOr8uIUsBGI9qBbN5wUqVjJ600ECIXHD3I=;
 b=MAvS3s8J8Fct3iTHDQsXGKbuPjzz05NSJdmiBGH2Ow15WShtCDVfX/wS/sjSUr5c0HI/9tA3LFRPpyohxWTW7ShQVYT7u40le9d5+qBLJ+svaQGPJKmmrz4PKY0gyGGL6RhOStGEfisGtLPde6AWR/qo9x835vLFBQfPmk3XgJI41NgQfmYd2BjABaEuX1vqSNtKJLnyByTGfBbLVGoW1vTqvwmlKhevyCD0j+cL+3ZPyNbT9v/u8CGFB0smWo4XINoickZFEu7RiT//dufZSnvqNjh5HEtYHEeh/0RJwvF5BVK+R5eWl5N5PYPCfKQbMxIb2V/GjxuPXb4odrXzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 15:55:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 15:55:52 +0000
Date: Wed, 8 Nov 2023 09:55:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <vnyr2nbirfddf5yh4q7lskbwrq4hk7v3ngosrazuwiioaufsml@qckippjlrtvb>
References: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
 <20231108135418.3049168-2-tejas.upadhyay@intel.com>
 <a4701efa-eab1-4a65-94ce-2c08107db9d1@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a4701efa-eab1-4a65-94ce-2c08107db9d1@intel.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d6a437-47c0-4b77-a671-08dbe0732f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1EQyRxeP8qVeaaOIWEZybA3UJcv1SKN7ZWZDsp42J0eZ75GqLNO94QDj8Whf9tuG1XmRp7xDu3ZcMi2yWO5VdBK/N8EfwU6ZoqhMX6CS/v1TatJhfVU1kyDywf+6U1YLMTCuVd3XB3KYfMnwM8oAbwE1qSQ20CgE09S7j41Wuo6sstnZLaa1g+vdnKNctAhjRduHUctXGHMMvS6fqYzX/l2nG0UU36MHOqhYvjAR1ZfyCHfKgHRFwAh9QykO438SSH4ce8qJk+yNjcoU/g54fxrZiokYgBpFzmKxM5Rp/5sOP+m/XwS40Q3X3LvhvcDThLfVJDscXRvKTvVJPpdRAnyoDD19U8Pu3CoypFq5CQw0Mw8XFn4V/WM1hbSWYyII/QZnXuNe+nBFPLAR+Zkd9mx4Ax48GgvB9VW8vO4ekG8Evz13ocmyc8f7rLmxoNjhg87tj3f7j4dL+p6NKk/FIL5CViI8UlG0RJ/6GyD39ZWxm4ekTgVVzt4xv7OYC72N/weYrEYzmsgizRdgQ9RzDlQRxx1Gg5+srcdP7LF/36NbW0KgVMPGBC8eSdZebF/lUQc58/rRxXfFn2gI2Uk/BFwQDmZWs04ATAUvX+9KtKnwkiHLxzHroH/MnhMlqlor
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(9686003)(6512007)(66556008)(66946007)(6636002)(66476007)(316002)(41300700001)(38100700002)(6666004)(2906002)(5660300002)(33716001)(478600001)(82960400001)(6486002)(83380400001)(8936002)(6862004)(8676002)(86362001)(26005)(4326008)(6506007)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QMPcEhpbGhZe5OLwLpA8aVmFcc1VebizNk4yZbj/zfh2vJI6UgE1cr5rWsCN?=
 =?us-ascii?Q?Zn2iyLvtiURZ7nkOHpHkfs46wsBXaJnQENhAY+mq2F1fL+q6Ro0DHsaVBNyO?=
 =?us-ascii?Q?62/Zx4fbABZa9vgP7gbINNrHdJKH/kyK35pRSkzaSAtWR9YaOw+giiOYNxgC?=
 =?us-ascii?Q?cUrQr0tMnZO2V/6hwTCx4JGr7zg0RGJ6bYpAWOx74P10Nu09eJIbGlBpOtL8?=
 =?us-ascii?Q?3reyJDJveemS7UzSFEWKzijqGpdiLiKuBKU6MPO1Mob9w2GZUCQTieasXt4e?=
 =?us-ascii?Q?U7xLQsYybDibEHO+LtPtirYC958iWf7anAx9JYepnEu2SJasG9SZb+8V5+Zn?=
 =?us-ascii?Q?4etM4FDTv2schUEBhuCzHDqa5jo7EL6rPaBFoWY2uhdjOgWcdXyDjuCyrjyd?=
 =?us-ascii?Q?Bg151Ix5BrKiTcO80t5EYPwX/iJta/jY+bYPRx6d7p1sm1yjnVjivEFqTgCd?=
 =?us-ascii?Q?sMjZyKmCueEfxTBOIm66LTjrG7B1iZ+7b7hCVIEf6o5OFfgLwal4S3qK29yP?=
 =?us-ascii?Q?8Qb9hCwOKPr734+Ctjkj+1lnPipMHTHYgbjgbqjG229Wjx9xOIRydoWaFpiN?=
 =?us-ascii?Q?9J9Z+Uen6GeKOK2hox2vdU8hvqjdM9sR86OdAQeMAeb46Gv46qRVUtOPCPIo?=
 =?us-ascii?Q?6lWigU0prNCFi7lS/+lIBDN4G6W/6CBCWDrK9oLnDrIpj+FNx3MFaTj3BP60?=
 =?us-ascii?Q?yH6O83QHiw2CjlNGfO4xfu4hzya4s/nmIMTVPG6WrWA4Br6VE009I+G8RDy4?=
 =?us-ascii?Q?zsW2DB7j2rFl7rnWvopnGG1hs/LDUwtbH/EGosvPNVbdEsLysFHCZAJQU0G0?=
 =?us-ascii?Q?TqzSEoR504G4WKogzhVnCGyjGr4j1U/24qfAuoV+TD+OajHDaBEfjB7Lnxco?=
 =?us-ascii?Q?e1ujJDiFT893vCRnsoQB7w1Hk2kdNRINe1amAIzXRrC4xQPAQ5ye5E1GqEws?=
 =?us-ascii?Q?19QO+R83nQfTNDFCTycI1DutMc+aQwWZT1GWmri1lgzcPA/qGbwa8vXCFBGC?=
 =?us-ascii?Q?ksQFqHkSFgqYZfhSljeBO047ClHyoKzuy6lSRXrA0IkHUz2kZ685bIReN3Jk?=
 =?us-ascii?Q?I2RWGYYRYKS2LMQb/SnQCiLGttNWMICnxPYHPUwf0jH3d3/3Z/HehU7xJ2vb?=
 =?us-ascii?Q?4CgsJHi1kU6SC63cjtnnoaG14eWEJqB9WutnblSMJBxFcSP0qNuUSvltXy/z?=
 =?us-ascii?Q?lbtg6q1z1khoe1UpASMpRE/CJ95H2vAE7s72htWiYcj+XiSo6xjZdrk8ciGp?=
 =?us-ascii?Q?1G5xgKYZRj4oFm1QA+4Xg6kOLh3ohdaQZxPvMEVk8jjRGHOSEcugCa0EUaqd?=
 =?us-ascii?Q?In2aICirGk0XuytFRlSRcySAJU2C7qTUrJo6kO9ipzivdRXU0sYkF4mbDRmO?=
 =?us-ascii?Q?aw5+Kp6a0o+0U9/P7LpGedh48uMnOjgYCAw0WlpJ4PAZM+zr4VFKZP3Vv/V/?=
 =?us-ascii?Q?c+qcjE/pVFVUiioQhsqj9A4j1b+A9E3dYF/AJHbXBZUstnggLfzfVTxCZEPd?=
 =?us-ascii?Q?PeV+Hx60wH0SFeO5lIKaiDI5jelK0bm2Lvgz+sH7Cn3XXA/bsGgnLclRGwJ2?=
 =?us-ascii?Q?htZYI0kgtV1Kpk2nh75/oWtF9XKyjtys4HQsj9TJu097isvTgDTIA72IZdDw?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d6a437-47c0-4b77-a671-08dbe0732f30
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 15:55:52.5771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKnaZYtOKSn8dHcmT+XX98TREG4GNOX6TPRt0Uz2qW5/X5z/58mrohB79l79ZPYbDj2vpCWMnRNtLP26oxVPzDhdkFAR8srUBmKSHAD1Csk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7864
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
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

On Wed, Nov 08, 2023 at 03:07:45PM +0100, Michal Wajdeczko wrote:
>
>
>On 08.11.2023 14:54, Tejas Upadhyay wrote:
>> This patch exports uid to the userspace via sysfs.
>> For example, uid can be read by:
>> cat /sys/class/drm/cardX/device/csc_unique_id
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
>>  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
>>  drivers/gpu/drm/xe/xe_pci.c          |  3 +++
>>  5 files changed, 42 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index a646d13af03a..1b8de9b8daf1 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -70,6 +70,9 @@
>>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
>>
>> +#define DEVUID_LWORD				XE_REG(0x102008)
>> +#define DEVUID_HWORD				XE_REG(0x10200C)
>> +
>>  #define GGC					XE_REG(0x108040)
>>  #define   GMS_MASK				REG_GENMASK(15, 8)
>>  #define   GGMS_MASK				REG_GENMASK(7, 6)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 515cdf599fab..266e0d5d7159 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -344,6 +344,15 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
>>  		xe_gt_sanitize(gt);
>>  }
>>
>> +static void xe_read_dev_uid(struct xe_device *xe)
>> +{
>> +	if (xe->info.has_uid) {
>> +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
>> +
>> +		xe->info.uid  = xe_mmio_read64_2x32(mmio, DEVUID_LWORD);
>> +	}
>> +}
>> +
>>  int xe_device_probe(struct xe_device *xe)
>>  {
>>  	struct xe_tile *tile;
>> @@ -368,6 +377,8 @@ int xe_device_probe(struct xe_device *xe)
>>  	if (err)
>>  		return err;
>>
>> +	xe_read_dev_uid(xe);
>
>as this function updates xe->info then maybe it should be a part of
>xe_info_init() ?

or not update info at all

>
>> +
>>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>>  	if (err)
>>  		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index 99113a5a2b84..66f69eada76f 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>>
>>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>>
>> +static ssize_t csc_unique_id_show(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  char *buf)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	return sysfs_emit(buf, "%llx\n", xe->info.uid);
>
>%#llx
>
>otherwise there will be no 0x prefix so could be treated as decimal
>
>> +}
>> +
>> +static DEVICE_ATTR_RO(csc_unique_id);
>
>what's "csc" ?
>
>in patch you use different names:
> - csc_unique_id
> - UID
> - devuid

Agreed. Besides that, the documentation and commit message need to
answer the *why*, not only how.

Why is this being exported, and what's userspace supposed to do with it.
Btw, what's the accompanying userspace to use it.

Why is this in sysfs rather than a query? Is this something to be used
by a sysadmin for something rather than the app using the device?

Why is this special to ats-m? Bspec shows nothing for the register you
are adding.

Lucas De Marchi

>
>
>> +
>>  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
>>  {
>>  	struct xe_device *xe = arg;
>>
>>  	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_unique_id.attr);
>>  }
>>
>>  void xe_device_sysfs_init(struct xe_device *xe)
>> @@ -83,6 +96,14 @@ void xe_device_sysfs_init(struct xe_device *xe)
>>  		return;
>>  	}
>>
>> +	if (xe->info.has_uid) {
>> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_unique_id.attr);
>> +		if (ret) {
>> +			drm_warn(&xe->drm, "UID sysfs setup failed\n");
>
>if you really want to print warn then maybe also include %pe to help
>diagnose why it failed
>
>> +			return;
>> +		}
>> +	}
>> +
>>  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
>>  	if (ret)
>>  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 4119ef03fb7e..1cc8488f8c86 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -238,6 +238,8 @@ struct xe_device {
>>  		u8 vm_max_level;
>>  		/** @va_bits: Maximum bits of a virtual address */
>>  		u8 va_bits;
>> +		/** @uid: device uid, used for generating uuid */
>> +		u64 uid;
>>
>>  		/** @is_dgfx: is discrete device */
>>  		u8 is_dgfx:1;
>> @@ -261,6 +263,8 @@ struct xe_device {
>>  		u8 supports_mmio_ext:1;
>>  		/** @has_heci_gscfi: device has heci gscfi */
>>  		u8 has_heci_gscfi:1;
>> +		/** @has_uid: device has uid, used for generating uuid */
>> +		u8 has_uid:1;
>
>IMO introduction of has_uid capability flag should be done in separate
>patch than sysfs and uid changes
>
>>
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>  		struct {
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 2fae45b9d88e..4d91ad049e59 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -60,6 +60,7 @@ struct xe_device_desc {
>>  	u8 has_heci_gscfi:1;
>>
>>  	u8 has_llc:1;
>> +	u8 has_uid;
>>  	u8 bypass_mtcfg:1;
>>  	u8 supports_mmio_ext:1;
>>  };
>> @@ -298,6 +299,7 @@ static const struct xe_device_desc ats_m_desc = {
>>
>>  	DG2_FEATURES,
>>  	.has_display = false,
>> +	.has_uid = true,
>>  };
>>
>>  static const struct xe_device_desc dg2_desc = {
>> @@ -577,6 +579,7 @@ static int xe_info_init(struct xe_device *xe,
>>  	xe->info.graphics_name = graphics_desc->name;
>>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>>  	xe->info.has_llc = desc->has_llc;
>> +	xe->info.has_uid = desc->has_uid;
>>  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
>>  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
