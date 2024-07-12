Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D81AC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D49710E13F;
	Fri, 12 Jul 2024 21:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA4zMg6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A399210E13F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720818430; x=1752354430;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Ya6rGkWn4u+6O1J9JPOZxxHyeoTLB25R/conFmAx4c=;
 b=GA4zMg6og/irfljYhI4IIXl8cKi97TIxTZtXaC9HrVo9BNb61WUoIXJ6
 kQg7ohjHt+PZQCO1KIhn9AjqOTpoaB4q4I3UDZh3aY4HAQ8ft+rDKggdV
 adTC6ZF0Sy+tFurK860ZHIDC1IqV9VxQWdmjDKMT8DwJlCv811TTzaToS
 88OMVtB/vBK3+MHV5VR2xSlX9WJKoaGtGqotU1KkdHKjjmrD0HKaOUCUB
 UnLVeJ4YCFOw/2cshyPIeMItNriY9zJQH7d7iGWUUvhKU3OuKj8zExoCP
 Kbs01sF/Xp3mZ+WjbcEZTt5bWd/1B06trvBS2JF5gUsvofPv8NSXHjuWS g==;
X-CSE-ConnectionGUID: qD7ErERGRP2gU00ekS6UCw==
X-CSE-MsgGUID: 5aa7KPJvQKqrP6rrrNrjbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28883393"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="28883393"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:07:09 -0700
X-CSE-ConnectionGUID: TsyhdcFrRzCffErwAcMw0A==
X-CSE-MsgGUID: PzNZftpoRW+EeS2e90uwmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="49112670"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 14:07:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 14:07:08 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 14:07:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 14:07:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 14:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUZ8rlL81AFanzvdNt6kDC4VRZMMwfVJTiqyDtm6J81I3/LsgKbgrAL2RiVS9tAk1JRQ858pVYIKbpHzKocKQl0h4NyldMVlFh4g1utIueMKcLfh66cwIWMAckx7w25KE76TnLcjHQKnJjirHFWsUNwej9tPLvgsgNi+gSZK/0DE7MxlwxRtOOg+Z+pcZHJdR/X4XL+Pp/vQ2zHRzr23nb3B/G8M78HePDIckuRKu6sCcdIwZ5ZKAMd0ZcrSKecU3lwuubyXjnIV1ACOxll6fEZM1FHghl10V6TnVoWq5Ej+9VtPTetTv5dO+C2g22OxNgCBgc9NqOBjyIA10ly3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ya6rGkWn4u+6O1J9JPOZxxHyeoTLB25R/conFmAx4c=;
 b=np6lAmkkHpOXia9e9Wq2McGh/WhKCNUQZ2CbmsLCCnsbRX1rt6HBQONuiGskOVXSfpxM46QXMHLvPCHryNO86x/pO76xtcBYlzDbb6Tr5+4wiHPx+YFIt7SF/QCVZkvVYFbzVPDyAtszsuPob9JdZolEarRH7xqROKZ9dasYLCQvPI2/06Hrj1qJOFUeVJ4wXhZRkIB2QPdLPMaFduR7MQAgInWreRnkAC7cxHwU+A//bOiS6WAjSW2VGQTlhxenN0A21IO9mpXx45v85C9vLhLLZImGyU4l1DrVL2/1Bq90AV5GBmbXc/E+nEUtoWZzHC6cGXv6YFslR3VLwYdURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Fri, 12 Jul
 2024 21:07:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 21:07:05 +0000
Date: Fri, 12 Jul 2024 16:07:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Enable SR-IOV for ADL/ATSM
Message-ID: <xcn7urwhktt3fa2neutv56ivdeu747o3p4uvanxlts5xzfoxdo@renwkbpu2dse>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <20240711192320.1198-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240711192320.1198-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:303:2a::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a31c2dd-5409-4156-b15f-08dca2b69581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P4bNBRMuy1gJSPe82O3L0aIdjZSg3ZRoqv1lrYIYYljbGfudXNrePvy30z06?=
 =?us-ascii?Q?SzKoiPNlwW5Qv2yHkP0XRUYqzjA16TH9f6q6q4Dz2nhBfILcmxh9+HsLRRqz?=
 =?us-ascii?Q?wm9QJirq4inFtKNonqKVu5BaSFzkfiV4El3SpZmwRzZH1gfuSofinOw3T5Fh?=
 =?us-ascii?Q?LG7PDUShW2pEXsbO+JjhQy/D6NAdN3GjV5Wn1TFzeEoMYP40pTjyl2POeoLZ?=
 =?us-ascii?Q?bS649kudZDWgqKNWMAhsxl18ZDK9zRxrPySXjjH1l7FYHifGTgOrtBg1kN8m?=
 =?us-ascii?Q?49apP2Uwqk4PVy3m+AjZeG0bcfChOeDbvM+dCGwV+TtCPF7Mz50nDLNNQ3h2?=
 =?us-ascii?Q?zJ4kEcq6DdhmE7hKrnxE0MHQWGQiE0CRp2q+6QLG32NZU3COGch6YGSrXK6C?=
 =?us-ascii?Q?MjVFw5799wsHSC4pKX6KwvqKx9cTTDUxElRd3DeBRhyEequ+W+hyuJAUULra?=
 =?us-ascii?Q?LY2/1tQRpIpzwDD0+hhyY9rw+EpiD7XAlsY4FIKqi88zMYtA7dMYextm7vjB?=
 =?us-ascii?Q?XZ/mTtB6V06iKSD/xLf2UnXRm8Szk9yFOtDvYSavrmuuO7KxnKUYDAC0wYuL?=
 =?us-ascii?Q?cTa3G9AU2s6tYcIdrCooMi93BzhBjA0ISMSRgOSR1vXgUpdy6CUYStWw6Dm0?=
 =?us-ascii?Q?oKhOdqKRoo79MOIF//MNM/phEY3f71x/wUCAW423kVvnnt2uJkAm3gvz65EN?=
 =?us-ascii?Q?Y9VV+jlDSXYMCnqBf9SitHi+PsrHT7UxDIcRNIT+e2UcuYcJF4ZcnvAhGNR3?=
 =?us-ascii?Q?T3UMgylgCmDBHlVGdTQNw4etNc8ApxmXa9DPDXG4lr1BQjA8qGszrdE0Scts?=
 =?us-ascii?Q?bkU6wXAoU5BR2+nv5CptBqnuu/8euwxfU5ajtIJXoKEsjAF5ElEmx+nyyLor?=
 =?us-ascii?Q?KOnj8bnSBzyZ6UQSLO3/Ms0PLp+vJPOBko3nGQOa6qp1GmP7Vz9lLzo7ruB6?=
 =?us-ascii?Q?Nw/r+8Cn04o5ZkvwjX0eyBW8mZLysbBJwHsNILwEDWYtuit2Yln0GyCWcWHR?=
 =?us-ascii?Q?pz5aagHSnoLnhcTJYcDGzOkK3HQZ6mMQqZ4F/XDKAOJNR79cu1l0/OXrja+c?=
 =?us-ascii?Q?3arKCoPN2A+2CPbagjxR268l+9E3UHvkncaTImFFiouTmC51aThesOb8WSXv?=
 =?us-ascii?Q?/b4z+qCCihqyFjpStrkoukmxLQc2l56v4z4ra/LTt0+nKLrLcRSXEJwyGS8i?=
 =?us-ascii?Q?88V8yFqDzwL6wXvFAc5sAPCFYgAPTIb2wkcoAdP2sRinW3qO7+yDQlGpEZ8H?=
 =?us-ascii?Q?70o5hmI3v8YYAqBMsPaIZwzuiPRzVwqAYWBWXYMq9/UFXnuow2/Dn36JxkD+?=
 =?us-ascii?Q?PSw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SWWckODFfUyqGj5EqnNqFsnJYT6jQkoAbasJ1cT46OzAf+VlX+9a7tl09Be3?=
 =?us-ascii?Q?zBnhXipFLfHjClDqrDCj/DPW4S+SH8iAguL9Zu+4Uob3DjiY7hGLzSwOndpJ?=
 =?us-ascii?Q?cipqRvDg8jhIUoNE6M+ArreQitZ08clOf3YopygmjdnS3oR3FZ3FSepf9HJL?=
 =?us-ascii?Q?DkqZUch9W1ZMez2T+PHsoxFisXwV5iYihnybcozpV5baqCGPE0wHQCBN6XwY?=
 =?us-ascii?Q?vxZ6zfjWcdri0z+Q45yM6cQieo/QQYlyvqHl0cx17YrPcM6CaPfQoIU5m1wj?=
 =?us-ascii?Q?KGAX1YIIcb0VqQ41Av8Z7evrjaD/W6Ueq9fWMJzOcaziUmAF6N7UAHzGN+mV?=
 =?us-ascii?Q?Vzycm33wsN++VuChIs0gV/5tebQd8/iKpmhkuLu/kMTJ1euQsO+GXI7YvuJ4?=
 =?us-ascii?Q?LDaPlQYeVYr+VYtCYfqJiCQJ35sViMjZzAJs4GOhS+NhRQExTyVi3SAgC0lC?=
 =?us-ascii?Q?Bj3rFr+YSZMGsZdGMl7ulgJ3uSQF+bgUCkHueGFrQKhgXlykHzl16qbGKjM0?=
 =?us-ascii?Q?3R3h2H1C8Ju45leawRNJKgJIoAwMqXNnJj1ChkurRy6UU2SZC8zmvE9wLFL5?=
 =?us-ascii?Q?gJ9PeDke4lyAczuIxs8e9FHfeGAi5DKBhj8EGmZeBpyzMHzwhvVqG7uoTAVQ?=
 =?us-ascii?Q?gFn8ypbwGuLrVBFbjnLU6KvPakB7o2vkdaTeg4s9HZ1pFxlTqkEPK4eyGi5Y?=
 =?us-ascii?Q?JUPhwDY0/s3RJRKq8fTufIJu7tUo4C5kTuL9Qpvs5YLO+aWkXjboRj43KWuy?=
 =?us-ascii?Q?gJPTqdD0k9ThT6KVUvCZ9QwjJ3GsPASWaWVRt+6n18Q4PHiYd9BcSoQlAHan?=
 =?us-ascii?Q?VjBAsHAKoAvy1Su0Lg2mI59Dysyormi90g3vJwNrDCID8CT0rDAI0vUw7KuB?=
 =?us-ascii?Q?3MWb6yBnH1vKMAQDioZvQeUCtmNNcJ9W6Ef3cXHPyZDzFYgCNTAzJmYNmd0u?=
 =?us-ascii?Q?0SBWT3D/OkMuWNJTZWIMwSi+ARjF5X4SU5EyGTfcNixGbp9NucBiKDII8Nzi?=
 =?us-ascii?Q?R8iqh9jZptS8o406ydin0StysxmvzV/WFZFh2fJoffiAVsWILchToj9hLoSo?=
 =?us-ascii?Q?hJSY60L6Wz0lYbist/uv3Guv2Skxf2D9tTIXaWsljpcb9bkwB7KWgGL8HXsZ?=
 =?us-ascii?Q?aEKzVruf2QiHEtENo/IjVAjs06IIuAeioJA8G1MNdi2BHuc4tTRjGin8ysHD?=
 =?us-ascii?Q?Fo6KXdYjFDwIBpTFMLWD3ntSzN3ogAwj0QMpx0av96xID5Oc9pFRk93yzMIT?=
 =?us-ascii?Q?rbE+6MYsQLQ+F8cAGkUqE4X4rQoabYG46IyRnccAAX3UF5FkIzN2chRztfax?=
 =?us-ascii?Q?mLMDJlzX1G2ZpWb0vNpNN5MmwYzJ/kOToaC615DRjCF4ScFgRjnitIA5Nps7?=
 =?us-ascii?Q?r7kZSl3Up9pyl4WFOXokebJm0dgIBGvDSu16pNuOmMLuhqLehY/03/Z7vhhi?=
 =?us-ascii?Q?q1Y+HMEWI8oWfiaaBe33Gzihgd1U4nKeawxszQeemhxSL/223yofqv5UzwBI?=
 =?us-ascii?Q?Y9rbTXFbi1YU13suB4JcxrGX/MP+ExF902P5oPRZHi9eUAl0I7dr9h/OAkj5?=
 =?us-ascii?Q?bfE+0yiT7vevi6CNuxI0ljaFtkqi4rR5ARRHU0bpumLNzQj85/IjoeXIexl7?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a31c2dd-5409-4156-b15f-08dca2b69581
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 21:07:05.7203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls220M/Iy66bLaqTzj12c2sjHcwWn/9jQBa/7/v6ezk5LgHb3Li8T/lOKkMowB9vrTLRx+XPD89a68XEAMVHu0YEY5vEX3EW3MZUGBL+L2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
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

On Thu, Jul 11, 2024 at 09:23:20PM GMT, Michal Wajdeczko wrote:
>We should now have sufficient changes in the Xe driver changes to
>run it on ADL and ATSM platforms in the PF mode, to configure VFs
>and successfully probe driver on the enabled VF devices.
>
>While some more changes are likely still needed to fix all corner
>cases, we will not find them without running any tests. To start
>testing this feature by the CI, we need to mark which platforms
>have basic SR-IOV support and let the driver run in the PF mode.
>
>Since this feature support is still in the early testing stage,
>make all enabling available only for CONFIG_DRM_XE_DEBUG=y and
>keep it on CI topic branch.
>
>Note that from this point, on selected platforms, the Xe driver
>will be acting as a PF driver, will some SR-IOV specific changes
>compared to running in the non-virtualized (native) mode.
>
>However, those specific changes are visible mostly on the debugfs,
>and should not impact normal driver execution, unless VFs will be
>manually provisioned or explicitly enabled.
>
>Once we finish adding the remaining SR-IOV tests to the CI and fix
>any issues that we find in the meantime, we will replace this patch
>with proper series outside the topic branch.
>
>Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>Link: https://patchwork.freedesktop.org/patch/600604/?series=135296&rev=1
>---
>This patch is for drm-xe/topic/xe-for-CI

applied this one to topci/xe-for-CI and the first patch to drm-xe-next.

Thanks
Lucas D Marchi
