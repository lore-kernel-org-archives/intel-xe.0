Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDF6C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D65410E262;
	Fri, 14 Mar 2025 13:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j36zhxxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6FE10E262
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741959884; x=1773495884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s9g7OSXk1dgkM6joFHe86Rytsw9XODGaEegaCqmOqC4=;
 b=j36zhxxluaJCvKCc9X5SRk7jaialp2hb+oLATnr8OtuwLUqNJ/EBVowL
 axAfIbLZvQP+mOp4hgKj48Pphbtq5AtZaMe+MgL867xJ+EFPX+yNV6shK
 r1YTUxZ73tESTTUWGNY4B9mSXAJWVBhYRg0BX0AYzJEGprOuwq2CwpBBp
 fS1f7NTWmo280eADKmAULndisCDg3oS63q4LwC8VRjKNHQ0crCYQR1Czi
 fOy5pURNyZuGyvTDXZ0VFX8PkDppqnhSd3VD4YAGPpZ6UFs9xtK0CsT4o
 Ax3aknk4xKwNeWnfzQIpl651YzojFw4CV8UKfJqnAwvWtdkKsbKia7aWM w==;
X-CSE-ConnectionGUID: lVKEQPFXQ3ujScpo+5JLUw==
X-CSE-MsgGUID: 8grqtvWyTy6ftgT3aW6m1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53317000"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="53317000"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:44:44 -0700
X-CSE-ConnectionGUID: 6uIhsxaCRJuIyY+iT6mc1A==
X-CSE-MsgGUID: URTvoDIAS5WfaJf7FO/Hrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="144470961"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:44:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 06:44:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 06:44:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 06:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzjVQM38YzVCKexiQa1gHTR5otGC3FfcCsJcLsRPop1de+GMELfxMxCor9XYEEABUUvQMO1UuHXHbkI2OKVbqMacvwyst4WmKXW6UadWT8NiO0PwQASEWwIO/p4a8YU8ITvxZP/7zn2YEcr8VWtTkaItGUyTivjeedBrUFLXFLile3O2DZFblZbcf7A4q6AW/WtpPTGiU8H5q6bgSJY9+uwiZweByg3rCFuWn1UN8eic20x619UsZQl02IWEN704ztnLgHpZ2NmjuYvtDk2UpDm2mfAo5OsWCNB27mDXvxwUjzDcbvOeSndI9eEl8KT1jKeM/PkOyqiwJPjrVve/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzfAQEdyHG5e9Ry7xiBmrweqBXOQ9GYT1zQXlOV6cgE=;
 b=GpZ23beQyL95IbE25GHhSCUNdC7WRz2gaU1nhfvPquSw/6X5fLHYffpMmPTbq/6KyWbuTBMWnLjpyyJe8sTGO7Z9qx1xH0cF2w/dOo7pBx5xz+by6dG+0hF6w/EjI9bsTQT+U2QjLnE2CY3OXSLxi4Rifejc1S0atTo4lF1ByTN/enUYpCUV5oKZPl/XKYi/CXQ5A9S9R6gFbld/bbWiORw5J6jLLTAVMcbnqoIr2v3VB3gIFMWhYspO//GBK1/r+cTKxFxo1c70mIW+Jv8tDeAKAuuvIWA+bpYkYnW7ezSiD1WM0mPaXFzEqPU2DsQCLSRTAlpDJR1NEwzonAxocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 13:44:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 13:44:01 +0000
Date: Fri, 14 Mar 2025 08:43:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: intel-xe <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Move survivability back to xe
Message-ID: <y6rbr5nmt5axbdovajwhwcgbhyddegxxa5u45r5bxagfrusjxi@jokiew5ybkny>
X-Patchwork-Hint: comment
References: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
 <20250312-fix-survivability-v3-1-54620dbcbbd7@intel.com>
 <09a8ae02-bd9c-4466-8c0b-b5e6255a8389@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <09a8ae02-bd9c-4466-8c0b-b5e6255a8389@intel.com>
X-ClientProxiedBy: MW2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:907::24)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a0f927-3e18-4143-6c21-08dd62fe46f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5M+OiopVQZ93E+rcpHAwtyY4R+R6Ec3hSS6/wEw/vS/x349V+Wy+TPPfsmJr?=
 =?us-ascii?Q?Xnj7cv0Sx7rfNaMIaZ+bhXgqNm/FKCzHxcfOvKNH5QYWwPWJmEGuP2idCcKL?=
 =?us-ascii?Q?abx9W3l69IttxdivTzjvzPxdfaav3EFPZSlCQmhWT+jIJ0ssgyHhYqzsie4X?=
 =?us-ascii?Q?7JgYTMnQzZlf4dHIbjQGMtVh6r/YWq0gcG7bFx3H19j9yGvuLL2GyDWZoemb?=
 =?us-ascii?Q?3azDb0A2PXdKmBNI2ZMavW4dL9JN+YDrnPEUvdsnGt4F0FfWfoFRwGwBda1l?=
 =?us-ascii?Q?9cRwHRPcSzZC7gEEq3YwBvLGLGVia7dZPDZ3k3LkoqsAY/kpj8wmm487pdyA?=
 =?us-ascii?Q?ihdgeDX/pIi5g+xsSPNA1I3uvt7ObDYtpjC1MCrDEw1ckuo6qbRxeMS8UF4W?=
 =?us-ascii?Q?RIDIwC4rpv4qElbc6U+m/11TAUD39d707rCNdCShf46Q6KCPLZZGHgXJC2P4?=
 =?us-ascii?Q?dD1mml1cxzsKqhnjkXXwPvk7RS+YUW0RrjMY6YH0bEfbZyp+Ucgce3leEoVE?=
 =?us-ascii?Q?weMgeGbsVWy/168Wfqi1yIsehniXx9GuFoxePw/Y9wbViKRWK4ArUYsv3w4p?=
 =?us-ascii?Q?DVrbo5Si8R1WusShK06YUc/1G89Z125b9S3XFb4vzrt8k2pxBV/zlBMLdgT0?=
 =?us-ascii?Q?JPJ4PAV8NDYOijf25t3VTEX3T38OdJGEFBKZdsgtlwqTPHEZOE7GeCmNlb3w?=
 =?us-ascii?Q?DGgtq4eM43FbQ7mhkoOiaYfSlEUVtK+pFJWCRPs3JmFLqC0oTy7OJWIm1xIe?=
 =?us-ascii?Q?0Eo1FQPdno9Oom9dut5PUvP4S2bQSO3QHS7ExusDBuk1Z3J/ibUVMWbuow3O?=
 =?us-ascii?Q?Qv60wfLu0cuiBNJN1kUZcZl8imhjhIFuwkrrpCnSdKWHf8k4qcWuxUJZdkHT?=
 =?us-ascii?Q?mTM7qzVaEXcQHKiYgIB8uOhIybjrKU7bavenNwkTJpXxMRuExOQdb4vVttKc?=
 =?us-ascii?Q?eYzvkOAOiGIaZR0Kvu8CZpucK1k2jjtwSZDCbZqVNTb1jSLKUdoIeiUCCso6?=
 =?us-ascii?Q?gGtSGtXJmAWC5TqGSVo5hwYeNshYpkQv6su+zmIrEWvcOTNwF7TFWPprbDUy?=
 =?us-ascii?Q?EIBNjsBPX1BrpJWioyO8zQWQLbX8BjYKDOIATxdXrirUkf7AvRcWNz4nXSQu?=
 =?us-ascii?Q?49UF9OJDHoKLxdpsp+nlGW2rkkqGX+v0Bp44d+loUq+MA5KCSiOJWBClFjml?=
 =?us-ascii?Q?+v1rpIvWv1xbdhzLwt+SEMF+K7783/2pSOtpjdLhkbN6/MHlu5hstCRhC5BP?=
 =?us-ascii?Q?fEtbm+FGCLU1fXNMIbSyK/DD8NUEwCgWK6TByC3LAw3yWPiWIezTN8Jh0I42?=
 =?us-ascii?Q?ZkpWl92BXLfnNCKZfEZjMPWMXgaaq4coDXKhPhdmC1KwL9YgOjrjHPnwt/5t?=
 =?us-ascii?Q?iOtQupEiDMTY3QYZDsUyFvZfSuz1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XlbSlwxEWUTtNNepouy3rlZGg42TEmFcr3MF06GHwNvN0ywyHUcqje3TxccM?=
 =?us-ascii?Q?PJJDQfk4QRLnLSWC0xQNb5bod9df99jbrpmF1zYjalCISW85u4da08g/EEON?=
 =?us-ascii?Q?h62AJHjtU9J3Jh27QywyVlD4uHmpDG65lKhMK7wcr/9Rmdq5yZo9hfVEvz/e?=
 =?us-ascii?Q?nZqP6E884R2RDOQJlY0U0toOVyK8GQNSz3lQpmtEVkq8g9AOGnUR59RhlGAk?=
 =?us-ascii?Q?ccwwcP3HxYgnPJOeOg9v5Y2TbBlDhamIS1Kxs32BEbLEp91qMEzL9gFNGSKR?=
 =?us-ascii?Q?/Di5CtBbow0TkyJMSFn0SUSBwqsM7VZN6a47DaspDKMj+oj+NQ+kxGU6FUXD?=
 =?us-ascii?Q?PkBsYL6dAK2fhQSHz1qWim0Kag2HDnO10CzwYRT3+fqVBrtZcFTbPABsFiRn?=
 =?us-ascii?Q?cYsfQsvnvmVJcEqPiopx+xk07k7CoPUvx11nzn1t6d+FHqAbOjpnIPIaOCqg?=
 =?us-ascii?Q?oh3dfIknym0Hvn8iqc1KaWJCuJTh7GeXhWHc+ORDshoxZSCqbmbU33fDkFwJ?=
 =?us-ascii?Q?EMp1gpl21Der/hfjY15UPWVhq0I3yb57oV3EVKiwX1h0SEyJpjz6ShzVsXo2?=
 =?us-ascii?Q?XGCXiGmGQOGJ5jhYhg3aYOEAVUkwkLfxXu7Cpt9fqo19nMrMhUh5FIUy/+hm?=
 =?us-ascii?Q?+tm/0B8OFPtq0hMITTL/J8T7gqYwpyCeZnIOt+77ozdFnoNDkPmP38zWLmPz?=
 =?us-ascii?Q?sZpez6Hq3mQMSGpJ8vlyDpdXKPGsgvsjkT+vnegHxWy1079UUHhsGPnkbwyi?=
 =?us-ascii?Q?JCJHj97o7WCpTvKh22mKabL6vSZx1xiv2ysZVlPi+FDscl1ZjHCf8jTW2tAt?=
 =?us-ascii?Q?yYvKpEVaEjGANBzRwQI28v4fG9kL1r+0aax4gGd3NHc4lH/Z1mM3vbLXi+TW?=
 =?us-ascii?Q?Id2qb4tcjJIdsgj1lRIoglNcqxBTiA/uDIPuEpXS4b7ywzIovIRf3rM54gZE?=
 =?us-ascii?Q?FS36jl4lHKWtfkWwUAm3vF2A74Ih9i4C856a0RI23jsZXryrClw8xUF16JVN?=
 =?us-ascii?Q?DhzClKPS8S9KRDk3oDWgwqpJExGkmPd9rGBXHIUSdruFGzE+pluWqQZ4wa6l?=
 =?us-ascii?Q?kX09ewpvnSEcyBH5mpr3rgaLPCKUQgT9FyFzSn+8+lqW1TQzNgXg3D8xXEvP?=
 =?us-ascii?Q?RbVs5BgquW2mkGPtgmdM+ZqbbLWlQySB7HUqm5Ctibw6cpEGy51s04XV5e0q?=
 =?us-ascii?Q?HgCiUjJ/xnR7h+qyBrY66jJl+ZY4Uruk20+7EPDOhAzsmQRFfkVBeo0vfRRG?=
 =?us-ascii?Q?kwh44UL3tciwOHHzsh3keYYH+r4ne1NIts86NcybynmnA/VyKShjEHMnO/1+?=
 =?us-ascii?Q?mlqcFWfHcyHbN0xaIpnF5lb4csSvw0Z9UI/1bC4z9h7BQcB79kbFKzNn9VnO?=
 =?us-ascii?Q?ijFWlQy8YmqdMPlWd01+Dpe7YHqBuxjDKYUcr5jt753Q2SDYPES9SHndoh73?=
 =?us-ascii?Q?pbsTdPDA28UAE9IuO8HAnuSE9+dpjbDgcIoyys2E45+796Ez2/Lf9coMqzuo?=
 =?us-ascii?Q?4ehtdNxt15Y9WwjpRrGkyIqTbDzNihIigSduNESl6JcWkQuvnMD+Y1Z9nU9g?=
 =?us-ascii?Q?m2Uz6oWTMt2oaEAT2YPAfK3iyDKdL/I0Eu0U2bq+xgcLKbQJPdzQXXFKXU3B?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a0f927-3e18-4143-6c21-08dd62fe46f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 13:44:01.0192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t13HNrvLChQylqVNc5CstuUTh6NhVDCHqyTrRnofwRTIBIhcZsGhmuFPiuKyRT1D+edIbez9sLxJcZJXXgHrvv5Y0nxRjN5rHkoch7ifHBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
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

On Thu, Mar 13, 2025 at 11:30:29AM +0530, Riana Tauro wrote:
>>@@ -705,8 +706,20 @@ int xe_device_probe_early(struct xe_device *xe)
>>  	sriov_update_device_info(xe);
>>  	err = xe_pcode_probe_early(xe);
>>-	if (err)
>>+	if (err) {
>>+		int save_err = err;
>>+
>>+		/*
>>+		 * Try to leave device in survivability mode if device is
>>+		 * possible, but still return the previous error for error
>>+		 * propagation
>>+		 */
>>+		err = xe_survivability_mode_enable(xe);
>>+		if (!err)
>>+			return save_err;
>>+
>nit:
>
>This would be better.
>
>if (err)
>   return err;

agreed. I changed that in v4.

>>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>index d939ce70e6fa8..0d57ad1596edf 100644
>>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>@@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>>  	return xe->survivability.mode;
>>  }
>>-/**
>>- * xe_survivability_mode_required - checks if survivability mode is required
>>+/*
>>+ * xe_survivability_mode_requested - check if it's possible to enable
>>+ * survivability mode and requested by HW
>>   * @xe: xe device instance
>>   *
>>- * This function reads the boot status from Pcode
>>+ * This function reads the boot status from Pcode.
>>   *
>>- * Return: true if boot status indicates failure, false otherwise
>>+ * Return: true if boot status indicates failure, false otherwise.
>>   */
>>-bool xe_survivability_mode_required(struct xe_device *xe)
>>+static bool xe_survivability_mode_requested(struct xe_device *xe)
>since this function is static, xe prefix and doc can be removed

yeah.. I do prefer keeping prefixes out for static functions, but it's
kind of a lost battle as it's pretty hard to maintain consistency across
the board. I forgot to change it in v4, I will submit a new one there.

Note however that the docs stay - it's just not kernel-doc anymore
because of:

-/**
+/*

thanks
Lucas De Marchi
