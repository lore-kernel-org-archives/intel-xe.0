Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B3C27C79
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 00:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007BC10E211;
	Tue, 18 Jun 2024 00:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaFmF5Xy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFF210E211
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 00:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718672092; x=1750208092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4bpgaOJ+MYL11Q/LOla1Wl0OFDyXBdHDhl58N3rIHvM=;
 b=GaFmF5XyoVt4wJ6nGBc3tcXZqzmkQssvkcKFTFlg53VV3kcOUdFs3UBe
 EM6DVWQZxn7qqSkLuKsN4jKaRw/6RFok+ID4hxiGapYsJci/8el5RzXli
 48BDTp+wGnqUUiEe+nBjt7xsm1MrXkbvFBBPLKYstFEvZ5IVMu5kSt6eb
 v5ZvQaCZhXkGjrT4Ba3pEdguyCWxw//x1tdFzDTl/BIWP8g/zVVSe4snt
 BEOwxYhE1JSVXOAo7MGglXW04F0aEJ4htHj00+luYuBVxKX7zpRNRsphA
 gJzszTbLyI97DUnnUnBgKebZthilfum/s2TwY1/QLPddCenkw9OKK3TwN A==;
X-CSE-ConnectionGUID: cJzaY9JGQLKFgaxPTD29vw==
X-CSE-MsgGUID: 4V7b8oztTAyFtFtJ0xDNIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26938063"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="26938063"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 17:54:49 -0700
X-CSE-ConnectionGUID: pQQcEujrSgyws79QQRuHhg==
X-CSE-MsgGUID: SKgIle5XT7aZO54zfLxObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="46489126"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 17:54:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 17:54:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 17:54:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 17:54:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7qxDkOLoYPMsADPyKpvdPeT7n6UYfczezH3bV3sDn+6pfuR371BHTpSnGhw3njfcJnWUIeaiEvDTGRfE8VfBt6wufNo2QvFdkMZBttMUxwaXtJ+cjgLO06cwV4UHZYRMLi2vH/YdOvvKtoqflLzfpF5jCowXbvNVqJYGKh54SYWdeplCEC580kpVg48ZCSJ/ahUqko+dBXwpR4DrDAnB2vJKff6P4TxFmer3PsZJDrFDg2AfN2GSLw3gtB4npcjEsIzYG4NT/HVpphJkTrTB6FcxByONp9ldc7irwGLUakkcu2t8ExuBEu3wF4Wu4ytfg2vXF5bOKj30RxlOLC2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sXBQTt9OZvDq95iEiDZ9il5eH//loAQxWucN5zT5l4=;
 b=EeUl907DlSuuTiz7/DvaHHV2Bt6nhpG7m/htSuypXro2m5SBuN13ssbL1YfU+LPBwvCour9bfx9nJRr5wDnfeAQO/m+752v/a5CiboCkkgCaEojAGzj5o88RGq08jOXCLQ02eHHrLOtsPUoacImCUaMMgWFsOMhc7TOR1wcmjke+Pubhvk12fNUtPsUHiw+4PRp2S4dOT63gZ4VcAfwjaZOuutc+3yG455T1/J0rwRKz1WPH0e+vbeF1qQw1zvAgKrB6K0FswQKTncAs6z7CHP/dPe0O/0Zde4kqijXlaXSQ3mgMQ39bTowza21m/Dxf+MmhlOsMzmK1fDR3+s+JVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 00:54:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:54:46 +0000
Date: Mon, 17 Jun 2024 19:54:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <h7yjiengrjzue7acsaghy3r3fimgp4v5ntyujytd2ddqt3kxgs@erajfxzizsns>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
 <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
 <ZnDHIba3eBe1+p8y@DUT025-TGLU>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnDHIba3eBe1+p8y@DUT025-TGLU>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab412e5-85f4-415f-7a02-08dc8f313f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021|27256014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2SvCy9ZYDoi9PX+S2XCRs0UujqtjUuuMEryq4jYgb1tTo1A2DdyGUI0y3Cet?=
 =?us-ascii?Q?z6mCN2FeNyg+I9LfO0yNnbghuMLmFRO3PujBq+YxsPTAdXUC+cBDeArnQc6I?=
 =?us-ascii?Q?jSbqKqSJe21lKK5O5TycspGhEwUUqlyDsv4x68aG8PS6zMGCM4XQ1mQlCnEp?=
 =?us-ascii?Q?Z+l1DZc2bM7EgmQGGIqM23JDaBmJJfM2ky6+ddUx/fZ2tEc8YILUEw0EQiT4?=
 =?us-ascii?Q?u8gbk7lgOi5bGR3AaN0TgBWd/5YoUVLFsRAWNoERLU1Hfe6rlYbQG3EuY0YX?=
 =?us-ascii?Q?L9WTQ0Fgas7rKzEFEvk5TF5jYDre9EKciNOwFQS3juxxOCMjaKVqgNg4qfqH?=
 =?us-ascii?Q?qu/qWOLD7GwWgZoqQ7S39MFyOd4aJ2wP3xPk6r4uim1S8zIYxOrZQu1N4R+z?=
 =?us-ascii?Q?yEUTIc9JptnmLs7rxz1MeO559nmQISJBJvoOxz8ivsCzO07p+Vs0oj4f2BXl?=
 =?us-ascii?Q?GNnf7ulT3J1iYS5WqecLRhk+oaxfDzEr8pV6Nj23ziNRCW6sC/h0WvP+NxVH?=
 =?us-ascii?Q?cF0Tuv3C4n3gnPdoGgN30dYHG+sZaMrB63uRLLjGqYStsLoVZM/F/Upc/JsZ?=
 =?us-ascii?Q?Us4jpK1ryK1yN16hiSglkP/Z6W0w58/Tsimv33yDZ55/NYhvTRWjyUp8ux2/?=
 =?us-ascii?Q?Z1WXnfcWKV6MkbCTITIPzWOfKPI4c+en9DZ99Yrj06ZPiqR93Qdkh0XPMj4g?=
 =?us-ascii?Q?+nxH5/wLsknsjtgGj4MoTb5ac7exyOjX8qC92rtXFdE06xdk6/2J0vzFclJI?=
 =?us-ascii?Q?o/Zk2V1O+b0dpqHJS5ityGTANuu6kcAkmDKOw1m2cUcY+MdWX94HGfTiKXjE?=
 =?us-ascii?Q?CznzwDpo5VQi3ubvJpNgbUCXhKAeA7kCvOGemVdZ0ZKDeuF1LYGtR0lscQNs?=
 =?us-ascii?Q?bdAgKuYjC+Zr83J7854o1TVEftB5yA0zi6CjVWZGTWzgb6F3ukspx+8ZdPpc?=
 =?us-ascii?Q?VNUDyZC8f3G374Uu/dyyKy7HQYgi716hI48XwWy31SXz+6WrYpOtQp7o/GOY?=
 =?us-ascii?Q?C2Jn1MrKDXisey6NERataPJeY0dejF1c/tv6/n1+m55cvE6QWYF3qfGR2GiZ?=
 =?us-ascii?Q?CCrutfBzHhHVWCDg50uV/b/bwrIt6qkxP2YlOItiUDX4yuWsXGBYQ2WJjcSy?=
 =?us-ascii?Q?ESToA2284ixzMaOKoa1MzcK/uQgqgWhjDU4P0ip5qM070Fn65vVYoj8StohL?=
 =?us-ascii?Q?fELFwLAEWXDRzIQQNg6qGUfYE189T/7cAUFyJWVaxgIADXNC+tvYOod9fwfZ?=
 =?us-ascii?Q?lPLMmbBSqAxQppsYegr0OaWjMcokqTb7+xlsUeuAU8aJN+mOhCn76Vmi49LH?=
 =?us-ascii?Q?aaPjP0zPTdzdVTuAWsKEXQM9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(27256014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6nGrazevUxeQ/48tPuRcVEBiC6MZhYex34Y/0g4uHlqT3Kvt1bB65nyHDmep?=
 =?us-ascii?Q?KSxvWAhualZWiFl2eFw3glWO4blrg1NvS8OpKoFU5/qtDQAwFcP2KXCS4KF1?=
 =?us-ascii?Q?G93k5HPmn6r0DXRis1UsVZGYRxjw6lEuRHT5zuuNnD4lVmhvCLOYgbebjHsa?=
 =?us-ascii?Q?u70D0nD8IcYcGHigxiPDl7ZARiBBl/Wdihhc0zDwNUnbhuxwWEOkPIhLK/XZ?=
 =?us-ascii?Q?YbMtpnpBIm1lLH8bJEgjmJPNKKeMdP+kZgeotD/bltS19lCElDW8JSjIYK0q?=
 =?us-ascii?Q?Uvq8yhB7V6sKYNI71V07SFjKymhh1Oiqb/7kKMB1WuaU2zfGDn04dMcGCj6s?=
 =?us-ascii?Q?jZPsNOos50UswWQLPhy78FKmpfnYn1vcwudCreB1/aM37LH+/uw5Mj8UgfSM?=
 =?us-ascii?Q?0M0z+P8SuvtzGoAXmXGhSsOBDRqbRB4JpGZX+b2x2ChuSPj8yN387sF48wEC?=
 =?us-ascii?Q?vAAAdmJ/AG69xC6R2o7t2LXAnLdQ+hVubhJcumKbC0fMLE3YoKDxfaUt8Tv6?=
 =?us-ascii?Q?XMI4k5RdNDnjoXXvqOQKot6CqraLAljBYXBtEWCAl8DOoj/V1uJB5xNOoLXB?=
 =?us-ascii?Q?B55v0++QaZKXPMXMUmQxu/x2AJ+8qyU68UsYo03E4p1DSA9w4Kw/25nvA+45?=
 =?us-ascii?Q?UTqMzfsJ0KS0Qa/DOLMJ1msx4/UqXDicwxvPMWnYIPVKisnoSfSG2VcMEnEW?=
 =?us-ascii?Q?m27IExQZedAD9iS9m0bHa/S/JnH+cEirWEi9jLsxgfUycRR5hHgudO0VjIlh?=
 =?us-ascii?Q?OSGz/fugXlYsDqlV6pSnHClZulPvZcqYhaZ1KjozoBkGyLSY1+YQFJrCl6QV?=
 =?us-ascii?Q?2tWbbfYwUKf56xeFcDcMyRpSmi7mKhYcMOtmk7he4E/QHjcRAmtK4/sqxtBu?=
 =?us-ascii?Q?uI3cu1svBdd/0ZnCZ1e537moRGDWfohZ0EH8UBhXGIIu38d4LTq8TdifReXQ?=
 =?us-ascii?Q?Rft+H9lkSkwcwIxFC26bGqSjtuhnb5JKN1+QgYTS+lWWLbG0pxXy35iKFV5i?=
 =?us-ascii?Q?PU0MLCS1SLKFMBfuyA8YEmrr20XqVH2MGU2GApWmfPYbGaU0TSTxVVImWN7i?=
 =?us-ascii?Q?3Mu4V22PuD2te706uEw5IMaT/ErLXTsIWucopqiOR5h9pRWi8N+Vi5dt/fWm?=
 =?us-ascii?Q?tdPKMSGWMV9yiWWNaR3InjJvX0J3Q7159f3nWqdkqRPT5/Y0q94O4gQROicX?=
 =?us-ascii?Q?ndwLUVPh2cSKUstePRnbqbYl2Wvzgg2XV6VvZsMd783ngL8gLvDirV6P86rx?=
 =?us-ascii?Q?dkCM3riBNFFYoE3csLeHktc2OnZS1MBun8OdHVhr9Abkj4WLId1dDziunnpP?=
 =?us-ascii?Q?PznBwXEw057cftlBU1WRNCvCCUXlMaJBKUHJFodLdme/8fP+pmc1Nka8gUwe?=
 =?us-ascii?Q?wK57UvrvV1TjaD7pA+oCa10GChuFXcx/ilB6faPvh+Ob9QWGF7PmYwxRlw4s?=
 =?us-ascii?Q?lTKrjXYArv5Pux4GedhQxos1ZV0WCCuekBATygyrXRfNwL4ALb2BEo4pVPvs?=
 =?us-ascii?Q?OHe+RuYq2cggSVjd/gPe1gNQrh2QWdCpROB9wi68+NLUpBB1487PSU8V//EN?=
 =?us-ascii?Q?HR9j1T5fNzQEhOt3McshS3Kl+K36r9azfzkHMU/TnDFV2SqnSs2luUdBP7if?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab412e5-85f4-415f-7a02-08dc8f313f82
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:54:46.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baqXcFlnB0b3qun2ad/hrWIZDTKvA0mPbPOTgivvgfu4NkpSsm0QQFTcBKZ9FurNxHdWua/UD8y/S2tWvT2suM44blXabp+zDBjZPdTma2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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

On Mon, Jun 17, 2024 at 11:30:41PM GMT, Matthew Brost wrote:
>On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 17.06.2024 20:00, Rodrigo Vivi wrote:
>> > On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
>> >> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
>> >>> There is support for 'classes' with constructor and destructor
>> >>> semantics that can be used for any scope-based resource management,
>> >>> like device force-wake management.
>> >>>
>> >>> Add necessary definitions explicitly, since existing macros from
>> >>> linux/cleanup.h can't deal with our specific requirements yet.
>> >>>
>> >>> This should allow us to use:
>> >>>
>> >>> 	scoped_guard(xe_fw, fw, XE_FW_GT)
>> >>> 		foo();
>> >>> or
>> >>> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
>> >>>
>> >>> without any concern of leaking the force-wake references.
>> >>>
>> >>> Note: this is preliminary code as right now it's unclear how to
>> >>> correctly handle errors from the force-wake functions.
>> >>>
>> >>
>> >> I'm personally don't like this at all. IMO it obfuscate the code with
>> >> little real benefit. This is just an opinion though, others opinions may
>> >> differ from mine.
>>
>> except that is more robust than hand-crafted code that is error prone,
>> like this snippet from wedged_mode_set():
>>
>> 	xe_pm_runtime_get(xe);
>> 	for_each_gt(gt, xe, id) {
>> 		ret = xe_guc_ads(...);
>> 		if (ret) {
>> 			xe_gt_err(gt, "...");
>> 			return -EIO;
>> 		}
>> 	}
>> 	xe_pm_runtime_put(xe);
>>
>> and thanks to PM guard class we could avoid such mistakes for free:
>>
>> 	scoped_guard(xe_pm, xe) {
>> 		for_each_gt(gt, xe, id) {
>> 			ret = xe_guc_ads(...);
>> 			if (ret) {
>> 				xe_gt_err(gt, "...");
>> 				return -EIO;
>
>Just responding with a question here - haven't looked at the rest of the
>comments.
>
>How is this not still a bug? Looking at scoped_guard, it appears to be a
>magic macro for loop which acquires / releases a lock or in your
>purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
>step? I see coding patterns like above in the kernel [1] so I do assume

with __attribute__((cleanup)), the compiler guarantees that
it's executed when the variable goes out of scope. What you are probably
missing is the use of CLASS() declaring a variable inside the for, which
uses attribute cleanup:

	for (CLASS(_name, scope)(args),
	     ...

GCC's doc:

https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

	The cleanup attribute runs a function when the variable goes out
	of scope. This attribute can only be applied to auto function
	scope variables; it may not be applied to parameters or
	variables with static storage duration. The function must take
	one parameter, a pointer to a type compatible with the variable.
	The return value of the function (if any) is ignored.

	When multiple variables in the same scope have cleanup
	attributes, at exit from the scope their associated cleanup
	functions are run in reverse order of definition (last defined,
	first cleanup).

	If -fexceptions is enabled, then cleanup_function is run during
	the stack unwinding that happens during the processing of the
	exception. Note that the cleanup attribute does not allow the
	exception to be caught, only to perform an action. It is
	undefined what happens if cleanup_function does not return
	normally.

This was only possible with the recent change in the kernel raising
the minimum C std to gnu11 (uapi is still c90 for compatibility):

	commit e8c07082a810fbb9db303a2b66b66b8d7e588b53
	Author: Arnd Bergmann <arnd@arndb.de>
	Date:   Tue Mar 8 22:56:14 2022 +0100

	    Kbuild: move to -std=gnu11

	    During a patch discussion, Linus brought up the option of changing
	    the C standard version from gnu89 to gnu99, which allows using variable
	    declaration inside of a for() loop. While the C99, C11 and later standards
	    introduce many other features, most of these are already available in
	    gnu89 as GNU extensions as well.

>this works, just confused how it works.
>
>With that, any code which isn't easily understandable IMO is a negative
>ROI as it just creates confusion in the long / makes problems harder to
>understand. Again this is just my opinion.

I think that is mainly about getting used to the pattern. I think we
just have to be careful not to overshoot on trying to use everywhere.
For example, I don't know why there's already a second use in a separate
thread when we are still discussing it on this one.

A very positive thing is that this is not xe's own invention and comes
from core kernel, maybe from the hottest path that is the scheduling and
locking. So I very much disagree with arguments raised here about
a) this is an alien thing and b) performance will be severely impacted

I've used __attribute__((cleanup)) in several userspace projects in the
past and it does help avoiding problems on the error path that is
usually not very well tested (and xe's track record on error path is not
very good either: those were the main issues being submitted in drm-xe-fixes
for the last release). So if we have a way to improve (and that I've already seen
being used successfully), I prefer failing on trying than on repeating
the same mistakes.  In kmod my only regret is that I didn't start it
earlier, during the bootstrap of the project.


Lucas De Marchi


>
>Matt
>
>[1] https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544
>
>> 			}
>> 		}
>> 	}
>>
>> >
>> > Well, on the positive side, it is not adding a driver only thing like
>> > i915's with_runtime_pm() macro.
>> >
>> > But I'm also not sure if I like the overall idea anyway:
>> >
>> > - I don't like adding C++isms in a pure C code. Specially something not
>> > so standard and common that will decrease the ramp-up time for newcomers.
>>
>> does it mean that the use of other guard patterns seen elsewhere in the
>> tree is now prohibited on the Xe driver ? like:
>>
>> 	scoped_guard(mutex, &lock)
>> 		foo();
>>
>> 	scoped_guard(spinlock, &lock)
>> 		foo();
>> 	...
>>
>> > - It looks like and extra overhead on the object creation destruction.
>>
>> from cleanup.h doc is sounds there is none:
>>
>>  "And through the magic of value-propagation and dead-code-elimination,
>> it eliminates the actual cleanup call and compiles into:"
>>
>>
>> > - It looks not flexible for handling different cases... like forcewake for
>> > instance where we might want to ignore the ack timeout in some cases.
>>
>> there is scoped_cond_guard() that likely will be able to deal with it,
>> but I guess we first need to cleanup existing force_wake api as expected
>> flow is not clear and there are different approaches in the driver how
>> to deal with errors
>>
>> >
>> >>
>> >> Matt
>> >>
>> >>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >>>
>> >>> Michal Wajdeczko (3):
>> >>>   drm/xe: Introduce force-wake guard class
>> >>>   drm/xe: Use new FW guard in xe_mocs.c
>> >>>   drm/xe: Use new FW guard in xe_pat.c
>> >>>
>> >>>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
>> >>>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
>> >>>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
>> >>>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
>> >>>  4 files changed, 82 insertions(+), 50 deletions(-)
>> >>>
>> >>> --
>> >>> 2.43.0
>> >>>
