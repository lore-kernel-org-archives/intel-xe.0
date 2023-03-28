Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D86C76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 16:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E756E10E477;
	Tue, 28 Mar 2023 16:28:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C8510E039
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680020929; x=1711556929;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1fflHTmmLnV7gWG4flvDYVYoG6HohT8iZ294DVBrWfI=;
 b=UiCVYFgx2ElkmBhxwYR1wS1EuiYiT0MZ3yU/jJQNWKgyqqQZVoADlbng
 pipTUfzYE6vkrtWv02bbDroB7RisR4hSMw3khLHpn3i6DhZH0pLerxTIB
 Mmqaxk2FEKhtGWVTM60PgIcibvcbeeb5tOu+FW8+P7J0M4F835zR3Zt9P
 z/f6V/LvH9N53osICLnLFTrZ0tQDhySaByrHoUbx25zlMSlsZks9dkdwP
 HbzHuMTDHPLvtQ2PdUTW5klb02vufDUHOm1fp33RyPKUtPCrHcP80w92u
 VHdu9aKWR3jcazSEtNByeVXJAxok4rWcG8VQuphNtsSefYCStzR42cjnw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339341296"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="339341296"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 09:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="748450732"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="748450732"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2023 09:28:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:28:37 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 09:28:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 09:28:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 09:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVXkIz+HydtL5n8elYW0kBmVm6RdDcBExhSxWc0ItsM/x6EVsWMhllRDnljrHJ/ciZTc+Z8LdrmHuhI2YhAtaaVlZ0sITItHzqsQfL8n7uOm/Q3Vw6dsr1opv/MpPWwgdEn8iaqvolVsF/E1NWyYWqcECYHe8ZCfXaMQc4mCFifINLL1mL2/zyy1KI5Fu8g4loS+Cljr6oM/98S8TJm7950eEGWbb1gbPOPtuT+aUJ+xcrJldLga671+cK90BcuKVledU8nT0r56TQlDgnK/EEVMUFdgJaNDVbrBLGunkzERBMXjmM2u/eVGmzbyYmyZqs2QCNY7T07S9o6XRpCh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QkHJFShoFb4/sHEH5VgXDqBzXESCH5ZHUMB36EBpyA=;
 b=WlgHgV5c9TyTfbF0401ASzQNMfQ7LBKEHXoEpgEx4ZQsfXtMm+II3cikwZvKchkubhU8wiKwVU41eFn36V7XnHovdYwxYOUaEYnhjuU6uH3QE8dVcr0dvY4MsFhMRS2B6sEx5XUPXCBP7pkB+6SKkRpDUI1VD6VYjrX7KuYqwXTrFFmsVvqtgFsgY6ioJaCE3BLBsWuuMleVxoB4/1XYkhRXnLyzazvWuviTsaubXnMiM+ioBt/JeN2ZzJxDvjmcYu7++Z306hdqZRaKe6xn+zSA9Ksw5/YKF7zPqfNB1am0vGzUdz6UhU5iJ6PoQ8oZDMsFf/hVDNisQ+T3DLvj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 16:28:32 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337%7]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 16:28:32 +0000
Date: Tue, 28 Mar 2023 09:28:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZCMVqHnJcGan7cn4@nvishwa1-DESK>
References: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9b0145-c9ac-471f-b89f-08db2fa978ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLwMFYl1bUyzuCrQgJxDZXSvXwj0Y1ltgw/NtQX6C1tEbZreA7BRJyIRZwQxe6V/C8DxUz1FNcyeivQ3z7ikr3eNb7592XlM/ObsEBsd0FpjNS6NIxhvHiOCatjRpLOsNynYtDqiKSqxPzqebJo+vdfL2OXCgOHVf/XUG849Od7Esdi8XdFoNnVosVHx6Q2+LoN0mthP2SVONhwfKtmtWCDvv/YcgcNUTkBPbItYDogjPdok7C3a1nxmMqIg0NoYw19TRIY9pnPhDlZJ0p1UeopgWbQe2w9fpCN82jKFyKfuVkdkMvNW96CqYd/g4pl9Y8SFJq083tzqrHw4Mpw5u0CPR2hq80gyWuWdRfwM28KWYG78Yedxs0W+Z/5a+S+XVP0pvT5Z/b48N3hppt8ypCc6YruchkSWn0nQ90xa2rpiDFU/rbszqR4vOtB85Sao39kMFyq9pvz2NVIscyDbhN6vHBm24OQ3lwh0nVptevKPKbOesGdOmrWW69XYeQdekbw9u5xtldZ/JiAH+yv2BhMFKjHmYub4yozoan9mu0GNqOozqLFeayrkV3emN/pp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(86362001)(8936002)(6862004)(478600001)(41300700001)(5660300002)(4744005)(6636002)(4326008)(44832011)(2906002)(66946007)(82960400001)(66476007)(66556008)(316002)(8676002)(6486002)(33716001)(9686003)(186003)(6506007)(6512007)(6666004)(26005)(38100700002)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhzdFpNNEtOWFVWS1FrM2pOd01JUnc4WXpTMENieFZjeGg3VHNIczllMlRw?=
 =?utf-8?B?MTdSWnhBRXRPQVhRWmQ1a0dSYTB1VUJRWUxCNHB4Q1NQbXNkZVJLUlBqUEd2?=
 =?utf-8?B?SHROcmhWNGYxWkdqQUoyNG5xdDF6UlNyWWI3WlJSd3RoWEdrdWljWWY5VmRN?=
 =?utf-8?B?M1EvYUxCc3ZHNXV0bHRtaUlhbFVycjJUa2NIQUFLTEp0aWpwU3A3YXlEdUhH?=
 =?utf-8?B?aHZoaUxYUzFVWVNsZHpJRUdNaUlBdDRFN3kxNitNSkRZc3dXc3ZDZURRMVN6?=
 =?utf-8?B?cDZVY2FCeS9NUm5SMEtGQ0k4SEhtWkFjYStaK0xsei9LQk1ZR1RkTmo1Z2s4?=
 =?utf-8?B?UFFiMktCSlRNWkhaNmg0OWRTcklxbVc2SStLalFqelRaRDZWTlg4WXNYWlgv?=
 =?utf-8?B?MUYrQUswekRDV0RCNGJpcC9TRDRpVkRMSkg5VlBya2xwc2picElZNUdLbXdx?=
 =?utf-8?B?bGFDbXZFczdScElFc2gzb1B6ekE1d0owVnE4WXdua1RuS0owU09iVGlSdU9H?=
 =?utf-8?B?WWRVaVJ2WGFObXk2Z0hpemtUY3l5V3ZGK3NhaFU4d3N6NkgvSDNBU0U2YnA5?=
 =?utf-8?B?bnFkVXpITGI3TjJ5eG5rdHJKY2NaRWVZOVIwN1VPTkUyUzUwdjZIbVQzeEQz?=
 =?utf-8?B?QUJPSGo4YXNzNXZ5UFo0cFhTZExjYmdvWW5sY0pLeFhCa2FENXRKdnlmREMy?=
 =?utf-8?B?RlBGbitQY1lMSjBmWGswV1dIRnpwVGd4dmNLN2RCRDdKWEQ4K2xjZ0FocFRI?=
 =?utf-8?B?bis3UGRvOU03M1d4RTNUWEFSaFpGY3I5b0t1SjhvNzlzbGkzVUo1dE1WWER4?=
 =?utf-8?B?cnd0U2dRa2ZaeVNWKzVkMEZJeGFpbEpUeWg3c3B5cVNXY3FuZUg2Mk94Zi9x?=
 =?utf-8?B?WENkTGkvS2dXT2JncE1uN2Z0RzUwT1N4cFZ6dSsrWk5jVEhTd3JXRkl3dmVt?=
 =?utf-8?B?amFWUndEbE8va1EzakRtcFdad3ltMnJQUm5HUHdqcVFKUmVvdkswK09QL08z?=
 =?utf-8?B?RUI4eDdRNnZEOFlrS3huQm9sQVk3LzFQMW9GbFpwNFcxeWM1bU9xblR5YnQz?=
 =?utf-8?B?b0FaY25acjl1aFhvU1ZxdDVvQ1ZhM2Y4S3lyK1A1MlVyUVdWY3JWNURBcFNm?=
 =?utf-8?B?T3d4b04rTVlEdnRDK05ObWEyN2V1cFhNYTNnVStqbjl3QkxEVkpZclhEakcr?=
 =?utf-8?B?Z2xYZTN3cDlwcGdiZlBzSEhzdjhJY09EZmU3aXcvM3UrYVR6RHU1TEZxVzAz?=
 =?utf-8?B?cEJHeTVNMnROajN6WHE4a1pYZm1mRVhmZWdPNE0zQTFKSy9tVlJJYytIREVr?=
 =?utf-8?B?ekFJWHZKcGRGQU1rRm5NeGFMQ0pGWjBmRFlFalJKY0dLNjBhNmZ6MVJReGQw?=
 =?utf-8?B?UytQL0tZRVY2cUxaZzc0ajkyMSs1ejhKTGxIRlFkemc3YWYzbHYxSEsyU1Bl?=
 =?utf-8?B?d2l4WXBnenRHYjI5aFAzMW1IQjNDMDdoVXoyZVdwQllDRlg0TUdFejRDQyt5?=
 =?utf-8?B?SlZ5eTVjd2QzYUtzWnNmVGVaWmpoOTR3clJQRk9kVUZEMThGdEhhYnEzdFh2?=
 =?utf-8?B?YmZTRENjRjk3OGxSalNjVkZjRmZCejBwTzhvL2xJU1p5NzkwbStZeUp0U0tv?=
 =?utf-8?B?ZzBoSmMzcnNjS2gzcVpRYk1SNGY4eENrVVQxeVFzSzhrWjRlZElIOXMwOGJ4?=
 =?utf-8?B?WXlnMXU5NHVBcTEzbUpPWmFNcVFKNkp1NHRZNTg5UUM4emVyeTlxZVhYRWl2?=
 =?utf-8?B?dmU2cWN4R2xLL0RpQjdnQitlYlNqQXBhT1diS2tQbkdCSUczRUFPTkJhMU1C?=
 =?utf-8?B?TC9xVXVMUkJVa0w2anpGa1ZEVlEzbSswMHRmZ0FXVis2K2puOWVXN2s3SFQz?=
 =?utf-8?B?dW9WVlBkdm04US9ZcnNEK1p4dm9VTjFxOW9VeXdHUHhEbXVJMG52YjFUcDRV?=
 =?utf-8?B?bk9oczdMVG80alBsT05ablRKM1FJNnVPbml2TnMydVFHOHpJRExDeGptRWNs?=
 =?utf-8?B?KzRFOW9FNFZReVhQelBqQUVRanlZY2lsRzhsRzB6S1VaVFdJZ2ZCSWRRMlhy?=
 =?utf-8?B?ZVJBcitRdXNId3h0MHlUY29JZ2FOQUxuRHc2dUNDcS9vbHVRbGtBaGRaZkEz?=
 =?utf-8?B?TEZXK3h6RHJkY3hldGYycnBoOEo2OVQrVXpFT1pWTUdlU2JwaTF0azdOajlw?=
 =?utf-8?Q?2uMKrm/DQuQNPBtwz4H8vNU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9b0145-c9ac-471f-b89f-08db2fa978ae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:28:32.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+ITVmrkPW6OuPOW1JYS7q23zHVtNR18mZDWoofJAqjtz3+7QCaEQ0npKgGduN+M4Ak1Ul2ws3dIt1cpDBFJsAQYoWkwR/n7Ksp+phLBEysVdLBPJnKSya02BgN2g5FT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/bo: Return object bo size on create
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

On Tue, Mar 28, 2023 at 03:08:26PM +0200, Zbigniew Kempczyński wrote:
>Driver may alter bo size requested by the user. Return real object
>size to make userspace aware how to arrange vm bindings.
>

LGTM. I am seeing uapi kernel-doc already mentions it.
The xe IGT needs update to get and use this size (though the size
it uses is already aligned).

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index e4d079b61d52..410e797931ac 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1564,6 +1564,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> 		return err;
>
> 	args->handle = handle;
>+	args->size = bo->size;
>
> 	return 0;
> }
>-- 
>2.34.1
>
