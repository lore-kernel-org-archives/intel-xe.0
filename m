Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CC5C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7705010E225;
	Mon, 27 Nov 2023 10:20:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BB810E225
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701080420; x=1732616420;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j8FmF6zD7GmcAzd1kBF8T6vX0hEN5i9SqoQyIaGARZ0=;
 b=n9sL4HHnY8xUyKor6gYa8DpMT1HWXg0Uvwjlh8d/3R5pBcOYKQd0uINE
 3UmGaE0yvC2OI9/JGC/6VBHDrBKz0HqzCpSaZ1b37mSXxLUq1wCuND1/7
 AgkrNWDw0jvzMaEuLB9IM/RZ23NMP/ew5+W10VCJlVRzd/V6Pit6OJXaf
 z1Oxr5GaAv8W4HCdbgH3GRU7qwlK8HBcCk8V2xEAGs/jDOuE08pgrEzwC
 mBwB/V0S4z8jRJpq1xD+jvDkvLUlKCpe6ZgLm12gyOC+sy+0pEfNBWUCl
 JHZL2hba3+OH1Ng833JKOpgMpehXOzHcFgkQsw0KAMalxX9//Mi+LnRbH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="392425073"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="392425073"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885974968"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="885974968"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 02:20:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:20:19 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:20:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 02:20:18 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 02:20:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlcbfZ0QZWF4r1y/e/N4t1Z5x6QK4ygeDW1IIHdbFtooZOcsIVP389/DSPo3Kz2xzQAFW+VQtSMuHkZOcQB35sHt4IvxFtCjUBffoe4IOyGmLeqVJf4aUiiXguwZesp69eAbPDzdtalWjDFn027EauMJjlxVoXCwDbTJW20G9KYDSz+12ovgqsXGrRPCpJNcIIV/TiaL9eIuo5BKJWV3SXx1/xa5Ry5K5Adgw4JnbL5QlaVd9OMUZvZ8HrrAdIpHzRDDZ3gQsLFJ88UYr5pKBWLh1BeD22fLAQWOC3ersZMA34tSJCL2IuEt3QF3ih+gboGYGobmcv5pVIuHjA3tXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oy1UI5nqPbMuHeRbCmtylNxc4i+PErfP96Gc7VjUn8=;
 b=NFUAJYr/Y70aRBVqYI6MlUOLKO8/aSYq8y/s6Ixcv886KCyHkw4SUA2pBHu6jQ+3TFXrRn1eERXSP2iuj5zi8y1zVg8vf9V0zAvndMwsD9wCQ4xedpTDfpg0DStpverUbs6RWeUqy+jDbWU5FCzJe+xyf6g/eKeyN9e0Qlt9zbLfHgCRlMlI2qQZdy34jQeszmsBls+nQvRdTfdI4TVQnHJjH9DIWVFeiJppfl8d2vnF4Mb5RCdRsXAh1VIefmnrTW5aOfnECgRb/mXaF9BmmYQnN8doOPmdrGhhkeOlTdz/ybQm48I3V0jW6PLri6BfVz+b7okvt3InYzbTwO/gYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 10:20:15 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:20:15 +0000
Message-ID: <14b94f23-f8af-4e62-9237-d6854448f4f7@intel.com>
Date: Mon, 27 Nov 2023 15:50:08 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
 <20231124122755.91279-3-sujaritha.sundaresan@intel.com>
 <ea1d4d72-b609-4181-bb26-9e0c89ce8dcd@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ea1d4d72-b609-4181-bb26-9e0c89ce8dcd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::13) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 44659948-e427-4533-9897-08dbef327243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Scu+lcx1QVfPsVYK5cphITL+LjzXXfKrf8PS7PscdlDdhO+F+gQpSZqFVkyS2HvXgEIbXhQfd2wWtCzetHiQTI7xsoUxoBmn9MoQhDjd83VW8WItWqKQgt/G1JauOBFDJPc9vORA5bat8PIimbhoYeSVxAvddefi4iJ5/1/M8YaSRvQZ2JdjLL6g+pSSxaxWaey4kSK+73F8zb0dK6CDRmWwPUX+h/qnZPyv3Eyh0l4GxfyXwG5FfSdopJ7lURpRd/5CIsqzN+ptc8ubFT0sDX9C6tWAezs03U/Y26I37HfDCuwV7ryUeFFi7mdcNz/0mVusJCpy8QI5GQNBo0xtUCP+5MylpfMV46wdnwizETkOWy7SyzQTuZjLY6ND/GMZNHU658CH1laf2NNSiBHLaJOialwG/9PuH170IJARwC1nBiP23bWWxh8jDttAARgb62O0hWJVmRrSW+wgzbmzwVJ22vNJ2zul53ASPjPKptqxPkSFx6SZUq04ZJFUXUllLEVqgFrFPSh/zAEuAbS13i42tTKJD222Ceq0N/pHoDhczXwUHdqCQpszvYhro+R369Ogwgfm7N3gwsVKJycQy+sjce1HlX/d7m5ep4jew86Agis3JKTUsLA25Q5Pi1sNHhOWhBGCmqYSw9lgrgBDAdzWZlw6JaJtuH0mPSbXTooDziQr1JwmJJBbzr0v+Lh1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(107886003)(6666004)(478600001)(6512007)(38100700002)(82960400001)(86362001)(31696002)(36756003)(5660300002)(41300700001)(2906002)(66946007)(83380400001)(66556008)(66476007)(316002)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2N1bVc2d1FqT2VhdUduMStmVDJyc1U0ZDNyWDA0MmM1U01KZXNXV0VOT3Jo?=
 =?utf-8?B?SjhNTTFsNFFaRDMycjkrNnZSZnFMZUxJMVIxT2t6UnlEb2dCanZlRlJBdytD?=
 =?utf-8?B?MzZFVnBua2cvT2x1MVVYTkxGTlNPajl3bTJack9TdDZCdmd4VjJxNzlaSHRD?=
 =?utf-8?B?aHRTUk5kWE0vUm8wNUtQRC84M1pFemFPaGoralRuWWxmZFd0dGpndzN3aWc3?=
 =?utf-8?B?N3NGRFBRSnNLVXhkdDFDa0k4cWxxRXAwcmRQYk8xZU5Cd2M1elZnMnJ3RG9G?=
 =?utf-8?B?cEwwbWZMblRBbkF5ZEJyUmJvNXUvNms2aFR3c1czWFdrVWNFNkhsWmwrbTRm?=
 =?utf-8?B?QlBRZEFYRlhjb2tDcTkzMFZPSEh6SE9HQWlSYnF4VGhuaDhZMHN2RWtSS0Y4?=
 =?utf-8?B?SkdmK1VWMUdVaFAxWFRxb0c1UVFNcHZqWkhEZ2ZadkJxQWJPZWE2ek42Kzlv?=
 =?utf-8?B?aGI1Zkh6dDFsdUd1anBWZ2NOL2pxTGs5OWE1ZEtKQThSeDJQYlIwL3dlaUlN?=
 =?utf-8?B?YS8wMlRHYU4rbzVsaHRKKzdQRmttZWtrVFU3Y3Axb1JBbWZYUDZuOU5CYVc3?=
 =?utf-8?B?L2JSTjlHZGhzd3lMSDFCSElMWjZJQVJaR3Q4WitVUC90bVlDVkhHUHVUdmJ6?=
 =?utf-8?B?K01EbTROR0l2anp6clNxWGFJMW9JU3JkbWlaaW1Xb0FoRG9EMHpxZjh3eGVW?=
 =?utf-8?B?dVQvbEZRNFRPTFRTUUVxQXpSdzVQcWhacXdVd3NDZ3p5cFNSTjMySFRHTXVl?=
 =?utf-8?B?YVNkMmVxRjR1SmUxazNwSEdOcFZWaFFHbnZvRFRhR1FZbUVBeVFFRXNXa2E2?=
 =?utf-8?B?TkhDMENVQUhxeHI5QWlBY0E5OWVWT3VLdkJFbFc2cFNMMHVwa29oaVcwaC90?=
 =?utf-8?B?ODJpdHpVcDQ4MEU0OHVnbWN3RzRmK05UbGd3RlpUQUp4ZERnUHg3TEFMeEt6?=
 =?utf-8?B?eDVvRmNBTks4SllRYTZNNW5wYU1uVlNmQi9RNktXUisvaFozOGszNGZ6UUw2?=
 =?utf-8?B?U3hKbG1nbVN5VXRJN2IwcVQzVEtzRm8vSFVMQWF1UkpzcXpqWm5STFNqNjNM?=
 =?utf-8?B?MVNUNlZLaExVUTB3dmYxY2FqVW1SdEFtS2xockUxbGMxVGpWV1lWaGRBVGR0?=
 =?utf-8?B?L2g1WERPWVRZQ1JFUlg4dXdERWx6Q0JjZUozSjYwMzlROEdJUjFRcHVRTkIy?=
 =?utf-8?B?dG9yYW1iUzFVZHVjSjl2UGdhLzE3d2dUWWY0SE9Zdmc5ZzdTRVJ4WXBrTU5l?=
 =?utf-8?B?M2JmMnoyMUp4dHhKVFlJbk9zekY0MzZFWDRKaERQRkIwWmNkR1hmdG5KTFV6?=
 =?utf-8?B?R0wvc2lOTm4xRW1DTnFGYTBiejE4ajJCS0twa28wVm9UbVh2MzVqeElmK1lj?=
 =?utf-8?B?SzJqbTFWY3Z5MHpNZmgzcHlUMmtXeW1oeVFwOWlwTzk3UXVTcWdzbDdTVk40?=
 =?utf-8?B?SXNMNWxpUDNOczJyaHdBZ2UwdUc1TGtZOXp6ZG1BZmFYVDNaT0RId1V1Mlhr?=
 =?utf-8?B?KzlydFlEN1QxeFhDc25ZY3VJemN6d01DTGllT3JaUHhKWE43QWlyOWxlUkR2?=
 =?utf-8?B?RzFWODNvT0FhK1EvNC8rTFFOSXFEMVl5Z25YSXpIUXA0N3hXLzljdjJFQnZr?=
 =?utf-8?B?VDFOUm9TRjR6R2g3WG9ZU3lBMGM5Z2V4anlYdThnTzRyeGtOdExON1pjNXUx?=
 =?utf-8?B?MU5sR1h3TkNXQnE0VGVwWk9QSGk0ZDFqQ1VDUmcvT05HZWlRaks3SVUxS2Q0?=
 =?utf-8?B?T1ZNUXkvR00yQk1aQWdtVlpMNjFyYWpudkR0YXVMR0t4ek5Ma1ZHR3RrUzBP?=
 =?utf-8?B?cmo5UU1QOTFMZzdtbCtBUmhCVUNJNktYR2c0VzdMck5jdXpLNFM2U0RZbmJ2?=
 =?utf-8?B?d203RXUwRjB6WHlWTDNwK3RJa1BKVlh6UDAwY1Z0M01EZUhrblZVeEJIbVVv?=
 =?utf-8?B?d25KWGJDSUV2L3V1RnFPUXJSWXl2UGF5Mzc4SFhHck5od1pZbldOaSt4Yzdq?=
 =?utf-8?B?Smh0YlJCcDJibXZ5TnpFUmxxZFdHU0pJMWQyeEV2L3I1NkI0d3MzZDRKdW9r?=
 =?utf-8?B?RmJWeHRScmZQQkp6Z0c5WDlORXFVSjRScStZbCtpWmhBZGZtbUt5NW9zazJv?=
 =?utf-8?B?ajhlTUhqZVlEN3A0djNIL3VFUlFIbE1JZHhwZ3NHd01CTFVXdnNDeU5jT0VD?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44659948-e427-4533-9897-08dbef327243
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:20:15.0817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHTQ4CfQ6n83rNZRi2AOtuzUwBBsVz3be9GI6EkU386seR6xSP/ou/sQZzF+aQgSyqYm+3Ut3m+F6lvU5LraEj1g/G/jVRGWGlDOD5Kx42A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add vram frequency sysfs
 attributes
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/27/2023 3:30 PM, Riana Tauro wrote:
> Hi Suja
>
> There is an error on module unload.
>
> [ 1042.525614] ------------[ cut here ]------------
> [ 1042.525622] kernfs: can not remove 'physical_vram_size_bytes', no 
> directory
> [ 1042.525641] WARNING: CPU: 3 PID: 2234 at fs/kernfs/dir.c:1662 
> kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.525965] Call Trace:
> [ 1042.525970]  <TASK>
> [ 1042.525976]  ? __warn+0xa5/0x200
> [ 1042.525986]  ? kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.525996]  ? report_bug+0x216/0x220
> [ 1042.526011]  ? handle_bug+0x3c/0x70
> [ 1042.526018]  ? exc_invalid_op+0x18/0x50
> [ 1042.526025]  ? asm_exc_invalid_op+0x1a/0x20
> [ 1042.526033]  ? __pfx_tile_sysfs_fini+0x10/0x10 [xe]
> [ 1042.526275]  ? irq_work_claim+0x1e/0x40
> [ 1042.526288]  ? kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.526298]  ? kernfs_remove_by_name_ns+0xb3/0xc0
> [ 1042.526310]  tile_sysfs_fini+0x1e/0x40 [xe]
> [ 1042.526515]  drm_managed_release+0x117/0x250 [drm]
> [ 1042.526626]  drm_dev_release+0x49/0x60 [drm]
> [ 1042.526723]  release_nodes+0x59/0x190
> [ 1042.526731]  ? lockdep_hardirqs_on_prepare+0x136/0x210
> [ 1042.526739]  ? _raw_spin_unlock_irqrestore+0x51/0x70
> [ 1042.526752]  devres_release_all+0xf8/0x140
> [ 1042.526761]  ? __pfx_devres_release_all+0x10/0x10
> [ 1042.526779]  device_unbind_cleanup+0x16/0xc0
> [ 1042.526788]  device_release_driver_internal+0x10d/0x160
> [ 1042.526799]  unbind_store+0x98/0xa0
> [ 1042.526809]  ? __pfx_sysfs_kf_write+0x10/0x10
> [ 1042.526815]  kernfs_fop_write_iter+0x1bc/0x260
> [ 1042.526828]  vfs_write+0x553/0x770
> [ 1042.526839]  ? __pfx_vfs_write+0x10/0x10
> [ 1042.526850]  ? do_sys_openat2+0x266/0x350
> [ 1042.526867]  ? __fget_light+0x9e/0x100
> [ 1042.526882]  ksys_write+0xc7/0x170
> [ 1042.526889]  ? __pfx_ksys_write+0x10/0x10
> [ 1042.526895]  ? mark_held_locks+0x24/0x90
> [ 1042.526906]  ? lockdep_hardirqs_on_prepare+0x136/0x210
> [ 1042.526920]  do_syscall_64+0x3c/0x90
> [ 1042.526929]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>
>
> On 11/24/2023 5:57 PM, Sujaritha Sundaresan wrote:
>> Add vram frequency sysfs attributes under the below hierarchy;
>>
>> /device/tile<n>/memory/freq
>>             |-vram_rp0_freq
>>             |-vram_rpn_freq
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 78 +++++++++++++++++++++++++++++-
>>   2 files changed, 84 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 5935cfe30204..edde5335bdb1 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,14 @@
>>   #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed point 
>> format */
>>   #define        POWER_SETUP_I1_DATA_MASK        REG_GENMASK(15, 0)
>>   +#define   XEHP_PCODE_FREQUENCY_CONFIG 0x6e    /* xehp, pvc */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
>> +
>>   struct pcode_err_decode {
>>       int errno;
>>       const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index f354c8b2bfc6..ddf5072c40eb 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -7,9 +7,14 @@
>>   #include <linux/sysfs.h>
>>   #include <drm/drm_managed.h>
>>   +#include "xe_gt_types.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   #include "xe_tile.h"
>>   #include "xe_tile_sysfs.h"
>>   +#define GT_FREQUENCY_MULTIPLIER        50
>> +
>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>>   {
>>       kfree(kobj);
>> @@ -35,11 +40,72 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>>   static const struct attribute *physical_memsize_attr =
>>       &dev_attr_physical_vram_size_bytes.attr;
>>   +static ssize_t vram_rp0_freq_show(struct device *kdev, struct 
>> device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct kobject *kobj = &kdev->kobj;
>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, 
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +    val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(vram_rp0_freq);
>> +
>> +static ssize_t vram_rpn_freq_show(struct device *kdev, struct 
>> device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct kobject *kobj = &kdev->kobj;
>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> +    struct xe_gt *gt = tile->primary_gt;
>> +    u32 val, mbox;
>> +    int err;
>> +
>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, 
>> XEHP_PCODE_FREQUENCY_CONFIG)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1, 
>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>> +
>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>> +    if (err)
>> +        return err;
>> +
>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +    val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +    return sysfs_emit(buf, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(vram_rpn_freq);
>> +
>> +static struct attribute *vram_freq_attrs[] = {
>> +    &dev_attr_vram_rp0_freq.attr,
>> +    &dev_attr_vram_rpn_freq.attr,
>> +    NULL
>> +};
>> +
>> +static const struct attribute_group freq_group_attrs = {
>> +    .name = "freq",
>> +    .attrs = vram_freq_attrs,
>> +};
>> +
>>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>>   {
>> -    struct xe_tile *tile = arg;
>> +    struct kobject *kobj = arg;
>>   -    kobject_put(tile->sysfs);
>> +    sysfs_remove_file(kobj, physical_memsize_attr);
>> +    sysfs_remove_group(kobj, &freq_group_attrs);
>> +    kobject_put(kobj);
>>   }
>>     void xe_tile_sysfs_init(struct xe_tile *tile)
>> @@ -77,6 +143,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>           drm_warn(&xe->drm,
>>                "Sysfs creation to read addr_range per tile failed\n");
>>   +    if (xe->info.platform == XE_PVC) {
>> +    err = sysfs_create_group(kobj, &freq_group_attrs);
> indentation
Will fix
> Also we are using two different methods of creating subdir in a single 
> file. Should be uniform
>
> Thanks
> Riana

Hmm I would disagree. We can use the kobj creation for the parent and 
use the attribute_group

for sub-directories within the new parent.

Thanks,

Suja

>> +        if (err) {
>> +            drm_warn(&xe->drm, "failed to register vram freq sysfs, 
>> err: %d\n", err);
>> +            return;
>> +        }
>> +    }
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>       if (err) {
>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
