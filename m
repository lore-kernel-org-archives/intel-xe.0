Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC765CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 15:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAB110E10D;
	Thu, 11 Sep 2025 15:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHHBkFNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BF210E10D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757604382; x=1789140382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X1pU4LDhEthgPygJ7Icr7gd5QmB8bGp1cgEgjSptZ24=;
 b=iHHBkFNZWuM44DneD2bSSsSwiSVlI7vXhjOIm2cS+YgqZzOwG51RWLPJ
 iStE6mPo7vglWlRrSjJAFOKtaJGyWLeSBZKMxAiKnok+LWOba8dHJl9CE
 JtmahxebH143g78w6pt7o4mvZmVSiIeky5zg08PvgU/7Rm9t6dmTky6Ba
 q4IVYixBm6SdX5+nvoiGTSImtUhnEnDFDICbQFpibZ35GCxkkNf4QTqtO
 TadP/NDNUP1nNNnRiqix4T1zShBXypM15svYxufDSPViaDHS9MNlDqagE
 EYfJSqifQYEX82HdJ3/h7aWB0L2KwpVgf6WBjG9jHD3Yz0JBH/63+ZG6m Q==;
X-CSE-ConnectionGUID: LWeeCyaISAaOJ4NClm+xlA==
X-CSE-MsgGUID: w6IRdBoAR7itCR53J43fpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60087674"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="60087674"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:26:21 -0700
X-CSE-ConnectionGUID: ZlwGaqYEReOquJmf9e5YRw==
X-CSE-MsgGUID: pIbOcGd3RQ6FYjAy8cp2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178913242"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:26:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:26:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 08:26:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tm4XdCFNw6kyWVPsB3twBZpS82zTaA6YhcufRQDGxNgD4c5c1IplX59f79QtUMz4aclJLfsn6tpS/M7jR408iBqXDRSguW2b4vbmvGT/47OFMyRg2CIb23EmKsfU7CzDIlOCZ2pwJBCjfXQBwftdalBT8AECV64zBiGjMZEcup7fHVfQLukgccPGqYAqf+wjxMfGpqDF5H0vC+/2Tf8jvwMklkiwrPUYdUtTVA55NZh50mP/eoBJRQfBXftXlPpBqpPqgoTeZkFh6Ppxk18ckwPqjelk64eopAhmUpOvXsOaoKnh60SK9YKP/ONUI6b6Op3QYBjFmmT9WRrlAVTy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3RXByUZ2S7EZb5nB74/GYJ5dRPUafWrjfW1bDt+aiY=;
 b=E7X5fQrAYpzaqToIJZqtJwQd+RcBZFJJJN5b1rAfGck/sBZQS/RiFAJEvzFRdBfVyGNMDKIQ+hIG17JynTIH7hiancWsfkC8vW5mi6MW3N8EzJu7tsOz+o4zxqbBbxeEVKtY3+c533JqxOJMim4dcHhnqHXXTWuDeg5TyScAC/sjv16WgubvSe5VpAPLvG3J0WhozvsQte0ffvZktakf4wca1GQFlUqAOhNnhwhb1qcrwe2rI3XtfzO9kyROhPy+fDk/eQq55UEL9YWGCeuV06kOLZBczocfYTqJEBkj+IvkT1crwulWoyFWF7fJEgzwaWr/wYAvbURIXgNsDQ+tBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA4PR11MB8961.namprd11.prod.outlook.com (2603:10b6:208:56e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:26:14 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 15:26:14 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4] drm/xe: Misc refine for svm
Thread-Topic: [PATCH v4] drm/xe: Misc refine for svm
Thread-Index: AQHcIspz3OH+IUDw3k+qDK6d0KmXxrSOGb5A
Date: Thu, 11 Sep 2025 15:26:14 +0000
Message-ID: <DM4PR11MB5456A742B146CC828951F788EA09A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
 <20250911031405.1371812-2-shuicheng.lin@intel.com>
In-Reply-To: <20250911031405.1371812-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA4PR11MB8961:EE_
x-ms-office365-filtering-correlation-id: 82c9048c-a2fd-488f-2e90-08ddf1478b8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?E30Yl+Y8W7+mg1hYDCptgnnlVqM2kO+TRN15K111d59ZPFtThyUtg1xdi12z?=
 =?us-ascii?Q?5yKGIUOPS4vzMjiE7rwfdUnzJ1LDkY47uBNqZERWZv52QeGGapxo7/PRGc7O?=
 =?us-ascii?Q?oQ8D4AKwDzJ9YsdX3ZBh4UjzKTFT4i+33qMSXHBwXP5l2dRTizo4qzOZdJ6f?=
 =?us-ascii?Q?BAQNL2qGeI9XRG4c39hlqPScEI8CDoWv2RqZv4ZoZvEhL8zOvcMbV1Zkjl19?=
 =?us-ascii?Q?3A3aqMEvPuU2jPLfNQOEjxDxokQeZS1K5LGcMupIxSMhe2DKgSsAcR25R8eG?=
 =?us-ascii?Q?7Gbvb+SOV0jq71pFJXUMIWYs9WfB5Rb45+pJoynaDp4wVkUMF3tQx+/0KJrk?=
 =?us-ascii?Q?ySR1avjD0LOIw18c0DND6kEbd4XCwi9Beesc9tVlmMG8MvVBISixUps9/Wu0?=
 =?us-ascii?Q?rLkerab3uNlNdcy9iIfwnmE7RtBMfU6IICbW5d42AN34M4H8w8BKr+rLhjDg?=
 =?us-ascii?Q?TWOAwjdFHvmBrVRqEUT7n7w0biyu1yN0/652X0R5j+fCIkDJtp2B1aMhUaPS?=
 =?us-ascii?Q?DsESn+L/ZStASqeB2G4JrIuuwMfWtxFv+YeETl05DU2LBANBnhVCGOFdQpE/?=
 =?us-ascii?Q?codLYomu3SlsNqIwfRR4vLMw0Etss9WxM/nAwREjEizwe90Zsq1zMraZE4q9?=
 =?us-ascii?Q?xeYYLRBbyhpa3PsoKYkJaPVk34zcAwtFZe5M6bXa12KiCv/QGsZTgd41G66g?=
 =?us-ascii?Q?3N+DDi6uSHTRypj1G+aH0IvbV25AZFmjjeu1Ria8ifmPSxTI9en0+VDGU1oS?=
 =?us-ascii?Q?Gh1q2jX9Bz2XEzyIoZPLjNhva6TdZFQ2MUTcdU3xVGtxVacvs4Uk+tPkiSEE?=
 =?us-ascii?Q?9IWK+7ccSdFgoph72ITFFpwcU46G2WpmllRgrNggIvF+vG97qS3vb3wg74BJ?=
 =?us-ascii?Q?8Is+EmX0j0xlvysJKUDNDUX7FvJSsy4Cuc9jB+bX3VdOU20NCpgXjGG3Aebn?=
 =?us-ascii?Q?cd7xvfjl+KX47yIWDwPXGM323pb0O7LXnS/xhuj4dCoSF2Q3RXMd7mL4iQNT?=
 =?us-ascii?Q?m4Cmpoqpz3Yndjo0oBl6WUVawbali1UQaJ5LqpPq4s6Du4pXc5nd36Y4ELgz?=
 =?us-ascii?Q?zwL2+78jr9DmX45hgiDhzf2hoj8kgTPk4dYRYT0bXbGdq9IAn7ZevBKppDAH?=
 =?us-ascii?Q?4VURq/zyvn+3DsU4HmgZSHCKyNgb6l7+yGLIZYKlB7CLPU94LokctOQf7fby?=
 =?us-ascii?Q?r+W6hU12LLxLOoEDnSihtlgPmlAqmkX36StlcsNiew0UscIF0ECIsNib7G1J?=
 =?us-ascii?Q?upQNF09LZIqHFaXLn14bXOrtYiya5xE3ibFbWLUDdSxEr8INKMOoulXJkfoH?=
 =?us-ascii?Q?8DPrKge9fOpPnIwwbT7AUxPpKszHlqOBJkng6ltz13KVZFFY/oBSRqXwak/0?=
 =?us-ascii?Q?BC5EDY6M+uydsJlyEFHKvFI+SGPJs0KBiF1ZeqWH1vBIdhtZq6YchVeiu9wB?=
 =?us-ascii?Q?an59EMYQuwERuU61ymgdyf3H1RCgoIZDPrzkeayHJjQird94TUyIHwAQj4IF?=
 =?us-ascii?Q?TbGKR8F0Iq8QheE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fjzCZUkB9mlYdAYa027ErGvSfQGifoQ9xmuzcIodjFw1VB6SBEa8aoWibxuf?=
 =?us-ascii?Q?FXKOB+Er6jWvPDaUEbcm6supUUhs8hKtEKpoK7VFKHvXJd7s3rVgET2TQlK5?=
 =?us-ascii?Q?is+iR9hmh2Rj/vr/zQe9PjOlyjVBClg1+gSlUPfbmbR9UW4nBRiiNIhlIZgM?=
 =?us-ascii?Q?KI+LdovyJQmdoAG5EJJfygKk7X3bef82YPIA1a42elHUfRjwvllOKysBHjPD?=
 =?us-ascii?Q?X2wG4BFWCmjT8uyV9MU3Dbh23pC2KR0EZj04YcCLn1c7zYow1Z0ncivMgpi2?=
 =?us-ascii?Q?GfkPdVLLp7cbS6kMe02nUaTXlhp2TYeNVfnPN5FkhHTo/5Rq1bGLpr9K2E09?=
 =?us-ascii?Q?BWHVh2pQvCo4vSnwHXpFwmAR+bEbtFWHaI3dr4shWk9ZRKozh7o2jvHumFea?=
 =?us-ascii?Q?D2XYE3n6U3Uyysfg4zeYz08j90X4va/MRW8hpjug8vKcbzyBzhWJyNdJF5T/?=
 =?us-ascii?Q?HW4zLokcKEWC2kDCm3f56odGMyOZ7g8uNRURxxpv1/kAyODp4m+iN589vX6t?=
 =?us-ascii?Q?ofrZFixFB4d1rcLoTkodTTh3eZ1dBs8zB86rERDeZkjH8DT51jF39Tljv1iC?=
 =?us-ascii?Q?/512EHUv8F9JHAl9dzOzEJ08DiENplrrT9u8njdieeufiKE1/rEl9YFv5SMR?=
 =?us-ascii?Q?V4tt2rA17F9c7jVXdwQd5hoDWkd/RQXMbaWEaQ1x2Mz2IJsgFPuT9zy3yFSp?=
 =?us-ascii?Q?hauwdQfle64+aM0J3vPEDQChR4LeEBQiIc4ixThjwurIuEMfWnXsyjIBA0cz?=
 =?us-ascii?Q?ljgNRT78P5WDo5fTP05RhT3LhYd33wmiD/r7BWB48uF2ef/KTi35f1GeutdY?=
 =?us-ascii?Q?c9sX0QjOVeKhhS1b4EB4Vlq6Cwxbivnfngjscv5r3jsfuTF0LLG5cKrYpWt6?=
 =?us-ascii?Q?BHVmWQ1uh+/Ol2c5zM+I2llkImy67UodH/Xm7FeHZ5Jf54IA3T3HszUkLGyb?=
 =?us-ascii?Q?jeEujJd7PgSzXAe9siXUVkKSnQ6WMPyGRj8E9xNNn22EeAAu6xPxBr8tQy0u?=
 =?us-ascii?Q?4quW5ePTbziCUJSbbBSQ+1i6OfETJ0W8umrok/z3dD80U3oA4ti/3yxBdWi+?=
 =?us-ascii?Q?+D/ZbqcEGsRroDPfDRmqusHHuSQ5kqzgrHzjmZUvWQE9KrE5WuCBYe/H3sJQ?=
 =?us-ascii?Q?NbGpHs+zr5sTrs6GKR6EB8we7g6HT+cy9Lhg0wXfd8frx1/FItfOyHhIUzD0?=
 =?us-ascii?Q?UFCkEnd/DMJBzRXIdhOkF9k2mBFIMV+pW5x4h3rmxQU+oU51m44Y2tf0ka4s?=
 =?us-ascii?Q?0CFHJPZHPO4fhfe7t+aVTK1kdZH0L4hTWZhqVgs2+kUva05RdVjR3QV8tzk5?=
 =?us-ascii?Q?dHCveCLXbxoHWdsu25EXp+c5wDclDQAo6MgEryzPKVJ5yJRaMuwZ0jSo1HGm?=
 =?us-ascii?Q?ES/HrhGR+SoXXp8mw9onNqP/IiDJjPFHE5oV6W13PmPGefKkzX7y/PzEdnrm?=
 =?us-ascii?Q?p2gpAMjl1j7FRm8tctP4tetmbq+nfbfTTuzaF5OmiNyHUJ4T7zCJnMn2kZVW?=
 =?us-ascii?Q?BInYPDwJSVddgpOJXCboCxg21hejoYy2IDm/XwBPx4K8xH48kyxkY/nluJDs?=
 =?us-ascii?Q?Gz2EHM+Q1Znr1lcbaQWQwwpEo2YoZchj6R8Ytu1Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c9048c-a2fd-488f-2e90-08ddf1478b8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 15:26:14.2085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tgr/WN2xAOT3xFTDyUgRG17Yih6QQUWsNlS4zya6QEqtZcS2RlLL1VwWQFYWa+bvcXuZBcGoCpDPfz5xS6VRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8961
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

Hi Maintainers,
The patch has been rebased twice to adapt the latest code.
Could you please help me review and merge it?
Thanks in advance.

Best Regards
Shuicheng

On Wed, Sep 10, 2025 8:14 PM Shuicheng Lin wrote:
> These changes should have no functional impact.
> 1. Correct typo of "operation"in macro range_debug().
> 2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
> 3. Drop redundant preferred_region_is_vram check in
>    xe_svm_range_needs_migrate_to_vram().
> 4. Combine the devmem_possible check in xe_svm_handle_pagefault().
>    need_vram includes the IS_DGFX() check, so there is no change
> for .devmem_only.
>=20
> v2: revert !ctx.devmem_only change (Matt)
> v3: rebase code and refine commit message.
> v4: rebase code and refine commit message.
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 8a0fa90a10c0..173aafb72f46 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct
> drm_gpusvm_range *r)
>  	return gpusvm_to_vm(r->gpusvm);
>  }
>=20
> -#define range_debug(r__, operaton__)					\
> +#define range_debug(r__, operation__)
> 	\
>  	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,
> 	\
>  	       "%s: asid=3D%u, gpusvm=3D%p, vram=3D%d,%d, seqno=3D%lu, " \
>  	       "start=3D0x%014lx, end=3D0x%014lx, size=3D%lu",		\
> -	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> +	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
>  	       (r__)->base.gpusvm,					\
>  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
>  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> @@ -347,8 +347,8 @@ static int xe_svm_garbage_collector(struct xe_vm
> *vm)
>  	if (xe_vm_is_closed_or_banned(vm))
>  		return -ENOENT;
>=20
> -	spin_lock(&vm->svm.garbage_collector.lock);
>  	for (;;) {
> +		spin_lock(&vm->svm.garbage_collector.lock);
>  		range =3D list_first_entry_or_null(&vm-
> >svm.garbage_collector.range_list,
>  						 typeof(*range),
>  						 garbage_collector_link);
> @@ -377,8 +377,6 @@ static int xe_svm_garbage_collector(struct xe_vm
> *vm)
>  			else
>  				return err;
>  		}
> -
> -		spin_lock(&vm->svm.garbage_collector.lock);
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>=20
> @@ -944,12 +942,12 @@ bool
> xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct
> xe_vm
>=20
>  	xe_assert(vm->xe, IS_DGFX(vm->xe));
>=20
> -	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> +	if (xe_svm_range_in_vram(range)) {
>  		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
>  		return false;
>  	}
>=20
> -	if (preferred_region_is_vram && range_size < SZ_64K
> && !supports_4K_migration(vm->xe)) {
> +	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
>  		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K
> range migration\n");
>  		return false;
>  	}
> @@ -1010,15 +1008,14 @@ static int __xe_svm_handle_pagefault(struct
> xe_vm *vm, struct xe_vma *vma,
>  				     struct xe_gt *gt, u64 fault_addr,
>  				     bool need_vram)
>  {
> +	int devmem_possible =3D IS_DGFX(vm->xe) &&
> +		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct drm_gpusvm_ctx ctx =3D {
>  		.read_only =3D xe_vma_read_only(vma),
> -		.devmem_possible =3D IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K :
> 0,
> -		.devmem_only =3D need_vram &&
> IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> -		.timeslice_ms =3D need_vram && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> +		.devmem_possible =3D devmem_possible,
> +		.check_pages_threshold =3D devmem_possible ? SZ_64K : 0,
> +		.devmem_only =3D need_vram && devmem_possible,
> +		.timeslice_ms =3D need_vram && devmem_possible ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
>  	struct xe_validation_ctx vctx;
> --
> 2.49.0

