Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E29DC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 00:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F58910E387;
	Thu, 30 Nov 2023 00:01:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E96610E387
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 00:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701302479; x=1732838479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vK20NFS0vvKfEMu4vCQgVGEysH/zNVQhuu/KDrEk+h4=;
 b=K9eUOn3sNnmQ8vqh/RRl21aaegFzje8HnMT00fVbWSj6YGBBr34faoFi
 CDOJ+MaYp8I5ZD8DsDYD0wNMi33G936htex7QeCVDPVmff+dCXzHmUhyU
 IUYCosI77fAf1ma6/Hknm9QG8p5jUnLK1U/zFSu5iNxwyeGxMrTiqdu1O
 Y7OBchnMizE+Thos1RCRuo/2KM4+INuEbKEM35ep26pnu6aX+vPefHbe0
 mYI0JrGmccgk3MiSzSUGo3CnjKPzyZ4+dl4eKZD7IQq15bW7rgzSQEnlC
 ADd6tpsUJux1Qxx//EnAnN/5moPDIKsALGCqcP5dbVwhuT3yuUWT0gfMn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="457563209"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="457563209"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 16:01:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="913006186"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="913006186"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 16:01:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:01:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:01:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 16:01:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 16:01:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfTVekBoF9SwOU1pqaZBV795cJ57pG3jjXTAWH6X+rgG9wBVtten7WNLSbJ00Bo7c4a4KPQdtQhHdr2PhKQZK71gQkHHB7qdkfbZyrUIDLxF7FkCPYWQ6vVmunAKkWXqZKBrJjumS9v8ucz/E8D5T1nxN4dt9mjDBRfRoh2AWqAzbi7r/iUTkFSwYYgu8htw4jim1z8UR1U+h8jyEsBzRynzwZf7arrmChNTgkDQX5U6t+fofE3tfoU4bxOHoWMMdFEepIhIqGeHWy+wzx3OV1rTavkBemIfvbpYoPDYYiYE7jeLaqPtbr1a4pREedLOp1bdRFHIOjoQdLjJBNh0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rb0xMU8jRwGCD1DgY9U+2yrrCp8SVaXQDfjekykI+vk=;
 b=IkIdjsjPQ0kdzx6/WEqWgyhurI9CajlXz3EGwVxsCkzVP80DUgb7MaStPiIhEWUoRTELtOZKjic9fwb9YxF3N9gSWsicdNXR9c+6iXb2vbU95DRDg+zhDMh47TlW5HNUvzevFmkJFkv3Ad0TkN9Ej2Wgboh9JPYmhCqiHmqZqu3W37UhS6qAqHPlo6WPenJo7jKZ18E7EK1bwDP9XpmaG3JTEVItZfsleqHxKne3L0nfi0Szxd3Gzlyjnbs1l4idQfn4XzIs91f2P4/9QRgje0kTEG/QzeWH5nCuliJ6sCZJ9uzW8b3viMtRWisc2Te1v+8t9JVLlhva4BEnF1chlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Thu, 30 Nov
 2023 00:01:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 00:01:04 +0000
Date: Wed, 29 Nov 2023 16:01:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231130000101.GQ5757@mdroper-desk1.amr.corp.intel.com>
References: <20231129232807.1499826-1-lucas.demarchi@intel.com>
 <20231129232807.1499826-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231129232807.1499826-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0067.namprd11.prod.outlook.com
 (2603:10b6:a03:80::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 91edb949-63d4-444a-9f20-08dbf1377204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AH3rPLzMo77WmxalIoCWEQml3rj4HG86cAHoh0xBNeE8IsRL87c3Q2NplyPHSjFD4hohs5QBdkHx/N50WW+taE3pkcLpk4GAoJxe3o8wI7RyZ98IKp7Ox2l5YcVtDa2Oyddmz5KxBZ3rtbedSlhEPDZAFRZ45Oy44LE6u7wQkDfv1SiqQmBII4VLbSBBXTJsIIr6qEjR1ioI9TTMXygRnG9kChGWWWD1brySzSuwNOh0loS9nzSaRDEuQ7XFa2cxwNVh4GJiCNmHCS6Y95Nb3P4awYfZ7CMiMbMcouJ5rCKbkrCvAB17cRA2Iy1zErxrQGyz54vrYaR4UlZGbiVj9vbbJVNTw+6doAMsgU6meVoRNQmEbF59YKIMsFd7g7CkePWQcybTWwt801Zcicgx4tYKQgLHdMl0IOaI0PvJPrKOZd6basLeunx3jPfFfZTudkub7doLcHeeLfbKYIR0YIxMDBs2HkIyMgZbp+G6mzcyVHRa0aN5VlimsU+bcC2OU5WZTLfn8my4VLLHPV76TV1OTZYxwChb7T3qFNG8WmVgFkf79Cx4B1EALo5N13jrFhCBcfp6LBImXQjFHx1IRwe4XC2us5tvepz6TR/LQ9FxsaLOb33B0AiCmV4jKffn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(33656002)(86362001)(38100700002)(1076003)(83380400001)(5660300002)(82960400001)(107886003)(26005)(202311291699003)(6512007)(6506007)(6666004)(2906002)(4326008)(8676002)(8936002)(6862004)(478600001)(6486002)(6636002)(66946007)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c3mhGjOtQU69cMFT7Cj5AnPokXPU2zt1UuMMVPKtk0HML4bFfM1dYWx/SVnr?=
 =?us-ascii?Q?qMizm1tNnuUJEbwduC1veKiEI7l7ov1Qe4oUt8Q0t48krz7zZzH9VIDTDCLU?=
 =?us-ascii?Q?leXN+csIpD9frQ6LPJqCboH2XyALi21aVUiVNxWX86hR+kX7UQkSiDpEIX1V?=
 =?us-ascii?Q?JNdytkPNC0Kznone/xReyNvxlQfz9GQrOprjKA5r8zee66QFP8hEDUKskXDZ?=
 =?us-ascii?Q?0zL+gVGpEfK3fjit2NLxelG4w9eUNox2ZImcCSpd+lCRELKpkJbbDmQz2vVc?=
 =?us-ascii?Q?1AxApIubkV5FioqWG5euTBnqFmfAOBqd3vKr9R9Qs9sSVwvq8qYMJCMYVDlU?=
 =?us-ascii?Q?h1bIfBtTSXcCtYC1THQzl/vmp8stEKrANw64kKsJVqfOKkynigiX9gTRpVxR?=
 =?us-ascii?Q?hOREkKFC8J2eBrx2FTRJZaZG2GfSiH7DPc0b5UGde+FlMX6Mp2+fG95u/z0P?=
 =?us-ascii?Q?fIF0ICNMF49nE7CgT/0QvoUQ9mbUDxbDvCEp0O3mpcq8Tb49GmDDQN22zpW0?=
 =?us-ascii?Q?ahXt++2MgvLG5qOTiCbIgKTNjBfyT+I3Lktsdwtep5mSwfes8vvBW3OObXH9?=
 =?us-ascii?Q?CrZKytEoD003YsMhAm+ymfn9labc91Xd5KkipwW+9Cu2v+89Cwex5z2of1gK?=
 =?us-ascii?Q?hefqnrxhm16t9rV6BorKSa/yD5NtipePvyENUXKhTeGLMnCYkDMfb31YXO9W?=
 =?us-ascii?Q?rnoaMhuqrkb/LR/fiyca6zr/Lks9CUSThiHkj1fEzjKa4bFiZKqX/W8AXsDo?=
 =?us-ascii?Q?czLV+QDTIFKjco1lO/drYZ6U8h+JEP7CfAczxfsozTOG48noQloIBAKWsx8u?=
 =?us-ascii?Q?2GiJ/wzPQ/GP445EqEzeb2NTZPDcBkR3k58ngkbFFDjSIVSWVOnSBin02FJ/?=
 =?us-ascii?Q?BdThFpUwAAUZFKE6/n0rS8lATnRorrnUuXnA8m+QLW3hM0sJ0Wf4XLw2CXBV?=
 =?us-ascii?Q?XOMcyyOK2+XvBS90X4VZgSEQeo5ptj2CPHexdoUfNizTqKYhM+yNkutUJfNR?=
 =?us-ascii?Q?pdvrIZJ/h+nPH0sZ3D8w8vijniXouv4ogDniMOwudRFsJqgnrkJeUqLKCZNe?=
 =?us-ascii?Q?bYzVEwaDCOYsHn53n20MoITMEaCJHD49XzayX7DyQ5wqTLPvVoP02HdNZFe+?=
 =?us-ascii?Q?PHfIt5+HQ+ETJ3Fp+cHCMYl5gmOuPQP6kTrkVrITgCXNEwtONbKPdJEpqHK8?=
 =?us-ascii?Q?lQxGMruTMdCVhraWbn5BDA40MJYrnmEG2i3e3kzssbjtU9P5e4fWuDnof0yl?=
 =?us-ascii?Q?cUV1tMythtzl/y8zAPpYvmYGp9kbD1HXFCcuOdalmXGD+esalJjbSPNHB//S?=
 =?us-ascii?Q?MbyF5j8RlWNpCApyxJ5lRCzjhwKYqF7WC/cZV0cwymSHMHHRTZJegMLPg258?=
 =?us-ascii?Q?tbk4hOHSTWQMA6tg0JKstWgfYD0A+6g/vHgtSGSdZANbQB5rj4z/t0uMvVVA?=
 =?us-ascii?Q?CjSObPsEQStNkA9UAqwzZkmcqd9K8UolsibmqTq8B9D7riqtrOtHVy0cKqCB?=
 =?us-ascii?Q?CJE1gcoGfajE2TShao6h5L7zjwQFoi3F1oUnLOcWBQc+IRTcfHJi/HJJKNEk?=
 =?us-ascii?Q?Do8U0MXrS0seZqMGCVcvm97x63hcJzLr5DL623hmztwSkdplik7TTa6bqOeg?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91edb949-63d4-444a-9f20-08dbf1377204
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 00:01:04.2262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5ExIKP9GiYeerBLBfnhyQj2aicKfMZI50SSOEZq7eNwT8fVAOUMRGgaZ2xj4yTaNcKRfoEj1bLNG1fGK3PDf96A6Idr32URVpukJUhTgJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/5] drm/xe/kunit: Add stub to read_gmdid
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 03:28:06PM -0800, Lucas De Marchi wrote:
> Currently it's not possible to test the WAs for platforms using gmdid
> since they don't have the IP information on the descriptor struct. In
> order to allow that, add a stub function for read_gmdid() that is
> activated when the test executes, replacing the iomap and read of the
> real register.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_pci_test.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_pci.c            |  3 +++
>  drivers/gpu/drm/xe/xe_step.h           |  2 ++
>  4 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index be2000987877..5b4e73cc31db 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -9,6 +9,7 @@
>  
>  #include <kunit/test-bug.h>
>  #include <kunit/test.h>
> +#include <kunit/test-bug.h>
>  #include <kunit/visibility.h>
>  
>  struct kunit_test_data {
> @@ -107,6 +108,21 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
>  
> +static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> +			    u32 *ver, u32 *revid)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_pci_fake_data *data = test->priv;
> +
> +	if (type == GMDID_MEDIA) {
> +		*ver = data->media_verx100;
> +		*revid = xe_step_to_gmdid(data->media_step);
> +	} else {
> +		*ver = data->graphics_verx100;
> +		*revid = xe_step_to_gmdid(data->graphics_step);
> +	}
> +}
> +
>  int xe_pci_fake_device_init(struct xe_device *xe)
>  {
>  	struct kunit *test = kunit_get_current_test();
> @@ -140,6 +156,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  		return -ENODEV;
>  
>  done:
> +	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
> +
>  	xe_info_init_early(xe, desc, subplatform_desc);
>  	xe_info_init(xe, desc, subplatform_desc);
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index b4b3fb2df09c..811ffe5bd9fd 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_PCI_TEST_H_
>  #define _XE_PCI_TEST_H_
>  
> +#include <linux/types.h>
> +
>  #include "xe_platform_types.h"
>  
>  struct xe_device;
> @@ -23,6 +25,10 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn);
>  struct xe_pci_fake_data {
>  	enum xe_platform platform;
>  	enum xe_subplatform subplatform;
> +	u32 graphics_verx100;
> +	u32 media_verx100;
> +	u32 graphics_step;
> +	u32 media_step;
>  };
>  
>  int xe_pci_fake_device_init(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c949ec7ec43e..cc2e87c0eb97 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_pci.h"
>  
> +#include <kunit/static_stub.h>
>  #include <linux/device/driver.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -456,6 +457,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  	struct xe_reg gmdid_reg = GMD_ID;
>  	u32 val;
>  
> +	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
> +
>  	if (type == GMDID_MEDIA)
>  		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
>  
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index a384b640f2af..686cb59200c2 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -16,6 +16,8 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
>  struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
>  				      u32 graphics_gmdid_revid,
>  				      u32 media_gmdid_revid);
> +static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
> +
>  const char *xe_step_name(enum xe_step step);
>  
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
