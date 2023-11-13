Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4B2C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 14:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52B410E392;
	Mon, 13 Nov 2023 14:34:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A4B10E379
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699886044; x=1731422044;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BWqA1JwPPGDqUwKkgd3duNFbeM+qWIcYnFWkEYOW4zo=;
 b=LLCem40Jh0pQq0n5PQT4lZtCdnp+cj8AGKPZG2fBTPSerlffNeCxqdxG
 zZHF9/AWJg9AhbEo9cy++FlF1OgiuZ86UlY0NAPZ5Z/9snxeZCnZR3GGF
 ESSQzCjerYJc/XsOvsOaCwCQjX32t2QvSrVDZdJCXySwbpCwZsAeS4Dn8
 mDXchtYxjEScrUymeRigEV908VrrMT2HjT1LSsxFUQYqMOrOs1GoqT4M/
 OrUM1ClfBtq3lrpUccai51+5odlSSOlIsFmUjqTUtzOu9wQEQv1m+GR8b
 sqMXSb+YX0f2G2/o7klrdU7GUjlRKEZbHTphQTBzn/NA/LoP8+zhMuhgt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454736301"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="454736301"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 06:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="887932279"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="887932279"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 06:34:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 06:34:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 06:34:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 06:34:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+HiQeY6eaWN+tIRpFCmCA/UxxYJx87ePscpZhjFiIrqXAvjcJXK2RMBhwd9EjKhilVwqtbm/LTKEyePbpQGRJE68lHILZy3yG+fyZGoE6kXvnXRHhrxWPYcdRncFCbsDYj+Qb6KrHJMdFwAglr1vrNazuCjHxsR1kU2x9bopYnLdKmOCLkgStpJ+SSL0YgcJCvReJvA4wq1gZSmZs/Mtsf0CXp0GMA7yOrS+roykLhH1hw5LSEmtnCCk8dRVCbfalNHCkqTPLu10Z5bHGUEATGoE6EfGFb+mH7E6ocHC6ZY9EVLHP0CuYCDl0YdjEOEbO4IOG4oiwQJGRDzADvpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsSbWCkF097n6vUFpRxlhm3TD7eGeS9XJicfoUI+4kg=;
 b=GoOikkOysRPtQgrhtCLauZz18aJqrOCWj2ehQZkJfkt68uboomXSDf7D0UjTUjt0BPmQf1I8qwjSIxXRfnQkUeYEPkMjNvqHZZXHnN5oKMtCo77AuHqNxeTwM0RKiKxfg3Ut61KavGg1h50Rlhd8H+pinbTyMHXQMZkmI9wkrLkFjgoX5nNfuiu5WkA/EamSWOx0IgNLHaBXyK9zjRN9ONqiJ5CHPFOH+HcC/jsUHTvUQRV98NQ8RsJkCsglwlgbRozyYAs+CKebTlT9jyyFvsRzsu00NSny9PNrnC1jWwg7umguVrqL74oDjZGXT5qYjQACnGLA6uXVx/Xt6FPjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 14:34:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:34:00 +0000
Date: Mon, 13 Nov 2023 08:33:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <dtx7akz6lcdbgy5bsemmijde7vbnytefqldjucrp6wmraigm5v@qu3kuyoz2ujp>
References: <20231110135913.18890-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110135913.18890-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: c50d0cd4-5954-4748-c47b-08dbe45593cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vZYjJ94li4EPzm+13GZqCBAfw4BWekymxM2rl749aQ+K/DPL0FZGYzi3d0vAxBlkgvtik840HjTNrVLLKi/M87sNVXs75bxH1tNu7hg/SRBsSGHkvddukKmlXRu4mUVTuASkjThnFbLE+Lt3gH63uVVLmAjbeuyXb4XqMmyqwBg2ROUFyEXQ/ZykoHillE9Eiy9ru+oYeqVIoaNtX0OtcrlC5u82i5JNSyUS+z1wEOiE+QoSR+a4EzCNwdPzCkFNC3kPpPyWHXnwj84a1+LAoy1AgNHyUn+y8GjnsfBGAIXLoppNQgnfljUHcX0HHbR5b0Exm9q7mvNSRPdu1FCIOGw3BBIrnO/p6495Y4Z1yJ3AdgXeZR9K6PtiqueORiOZHYNlZFcJxBJVuiuADPo4yws2jWKoljGVBMfcu10yqJdc+FXXpplqp0kiQsPdZ604gNuwpSl4/MFTg9iyuAjaskToww6wzRsXrEz6MQR1JZTsWKOrESVQktqTYUAx8BmGk4GPVCTgbGIBdAMWvItvbLsr3Ot6jzFELUxjSg9opoXwYH93rJm+1DUy/niDyhlg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(6666004)(6506007)(33716001)(6512007)(9686003)(5660300002)(8676002)(8936002)(41300700001)(4326008)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66946007)(66556008)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sFGoW6b74tnHTBZTId7bpsy0YCWMmfzsSn6ddyo2ij7VmWbBuctlDrt2DP?=
 =?iso-8859-1?Q?DvmiGk/hI3XkpbbmK2EUKNvNedtytK+E0JIsrS4HgT73Lk8ITMUSM2+XCP?=
 =?iso-8859-1?Q?Dzn2qIyBCHpG6hV+TPQIdZ9kg9znOXjDPwmxz6dSqwBNaqmS5idwnYj8MD?=
 =?iso-8859-1?Q?5NEbWX7HCdKVGpGsCZrxrD4lBX5EYP9oJN1bZTribsyB+/NePYbtsBK/bK?=
 =?iso-8859-1?Q?glH4lscWmmiyUbAHDGsw7WwIA84cjegLAXtAJrXOpaVBBA00Lw7nQLlcRQ?=
 =?iso-8859-1?Q?5+HelubpVFkXr++bUkgrY7QMwEZs+bA5vi5OHvHoTzFDMXvTSu5fnpCS1U?=
 =?iso-8859-1?Q?RFTnQ0yFGh5bXCHTYv/6uvyS9uqVoH+woL0Zd/Y4xptw9bjuAV915775XP?=
 =?iso-8859-1?Q?JKfY0JcEc8CKTabuGFYIglZj1gfjpAO81hPOBHvEuoId/8syyupg1jPDwf?=
 =?iso-8859-1?Q?/FGGjuHqhxFKGh7twh+W3JZn0hMbnrvX2BpchgZy2LgJXqFCZFnFfQ9u/D?=
 =?iso-8859-1?Q?ae9F3OhjIO35N1w/n35Y5onIyINFDZqXAI2PIzVTNE4aPFnpJiUk5FaFLA?=
 =?iso-8859-1?Q?ZOM+PdvHeJNzx7buq6Cgm1c40dJf8eHUiemSUjvBoTqQv3WTCeu8MuXmv5?=
 =?iso-8859-1?Q?RrIUcNj9mOc0oNFgpBmtr4Yx70oJMfoBsXGzRrpEFxm3n7iNLSyyygApcy?=
 =?iso-8859-1?Q?V5Cs4r/Qfqm4Qse9UGOK2WapUryi2sKslWqDSPiD5oTOQE0Llhmu4jvLAf?=
 =?iso-8859-1?Q?is6iAT6ZWiatz0+HEjnlxnpHzhR1D0ZwNbwVK6RW3AblqbyfJTJwZofs5/?=
 =?iso-8859-1?Q?tgwdGg5O981zSHvJNbgx+7jv36y11m4XZ0dp5c8/CItO6+Ejw8OWG7kXRR?=
 =?iso-8859-1?Q?azSuRr5M0Ao6znguWJtISXFxT0wcc9x4h49WVNGrFuwe6lSc147emqHJ9t?=
 =?iso-8859-1?Q?kg3gAMTf2jnVuq09Nivzu3bCHLaIbQcH4wN373J7VFtCg8+V+wvznC3AVH?=
 =?iso-8859-1?Q?oiz24Jah4Cn4wTYOEmur5Yu8Br5HlLyfojFVMaFUsc9Dkml5pbThQZOVqs?=
 =?iso-8859-1?Q?CvNh93VuuUBNcfsP4UCvxtnyO/2EWj4cNyCF3RAS3BTOBpmTXXpqQPPQRf?=
 =?iso-8859-1?Q?mYQCn/Rcarxne5sw+r0niZl6/CaCiEu6xSD6nnkkGD2kTEp41Dl071aTwQ?=
 =?iso-8859-1?Q?QGM1+myUMxSFSgrtwVh+t7K//HL7hZMgONPHMLiN/sqdbv6HpXg0PRz+/H?=
 =?iso-8859-1?Q?eueUP/4itxyeFwu7i5CfQUUIqBcuv0pCN8bk6v4JL52eDukXge2YFAiHjI?=
 =?iso-8859-1?Q?hUAvTJ0so5TUhSVM4JmcpQWmsLfUlSWlt1tal2Eyc6dXYSYAN9uAFsdL0F?=
 =?iso-8859-1?Q?Eq4rEMDKzz39O2LDCpiFnrBpC09y1s5oqGwz9c7ggryFwKThMfkAunT+dy?=
 =?iso-8859-1?Q?4D525bxPV+579iQJ7mj4Ig31AXEYDLCudPz685fw5pclxxsnHfITpwX6OM?=
 =?iso-8859-1?Q?zHndZrNc9rqz5aM4+sQ5Va6zDL/aARTUSSKC6hcrmMMSxxXrypzkNTzvkK?=
 =?iso-8859-1?Q?uHbANiFV7o1PGfAiRZXktmjXUDySaKXMfTxvSkVrZ1vHE9WMW/IGOK+Sew?=
 =?iso-8859-1?Q?cDgjOnfzKYLgvKArVmTNC7S6LIMgAwmIxSiLYnzyOpoVU6t6plKisA5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c50d0cd4-5954-4748-c47b-08dbe45593cb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:34:00.8575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mkbj05VqABlXx26Vtrc/VK9dmH2P/WoCx/PwGsP2CnaogUbUxZCqWqtkB479jS1Xyk/8bXoiuDKgqJ2iLG4Pf8iF1hAGiR1p+bLMW8ShzfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/vm,
 drm/xe/uapi: Use LR abbrev for long-running vms
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 02:59:13PM +0100, Thomas Hellström wrote:
>Currently we're using "compute mode" for long running VMs using
>using preempt-fences for memory management, and "fault mode" for long
>running VMs using page faults. Internally the driver uses "no_dma_fences"
>for long-running vms which is a bit misleading since dma-fences are only
>disallowed as out-fences.
>
>Change this to use the terminology "long-running" abbreviated as LR for
>long-running VMs. These VMs can then either be in preempt-fence mode or
>fault mode. The user can force fault mode at creation time, but otherwise
>the driver can choose to use fault- or preempt-fence mode for long-running
>vms depending on the device capabilities. Initially unless fault-mode is
>specified, the driver uses preempt-fence mode.

^^ this paragraph or a variant thereof would make for a good
documentation below

>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 9bd7092a7ea4..1c574dd3bed9 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -596,7 +596,7 @@ struct drm_xe_vm_create {
> 	__u64 extensions;
>
> #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
>-#define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)

... here, or within the kernel-doc below to make it more useful than
"Flags".

Lucas De Marchi

>+#define DRM_XE_VM_CREATE_LR_MODE	(0x1 << 1)
> #define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
> #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
> 	/** @flags: Flags */
>-- 
>2.41.0
>
