Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1245FCD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 21:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F7810E36D;
	Thu,  4 Apr 2024 21:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/yEiW8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01E410E36D
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712264868; x=1743800868;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ekCAA2jrXyRr0vvb83rkFBQe6bBc32ddfB1xRlF9wEo=;
 b=Z/yEiW8KMErBEm0x6/fMRhqhqJ/tbRVrCRDY97NdvIuZvTBuWn1T1w5Z
 +hIIdGBfzSJmWNphLRZnLywuXQ0emASXfOi6Ds3Rxgdco1qfDRF+o2zJV
 6t2OUrZmj+ln9z60Ult0K0YJ0F/GBZ0VBftMFBSKMWt/npoPuP77OOMkM
 ZME21BKwm5/Qgi5MMGz3U5VENsbFjTNbgWRNkSEP8RGaOazfkyhLXBFzk
 xAXNrAF0mI/aEb3LOHH4jCO1F+llwKFxv77xnqkwTypP6+pLbJ+X6nouP
 8uCyWgqLVQO0HZqavocIkNi8Or+5LeRFvvfrRUaGvVLjZy05ISt+yqQN8 w==;
X-CSE-ConnectionGUID: OBjJn1w5QQKOvaDn8wGmSA==
X-CSE-MsgGUID: p1+Y3dnVTDu/ojFgqwre8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7678509"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7678509"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 14:07:48 -0700
X-CSE-ConnectionGUID: FrDw2ypHTNW2xNu8PmzRng==
X-CSE-MsgGUID: AR3RD42tRiiz4ThELBMU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18887071"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 14:07:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 14:07:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 14:07:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 14:07:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 14:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bntRJqIylFaXFrMP7GtmrjOUqfUjEYiP7fSa57/TBqtvAArBgOF7NZf4YsGQj7Z0AowfR9+cFaVS0VVTboNgVtQljZyvcf/ceeSgcZI+G5zA0WSk4+1TlV9JBPDPuxRMr3GesPrOV6pDbKOrYNs6c9bjbgVSyIrOitwoF0uRphsvEbEc56DkZ0ryUcs6eyjngir9n6gGE4TloVS5uTtktgZV2YMzXmmgEXq05rig6gdg7S514r3gWLK1iXV3xYVW/Ya40DLTL5ou5wIs+yTVINERo/VJtmEn0BV1Fmlwc1ZcrUIiZ9ieAAE0yk78rE5+4Po24eRo0C2FpXxGXuXV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hnmb1qU6ZscG7dLQyNGDMFOkIwz+nJdLKORWN02P1S4=;
 b=Y3e8mdg3AcOoK4iA1s3TAr21jsbYWvzl9IiAZOrN/v1xvZISUmCYsha10kjz/B/OPULDUzCNT1Y/rROsBmFsR5KBvHwC+RIZ+SkEy2oy5bkDcQ1nkGV22lQ53uaAHcu37LaQSqgz3LepXgF321GDUk1zDtfkRuTy8vZNs28aXbcFQcOZ77ui+xOBfgqVvVKjFgDoLwp5vU2KsodAztzHRuKW0+PQlQAUWGkB/CBbOIluqrrK7wyFq0hB+KaFMX2sQeOVDyer7jFI7Jl5bsTeaCcSEJCS+lODXJwKhodtlg2lN4HrXg2MkLUVI60S8iYO6guYextb6uipw9qoNI+2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 4 Apr
 2024 21:07:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 21:07:44 +0000
Date: Thu, 4 Apr 2024 16:07:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Port over the slow GuC loading
 support from i915
Message-ID: <szwu5jcjlxv44lptdk7ua5heb3vn5ubimhqukkd2rne23hejgv@q5k2tdar55d6>
X-Patchwork-Hint: comment
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
 <20240228011002.2454419-3-John.C.Harrison@Intel.com>
 <wj5shvj6oc5zdk6katkqanztp5jmbfyt6i34r44irtaph2gzf4@f6z5qdkfeg27>
 <090d6d4b-1918-4355-9f42-7e696f89987a@intel.com>
 <3zgavkspngk4exetckvv63delpiwtibyxndlfig63zm53ccojh@s7mm7jcp3q6x>
 <eb436c04-861e-41ea-8fa0-28c4fd367902@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb436c04-861e-41ea-8fa0-28c4fd367902@intel.com>
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7887:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23oY/a0YzEj3rgwf0BkuHLj7wkWa065dL+gxu0CZwGhZ/uSLdNXHGOfxcfL9ejtj6+ZZUOJJIx9O913OeTAEOdQ5q01V2/bukF2dKlz+aYWIEsO6uEdAZP2GYzmpFXXMTseUyiLnzljVfC7DgoCdHOxH1R1nzdg1K/9gRSs7gEoUEXI3f29WU9+XM3VARIZ44su7DrnVD5SXJ/Qo2KyGtzzpy+MX2y7PdP1xGTs9X6RoqChnaOkxHilwxU2307SKJViGI3q4/zyxHeDL4n9X/pD6Cxf9dMRAhmCDwGjM0TMzdXCX9KqLwlIJJOV820EYsidBQfrhSw2HeZhRXDFKqPwrgSpJnA6Gv0i5jhhecsL7v0U8iRYUY1UIcO23UyDJ07uhDVmRiIWyVnkHbN9dbJ/lhYCFJ/Efw/eVqdvxyKXAEhhQYd3FfypRCdeOyNG0bwWDA9YuWiz8Mp+A4L5tCJg1bWCrSliV7YgDzq57Fk0sYIfj4MjKgocJKtte0KmVTr710JhC4aER5ZdPuYFLFkorcGvYTsTX8RhK7vTnnlQAiUpdPsFXTGt9FB07djNE/YEGfvdLB7qyXhT74T/CSwD2TQyld4ONlvu87aIGboEY4WnBOU/GiwGHQlGHdAy8EV7X5x9o4+O6WbWZ9qoAW9T+Ta3Go7LsJEZXC3BvbUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KrpqNIF5nvAmz0qJTjhi+wlggRJC5wJPUDVLN0Gvpx7YwSMtIFGuy6hYLB?=
 =?iso-8859-1?Q?UQO+A6VtvC+6j4TL1IEhK9edwASc3523zmvSxTY30Gan9F84hEAP/gtdbQ?=
 =?iso-8859-1?Q?xFPSJxnxiTMeVTObfGP6NlFZvKdaeAcdE9dobX7w1fOXj2zQhz3N3rjaU/?=
 =?iso-8859-1?Q?IaLGjBEXONw1NUmB6GgquhKsmjC7wHWr4AJQ2/e2sZrcJeVBuA1y1MRyZ/?=
 =?iso-8859-1?Q?0RBDYA6bhJUS567wV6DpG8zcsoWRBUXHpQ+rxhKNoeMpxvW/OjHgnkGYUf?=
 =?iso-8859-1?Q?Ih4APogcaUMuURFOMTnUI8ZF57i2niW/3s+mSxWAcfT2E+hpulNyvMp2Eh?=
 =?iso-8859-1?Q?4TagqNAUvM77RJCiwTN+T8XC4Zynk1ulcHzaCFjym4Kfug5EIJVRUYkVb7?=
 =?iso-8859-1?Q?Z+1Uj38oFUglQYnuyvtT28tVIl/k5At6/R7Z2ge80CNWjm/d157J2BHWJn?=
 =?iso-8859-1?Q?LOFO5t8X6K7NthO9polq6e2gTkZd3RHae+M8fpLUXznWt213QMocietcNS?=
 =?iso-8859-1?Q?+ZmKmg/ISmV5GP+WvFLDGkhN8sELkC8Ke5IAaVVMMiBJsKJbJejy7nryK6?=
 =?iso-8859-1?Q?MXXulatJJk8BcE+snGtoKOj2wOk39Irue5ns3dTSNIp1M3v6X4k/pdw+/9?=
 =?iso-8859-1?Q?oZujYS3HMelei5MJqTAAlqgNJD34m0/EoEzVkmghKkCPIzx44BLV3oC8gb?=
 =?iso-8859-1?Q?RXrvtewdyaiFfDwg5rh3dMRmso7dsgNYKE1Ol82+H2aqCr69UynFkkwQ43?=
 =?iso-8859-1?Q?R84L5o1Y/T+/pmITZBd5LbD9/O2c1FMWaGf2zK1lil0q3TBmJbnBU7XY5N?=
 =?iso-8859-1?Q?dHQMeYNq8afJabcty892jVwxllTQJ2h9jCaXr2FqIYx2KMICh4Pdh3PJg1?=
 =?iso-8859-1?Q?IXQIK2bXeQ2oXRfY74FU0nuf/ZOEubr6L24gh8GmipDGkALmpO8h1pMrG+?=
 =?iso-8859-1?Q?RbffcvjQH+GRP2VczVmFgEh6Kwh0iHubTzbzqhs9wp0v611e0Vhr5CGBs2?=
 =?iso-8859-1?Q?l2f9naWSpchDgAjzS5qH+pV+qJmpI/tOyJyNTpFrXMyp/MPWFWsZGvkmm2?=
 =?iso-8859-1?Q?8t/izVgJwH/r7UdrXa/fPitAx4yIkvvHJWfm/ZNaflAu3yQPo/ffbYsZPc?=
 =?iso-8859-1?Q?grjF4UZvWbVKcVtdjdeYBrzoOanFX41j9nu+VwWB0szQDRoRwcAVR5zwMq?=
 =?iso-8859-1?Q?+AV9UiTi8neDKwQQdVFna7fHRI8zqPgsYQ19v9bImJzyC55jEeKp6lrjZK?=
 =?iso-8859-1?Q?dvPZOZr+O3fMi0fGasGrg5t1xAsNTw1jqV5LFDxxGPfWuz+qbRIoxVpbRm?=
 =?iso-8859-1?Q?ySkbyPF+Jq9It1l6AHuR10flteS+8ozNXNOg8KWd5z70pwH8eyRFLxY2L5?=
 =?iso-8859-1?Q?K2qh77M51Kvtvb6SOhPul5ekOo1hF3PXu8+EuaCTlY2gTA2fcvNbPE/gF9?=
 =?iso-8859-1?Q?W1zAPsWOSix/8bcHOkHgNnQTsbPo+KJ8wWGpBzgNM5YlyydUWFuoAHq8ag?=
 =?iso-8859-1?Q?NAtT3yEdTOOgx+n/NSq7uiSRqlX+p4NDq1hlqIWCTnNWwenrSZ+qNx1D3u?=
 =?iso-8859-1?Q?Wyn8aOlNcSZ4UxMVRYtWaybznsUXd8ECJ0YZlN1SVZkBf8dqYji7JlY7v0?=
 =?iso-8859-1?Q?EHjT+vjAZWV7phxuvGMixT/YTFO+q5vnPEA22ThqtKpheJ7q3oJ0KZZg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f079ea-fe58-4f73-5c66-08dc54eb4588
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 21:07:44.2562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR2nY+Y3cl5wo8LxQdXa3g/7anLNjqOJyvAdeq3EkJc6KqT3Tuu6qqh8EyqN7UYkPDLo40knBLJ2+NqRtc1uPjc6wX1K5henaiVp9Zi0d94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

On Thu, Apr 04, 2024 at 01:11:34PM -0700, John Harrison wrote:
>On 4/4/2024 13:03, Lucas De Marchi wrote:
>>On Thu, Apr 04, 2024 at 12:52:45PM -0700, John Harrison wrote:
>>>On 4/4/2024 12:19, Lucas De Marchi wrote:
>>>>On Tue, Feb 27, 2024 at 05:09:56PM -0800, 
>>>>John.C.Harrison@Intel.com wrote:
>>>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>>GuC loading can take longer than it is supposed to for various
>>>>>reasons. So add in the code to cope with that and to report it when it
>>>>>happens. There are also many different reasons why GuC loading can
>>>>>fail, so add in the code for checking for those and for reporting
>>>>>issues in a meaningful manner rather than just hitting a timeout and
>>>>>saying 'fail: status = %x'.
>>>>>
>>>>>Also, remove the 'FIXME' comment about an i915 bug that has never been
>>>>>applicable to Xe!
>>>>>
>>>>>v2: Actually report the requested and granted frequencies rather than
>>>>>showing granted twice (review feedback from Badal).
>>>>>v3: Locally code all the timeout and end condition handling because a
>>>>>helper function is not allowed (review feedback from Lucas/Rodrigo).
>>>>>
>>>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>---
>>>>>drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 ++-
>>>>>drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>>>drivers/gpu/drm/xe/xe_guc.c             | 226 +++++++++++++++++++-----
>>>>>drivers/gpu/drm/xe/xe_mmio.c            |  61 +++++++
>>>>>drivers/gpu/drm/xe/xe_mmio.h            |   2 +
>>>>>5 files changed, 274 insertions(+), 43 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>>>b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>>>index ec83551bf9c0..d0b5fed6876f 100644
>>>>>--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>>>+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>>>@@ -7,8 +7,12 @@
>>>>>#define _ABI_GUC_ERRORS_ABI_H
>>>>>
>>>>>enum xe_guc_response_status {
>>>>>-    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>>>-    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>>>+    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>>>>+    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>>>>+    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>>>>+    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>>>>+    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>>>>+    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>>>};
>>>>>
>>>>>enum xe_guc_load_status {
>>>>>@@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>>>    XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>>>    XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>>>    XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>>>    XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>>>>@@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>>>    XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>>>};
>>>>>
>>>>>+enum xe_bootrom_load_status {
>>>>>+    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>>>>+    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>>>>+    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>>>>+    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>>>>+    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>>>>+    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>>>>+    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>>>>+    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>>>>+    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>>>>+    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>>>>+    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>>>>+    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>>>>+};
>>>>>+
>>>>>#endif
>>>>>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>>>b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>index 4e7f809d2b00..2e54c9e6a4fe 100644
>>>>>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>>>@@ -40,6 +40,8 @@
>>>>>#define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>>>#define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>>
>>>>>+#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>>>+
>>>>>#define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>>>#define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>>>#define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>>index 0d2a2dd13f11..771971110600 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>@@ -17,6 +17,7 @@
>>>>>#include "xe_device.h"
>>>>>#include "xe_force_wake.h"
>>>>>#include "xe_gt.h"
>>>>>+#include "xe_gt_throttle.h"
>>>>>#include "xe_guc_ads.h"
>>>>>#include "xe_guc_ct.h"
>>>>>#include "xe_guc_hwconfig.h"
>>>>>@@ -461,58 +462,201 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>>>    return 0;
>>>>>}
>>>>>
>>>>>-static int guc_wait_ucode(struct xe_guc *guc)
>>>>>+/*
>>>>>+ * Check a previously read GuC status register (GUC_STATUS) 
>>>>>looking for
>>>>>+ * known terminal states (either completion or failure) of either the
>>>>>+ * microkernel status field or the boot ROM status field. 
>>>>>Returns +1 for
>>>>>+ * successful completion, -1 for failure and 0 for any 
>>>>>intermediate state.
>>>>>+ */
>>>>>+static int guc_load_done(u32 status)
>>>>>{
>>>>>-    struct xe_device *xe = guc_to_xe(guc);
>>>>>-    u32 status;
>>>>>-    int ret;
>>>>>+    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>>>>+    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>>>>+
>>>>>+    switch (uk_val) {
>>>>>+    case XE_GUC_LOAD_STATUS_READY:
>>>>>+        return 1;
>>>>>+
>>>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>>>+    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>>>+    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>>>+    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>>>+    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>>>+    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>>>+    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>>>+    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>>>+        return -1;
>>>>>+    }
>>>>>+
>>>>>+    switch (br_val) {
>>>>>+    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>>>+    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>>>+    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>>>+    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>>>+    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>>>+    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>>>+    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>>>+    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>>>+    case XE_BOOTROM_STATUS_EXCEPTION:
>>>>>+    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>>>+        return -1;
>>>>>+    }
>>>>>+
>>>>>+    return 0;
>>>>>+}
>>>>>+
>>>>>+static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>>>>+{
>>>>>+    u32 freq;
>>>>>+    int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>>>>>+
>>>>>+    return ret ? ret : freq;
>>>>>+}
>>>>>+
>>>>>+/*
>>>>>+ * Wait for the GuC to start up.
>>>>>+ *
>>>>>+ * Measurements indicate this should take no more than 20ms 
>>>>>(assuming the GT
>>>>>+ * clock is at maximum frequency). However, thermal 
>>>>>throttling and other issues
>>>>>+ * can prevent the clock hitting max and thus making the load 
>>>>>take significantly
>>>>>+ * longer. Indeed, if the GT is clamped to minimum frequency 
>>>>>then the load times
>>>>>+ * can be in the seconds range. As, there is a limit on how 
>>>>>long an individual
>>>>
>>>>                    ^ that comma seems misplaced
>>>>
>>>>>+ * usleep_range() can wait for, the wait is wrapped in a 
>>>>>loop. The loop count
>>>>>+ * is increased for debug builds so that problems can be 
>>>>>detected and analysed.
>>>>>+ * For release builds, the timeout is kept short so that 
>>>>>user's don't wait
>>>>>+ * forever to find out there is a problem. In either case, if 
>>>>>the load took longer
>>>>>+ * than is reasonable even with some 'sensible' throttling, 
>>>>>then flag a warning
>>>>>+ * because something is not right.
>>>>>+ *
>>>>>+ * Note that the only reason an end user should hit the 
>>>>>timeout is in case of
>>>>>+ * extreme thermal throttling. And a system that is that hot 
>>>>>during boot is
>>>>>+ * probably dead anyway!
>>>>>+ */
>>>>>+#if defined(CONFIG_DRM_XE_DEBUG)
>>>>>+#define GUC_LOAD_RETRY_LIMIT    20
>>>>>+#else
>>>>>+#define GUC_LOAD_RETRY_LIMIT    3
>>>>>+#endif
>>>>
>>>>just sent a comment on this reasoning in the previous version.
>>>>Continuing from here.
>>>>
>>>>>+#define GUC_LOAD_TIME_WARN      200
>>>>
>>>>let's also add the unit, _MSEC
>>>>
>>>>Also, comment above says 20, but here we warn on 200. Is that 10x
>>>>difference a typo or intended?
>>>It's a safety margin to allow for situations such as a system that 
>>>just rebooted due to thermal shutdown and is still running hot and 
>>>therefore slow. I'll update the comment above to explain.
>>>
>>>>
>>>>>
>>>>>+static int guc_wait_ucode(struct xe_guc *guc)
>>>>>+{
>>>>>+    struct xe_gt *gt = guc_to_gt(guc);
>>>>>+    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>>>>+    ktime_t before, after, delta;
>>>>>+    int load_done;
>>>>>+    u32 status = 0;
>>>>>+    int ret, count;
>>>>>+    u64 delta_ms;
>>>>>+    u32 before_freq;
>>>>>+
>>>>>+    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>>>>+    before = ktime_get();
>>>>>    /*
>>>>>-     * Wait for the GuC to start up.
>>>>>-     * NB: Docs recommend not using the interrupt for completion.
>>>>>-     * Measurements indicate this should take no more than 20ms
>>>>>-     * (assuming the GT clock is at maximum frequency). So, a
>>>>>-     * timeout here indicates that the GuC has failed and is 
>>>>>unusable.
>>>>>-     * (Higher levels of the driver may decide to reset the GuC and
>>>>>-     * attempt the ucode load again if this happens.)
>>>>>-     *
>>>>>-     * FIXME: There is a known (but exceedingly unlikely) 
>>>>>race condition
>>>>>-     * where the asynchronous frequency management code could reduce
>>>>>-     * the GT clock while a GuC reload is in progress (during a full
>>>>>-     * GT reset). A fix is in progress but there are complex locking
>>>>>-     * issues to be resolved. In the meantime bump the timeout to
>>>>>-     * 200ms. Even at slowest clock, this should be sufficient. And
>>>>>-     * in the working case, a larger timeout makes no difference.
>>>>>+     * Note, can't use any kind of timing information from 
>>>>>the call to xe_mmio_wait.
>>>>>+     * It could return a thousand intermediate stages at 
>>>>>random times. Instead, must
>>>>>+     * manually track the total time taken and locally 
>>>>>implement the timeout.
>>>>
>>>>that's something we may improve in future with a variant with a better
>>>>variant of this function to be used on loops.
>>>
>>>Or maybe a variant which allows a custom comparison function to be 
>>>passed in and keeps all the time tracking internal...
>>
>>yep, that would be ok I think. Do you want to give this a shot?
>>
>>Lucas De Marchi
>
>Um. That's exactly what it was using to start with and exactly what 
>got shot down as not being allowed at all ever under any 
>circumstances.


no, that was not the version 1. Pasting here from version 1:

	diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
	index daf56c846d03..eac8f2c9fba5 100644
	--- a/drivers/gpu/drm/xe/xe_macros.h
	+++ b/drivers/gpu/drm/xe/xe_macros.h
	@@ -15,4 +15,36 @@
				    "Ioctl argument check failed at %s:%d: %s", \
				    __FILE__, __LINE__, #cond), 1))

	+/*
	+ * xe_wait_for - magic wait macro
	+ *
	+ * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
	+ * important that we check the condition again after having timed out, since the
	+ * timeout could be due to preemption or similar and we've never had a chance to
	+ * check the condition before the timeout.
	+ */
	+#define xe_wait_for(COND, US) ({ \

What I'm telling is to have a xe_mmio_wait() variant that is in the
proper namespace, wait on a mmio, etc. They can even share part of the implementation
inside xe_mmio.c. Currently the only wait condition is == value. Having
a different wait condition as return from a functor is not the same thing
as starting a kitchen-sink-header.h. That's what the push back was on.

Lucas De Marchi

>
>John.
>
>>
>>>
>>>>
>>>>>     */
>>>>>-    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>>>>>-                 FIELD_PREP(GS_UKERNEL_MASK, 
>>>>>XE_GUC_LOAD_STATUS_READY),
>>>>>-                 200000, &status, false);
>>>>>+    do {
>>>>>+        u32 last_status = status & (GS_UKERNEL_MASK | 
>>>>>GS_BOOTROM_MASK);
>>>>>
>>>>>-    if (ret) {
>>>>>-        struct drm_device *drm = &xe->drm;
>>>>>-
>>>>>-        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>>>>>-        drm_info(drm, "GuC load failed: status: Reset = %d, 
>>>>>BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 
>>>>>0x%02X\n",
>>>>>-             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>>>-             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>>>-             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>>>>-             REG_FIELD_GET(GS_MIA_MASK, status),
>>>>>-             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>>>-
>>>>>-        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>>>>-            drm_info(drm, "GuC firmware signature 
>>>>>verification failed\n");
>>>>>+        /*
>>>>>+         * Wait for any change (intermediate or terminal) in 
>>>>>the status register.
>>>>>+         * Note, the return value is a don't care. The only 
>>>>>failure code is timeout
>>>>>+         * but the timeouts need to be accumulated over all 
>>>>>the intermediate partial
>>>>>+         * timeouts rather than allowing a huge timeout each 
>>>>>time. So basically, need
>>>>>+         * to treat a timeout no different to a value change.
>>>>>+         */
>>>>>+        xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | 
>>>>>GS_BOOTROM_MASK,
>>>>>+                   last_status, 1000 * 1000, &status, false);
>>>>
>>>>if I understood correctly the meaning of this function, it would better
>>>>be called xe_mmio_wait32_mask() or xe_mmio_wait32_field()?
>>>>
>>>>i.e. you provide the mask (GS_UKERNEL_MASK | GS_BOOTROM_MASK)
>>>>and the previous register value and you wait for a change
>>>>in that field of the register. Is that the correct meaning of the
>>>>function?
>>>The test is 'read != given'. That sounds like a not to me. A _mask 
>>>or _field suffix (to me) would imply just that the regular wait 
>>>semantics are applied with a mask or to a specific field (which is 
>>>already the case, isn't it?). I.e. wait until '(read & mask) == 
>>>given' or even '(read & mask) == (given << shift)' for a field 
>>>version. This is the negative version of that test. It must wait 
>>>until the value has changed, i.e. is not equal to the given 
>>>target.
>>>
>>>>
>>>>ugh... this bool value to show atomic or otherwise shouldn't be there
>>>>(but it's pre-existent issue).
>>>Feel free to fix the baseline xe_mmio_wait32 function. I'm just 
>>>copying that and trying to stay as close as possible but just 
>>>inverting the comparison logic.
>>>
>>>John.
>>>
>>>>
>>>>Lucas De Marchi
>>>
>
