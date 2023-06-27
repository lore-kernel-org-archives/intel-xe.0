Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A72EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 19:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29A310E058;
	Tue, 27 Jun 2023 19:32:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861EA10E058
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 19:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687894351; x=1719430351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IVnzty0BWKQrbu0Mw78Ep/wXlfM7pZgfqVGv/qHZjHE=;
 b=XgE1BEyZ1Q05D7sExxyu6gACDyaPUxpmBOWy67YRhUYPLb0+p4d9xFYY
 jgWKCFoXwBiqTyl4zT+fMFCf2wTTVPFpymGfPMFFaH5OjfywJBsHtEAVN
 i+jlOMdmjPd5tTiqTvrsDfP4ya7kBu8LNlkpNPBxA8ErI1q+8PKvxr6ZE
 C+IRrzM8yAg+hVj2ZGcnDEAhp8uU27Vk/KKEps+gsybudXv4ImuEORd2N
 dNzGRUNaDg7a2GWNnMuTQlGTv+QqyFk7RO3Y0H4sSp6MzcSaDun3mvyYO
 rgUGQxreOjW7s8Pb857SzurXGRo1lVe2MvIa2jGdleHCuxKnmM8TEXgEf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360521625"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="360521625"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 12:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="806622140"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="806622140"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2023 12:31:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 12:31:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 12:31:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 12:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xrp2m+SWqgI4y7vFiG016BL9+/sv6MLDRXxDPN49ElrC+inmjjsSbbho4Z4EPc5VQtFVbvDY9HzSi7zTibpZs6+2Ikxig3eQHrytH+ClpNzf9xC9HJcW0r4dRA/aDsVhFSeTNzFId+QBqJbCXS2bKnwzalnpBmv29D0m+LyFUtcomqFVgXRIg9pYwD8DLoYlQorvYwabab0O91JcqhylYdZTBo87mE5qBa+UMq+HTH0MiclCPq8T/FegsNjVTx7i+UVkHrGx974CkDWK/HHfQJVHCyBKPlGgNtCYUVDoiB0zetd2a+Ug1156cuZx08c47dYJyiwf5qWwmASlreWSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZmHlM0bK2H97Metl7sgGMYmgmWQqA0iXI2wVg9H1+A=;
 b=beds6ZNvI8n8gEB4kh8lH0+W3VhOWYCpCUm+HCSot6Mxp6GKRZbqPKAhlAr+SmYd2bFdKPuRngZoje0WeF1Hpxxy4ZQaBSBk2B6m/zuxtP5DKdobRDsnXVaevwxlW99jbxRkvmN7r+XxdsE5eg6CFUJ8X2ZTv5tbzpqBK/2Jj+j6DMVxg/tLYpOsGbGom6jKOk5s2cRES5x0tAihVVwenv3MBWBnMOjfm4xlTnTIivMUyMw4yto+kQIQ2Szegt0qNWoiVEgym/oWT/y+w4gupCEJGIlquZV5cN+66SVdpZhNA+e6wkRCx8gsG5AX9e1DBS7oF5n2q7aAEwgIRpmiAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 19:31:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 19:31:49 +0000
Date: Tue, 27 Jun 2023 16:31:44 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <fm3rj2fwfvkzcmd3urzzrtrdzgfypxa62gd6npqrvmh3d3x7w7@eaktwcee2adh>
References: <20230613183047.787756-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230613183047.787756-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea41e50-a86f-48a5-8186-08db774526cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Tr7l5KnIvB+gvCbVj5JE+ZA0ppqg/G6cyCnLV1JsS3YqE8eoLIVyzUf7LG79eC99RZr8PpniHOeAA2C5gHa5g6/DcPZddVSYuki879teOkwXnRWNfhrujsbOUTmlOBB/bAEXNds3qsemFEorloof3yKkXSeUmv4pPMIfMZJ4cDQIvFuMO9phKVF8V806MMFkJ+/3ebzMX6lRV/zZC6nuZRhVJSztwVxoH24Kcc8cjGuw1eN31xaWCaON2mCoDO7Es1CXWiEYUSZb2ov3dpWVOfoMuI5Z59dacHE0qaQgU2IaN/vA+hjVLlzrm/5pOa/zNptWcscO8p6XW+K6iztbASir4nS65hQBWA/bQlUEsnmal1dl63xzfiCzkP1oJwpwFm6rIRsJIbL/OqRpd3c4of+qovey3vyuWo//BE59+LiCbNhoRP563DFhGf4G2XhGy5CMaIeCHnmISk9oT9e9/mZTf3QJAGQbf5sWYUVKC3Lj3g3VVPjyC3t04Pis5M1PAnbqxDkYMh/hsQphKuk/ijMiMtY/RfvJO/18zuHJjho3pwX/Kqsd3BMyub8LKKF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(8676002)(8936002)(66946007)(66556008)(316002)(66476007)(6636002)(6512007)(9686003)(4326008)(6506007)(186003)(6486002)(6666004)(41300700001)(33716001)(2906002)(5660300002)(6862004)(478600001)(82960400001)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z2ajNhyvVEma2uRb7VSclzBKMAKjLfAuKX2VJ5eXmGtEcRIfEWNfcNQfAgxf?=
 =?us-ascii?Q?JAHyXcdePjUkwz6gxtknJQCcDb3OSZBjL5Wsx2qId+LBi0SuAeNg5BsTvQDt?=
 =?us-ascii?Q?RkRmg500Ayz3WTz2oaessTdM1XkvspQESLVg3tEFpnNI2T0LcpbMhBNUDVV6?=
 =?us-ascii?Q?Y0WfvEHhjblsshSbcHgqaNKHT2cxqVnMOGwiMDllPeNifUjldUErEbXw2GIv?=
 =?us-ascii?Q?sWJi9ah5X+pD2xwqkdGA9eMFnnRLlhacSQBeZ79ahWJ1oIGbJbfNlXlt7NCn?=
 =?us-ascii?Q?qcrmnJYkU/9KbRnj9gm4ZnlnhQIABeA10rOUJZx4hhF5NpPo/KBs62krnURM?=
 =?us-ascii?Q?0SDzRROm6q78QCGk5llcb92epnkZVihxYT/5kWHJgz36IfOHYy1BFuirEINk?=
 =?us-ascii?Q?d0togcL5BY5Aw/GL8CB2lgr66OYtiZSgr/XSriIvGUjfDSANWXGQtTxoQdAu?=
 =?us-ascii?Q?j92d+8GtJc6R4VPMCkG0+9ktvWiwXExRPfcy3GWZvNjNy604mj8Ws8UtZKOz?=
 =?us-ascii?Q?AqwvPl650f/fsWRbB24mApN+AbM6sYJ44UAr24+tSeC8/w5L2FazGryLyD8c?=
 =?us-ascii?Q?QjZydrqFj19IYxAla8hTo0cbVu8bk9dCGqRf91n1df9WPWuIyNA2DZwaaRV9?=
 =?us-ascii?Q?Pfzrnw4TxxhsWioq7CDrHTP+Z42xy7Ym9Ht1hvdtiiGSHaXsmXsLuDC8f6Bq?=
 =?us-ascii?Q?iBaYrr3aDSEz9vHFtIhQZI8pvsJ71OdYAuZWxYwBGvqEftpsL1/G799NZ+jt?=
 =?us-ascii?Q?7x9+ZBXjgsJq1SPfwwx4+MnvRg5DQcV1FEsDs0MxyNnvePSsHmdMxQEMpP+n?=
 =?us-ascii?Q?9DUhDguredZzSsmd3ysgRGEk0dIwV50KBMPXpmxcWsrek/EN0+IL+cOKDoC5?=
 =?us-ascii?Q?wYm57jsDHbncAnuUqCcjviRwD1s9fhSRr2rKvHErauoresk4MkqUVYfsgsFr?=
 =?us-ascii?Q?whdYHAIGIqsJXUM4aM4VIwye/fEwVh+PNfn3bAhAP/sYgQ86dJOFw75/W75v?=
 =?us-ascii?Q?qLB1ii8xE85dXdrmSZx0MjtHBEsAyLsOA+TrYm3lVKZMIwelsu+PAUGjs/0C?=
 =?us-ascii?Q?h/pXNh+42wIbPnDd4fyi2m1Ix36PtZjaADF9YBbzkNJ4AVBY/x8jibB1APNt?=
 =?us-ascii?Q?/l5at6FGYIDy7K2d7Xl7DN5VhiS9NlPe0H8fs8+DtISmoMyiHNjhhpJ6vvkr?=
 =?us-ascii?Q?1QkURyfziYaJ0LMSLGo1hqqIAwmgRD1EVxVQw62QlrIto7V/NyYMOrVaPUpd?=
 =?us-ascii?Q?VFj4pyByiWHniilKbLcKxJm5XsBcVSx610rLauOT8CEiCXd2G3dTzK30WSEK?=
 =?us-ascii?Q?xqheXWwweCQgSe5bNr1phVXkQQsZShtfSeF7/22+RKiUVnrckDN1xo+SBaJO?=
 =?us-ascii?Q?hcxKdyhhstnERQhoTsaBjiBl0KHRSVssLN7B54Q7tRbQ873fC3MbNzGnHymn?=
 =?us-ascii?Q?vKFoasNpZa/R25bCchuWpp+ChuZkGeOU47rKmXlCk7fJWL/D+ecMxqP/0FOT?=
 =?us-ascii?Q?ubWhumnNnzuSjqg3NswxKQmrM2rXFVw35iCqDHROcDUjnjVTPoWoBvBZR3zZ?=
 =?us-ascii?Q?8/MDwRjplKB3uK7hV7H8jDhkRaeos7A3bNRVsEzNR5mK0plozInfl5sH4aNL?=
 =?us-ascii?Q?eB6Ub8BkUkz8OjGbSMGm895MlxUMkvy0gCijTuGkqTrHTLFDHq2T7MJPyoFD?=
 =?us-ascii?Q?3Stmzg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea41e50-a86f-48a5-8186-08db774526cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 19:31:49.1905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBZvm2HgutT13WfiSseckOWS9z4u9Obr/mLWsNkGV4JvRHBtFsqN11F3oEyaCEGgq2J3dH328LgxU1B7xBhCA11J3P3xIAZLxlW9md78lXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/kunit: Handle fake device
 creation for all platform/subplatform cases
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

On Tue, Jun 13, 2023 at 11:30:46AM -0700, Anusha Srivatsa wrote:
>For platform like Alderlake P there are subplatforms and
>just Alderlake P. Unlike DG2 in which every flavour is
>either a G10,G11 or G12 variant. In this case(Alderlake P/S),
>the Kunit test evaluates the subplatform to NONE and is
>unable to create a fake device. Removing the condition
>in xe_pci_fake_device_init() to support this corner case
>so driver can proceed with the unit testing.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

both patches applied, thanks.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 2178ad71c0da..a40879da2fbe 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -139,9 +139,6 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> 		if (subplatform_desc->subplatform == subplatform)
> 			break;
>
>-	if (subplatform == XE_SUBPLATFORM_NONE && subplatform_desc)
>-		return -ENODEV;
>-
> 	if (subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
> 		return -ENODEV;
>
>-- 
>2.25.1
>
