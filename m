Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D23C47422
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 17:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D8510EB71;
	Thu, 25 Jan 2024 17:26:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D138C10EB71;
 Thu, 25 Jan 2024 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706203567; x=1737739567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cg9XqrN1AnLUaaxBYPu8lK/CGEuLmu3y9kciKqHx44I=;
 b=fVdw4m4UFw4XI3/Yc63qPBM/xsENYx5mVqOJB8fRvVGZb2aLycR8Zhqw
 RZu6bOFzu5783TWVX45hmNIxIb+Br3DAoyznBat8oGileX1mq1rr4v4OH
 f2JAptbpoamw67Yy8XJYMeWMu2eMYMD09Ulwe7+K6t4rhxPYYg6gismJJ
 yRujIM76zP9yfO6uBtZBd7UU3Pg/VOEozer06y5BSFAzneh8OGcmU8BFF
 K2LHA5WQn/tYzOFgUqHZ9UPRfLI+iRQOT/ETDSFEC1zk9kFFTt6t3BlAC
 E7ZjRTYtnqHMUDYHk6Q5EO6sQdd7MuPikyfU1ayf6S0xkqRKkJl0jKyZZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="8886414"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8886414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 09:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28834006"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 09:26:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 09:26:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 09:26:00 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 09:25:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+w3F8W8u8K/UYmtre3kGzoWSvPGXdprROJTR/Yu+8JMhFQ3LUOENL+zcn2Jz7frpgeGLfcxvZ6dfU76YQydq9VeP0P8t72iF7Wax5AozyXMS9uerhGQ7ypz0vmFD9VgSe+FxUCDFo1yyysKFRiz4GfE+C30Z/s5AavXHGcalne7adK4k/uHJRrC5bzo4XEMm8uHgStAwE4TLWPUUtgI1hIrfOLgfmVTYZdJ40k5y0ymbdyQfSr1QckaGQsjIVvJiu0xVoglsiA8h9Y6A6OBLj4xkvoI+VQvQw7VgHy+VN1H2CkZJP8NIDj5H/3R1wVNqXl3iLNoG3T/afOVwpYMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faHXOkTjmtbwbfp0rsgD0XH8sds9Rnv2x7NH4nLCgzY=;
 b=YxZZFroq94UZjaCQOLPMed/4PAX/c09lxRQPYotr/D0mMLV2AvBKIURByT1sT2i/IvfvqfPAx9pDqnP71we5W9Cca8UVrrBLVsmIc9C/cEnt7l2qNtnn1UtH32olHvwCSlthJOsdlJEywoVyOc3K6M2Bqo/dD5Fs/2gwS5Tvn1Rk2JzwvaPzFeDAej/4Iu8L8e6X6idJuV3EmfQQonUqPhflkTEVd1SVeM6xdWvxgRmuVtdzgUhOAaEJHHXBezj1En5r3jb2i75l9Tkc5aXIvwe9r0Bs6GJwF1vqO3RJCpPNf0owSSOTnqZaqONrJisHk3c+nnWpUezufWA1hIFIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 17:25:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 17:25:57 +0000
Date: Thu, 25 Jan 2024 11:25:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/3] lib/kunit: Support writable filter* parameters
 of kunit module
Message-ID: <o5um4wakpooxbxd5algtfpgqmwar5lb2dkahdrc5zkma3nvlul@j6jyzvai4aht>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad9a064-35e2-405b-1590-08dc1dcab11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObYuLxKFO6TSDCQzUgmQXIoSijaXsTnk9lQmNsr8hVT8b66hM0G9erjvlByEFbQ3fJ0JkSeLN/7Qml/TF1QYCXLptV8/IPU3mMYQIskV3/wtltFRfkkGGW451ry5iJX3VPJJCwvD/3yez9oBIINRK+pGcrMkkVITzYB/yLPJZ8I4HcTwZm/1FoMdCGfDMjXhj/Dors3B5EqHYsL5rNr9iO31VXRGk6iOrWbkKwepj8/JnC3AiK1s6kVKYpHSrd4+NJ4SkCsOsVloR7qvkD/br1GJufzqhfWLt4CCB9A0b2rstuA63MhwUFZ0Vjul4Q6u9aF129U6Iw+ZQ0WYKUn+N/SKWMjPTMGFxI5PnNgCyfpkfMGnz4PAxbNkAlk726kg6swtjRUio5vj7XfRNn0thpD2azGQeuLL/5eX36y/w8RsCnxTdLdssqFNCem1kFG6eyeD5EFMAWJpNBSixxQAp9vKAspftPJLfyOrEdpUs5VgGew44kZ0z6k2LcX3rpjjwviUv5ugYWyNXnsejs3in8CNpI7clJjfM7AxM6JrbrA7dXsNxIAknD+uw2H72oZH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(136003)(376002)(396003)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(9686003)(6512007)(6506007)(6916009)(41300700001)(33716001)(8936002)(8676002)(4326008)(316002)(5660300002)(4744005)(2906002)(86362001)(66476007)(66556008)(26005)(6486002)(478600001)(38100700002)(66946007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9niIKY19TBmgWI+gSpauoPHegDv4MWCqzBWIIUYcKxYdBn8ewLky4zFBje4Y?=
 =?us-ascii?Q?WwDz6M0QUkGWXJt2VTZRf6tErL5+YsxZRas3jhHTPs4NnmXzoXk/jN9MN7P0?=
 =?us-ascii?Q?woydB+y5KYgexsHIoBBvSivqGKj+zgUKOeX4nQClf5yVeTs4LAHZXB8fYWdR?=
 =?us-ascii?Q?VzXph+gK/6KlGYF+4Gn6JD2gQHMXoSbSdcZgG3GXdITJX48ylEBE8BMVUlNw?=
 =?us-ascii?Q?EOp8Bl+qqpgGMEGKyfzpUIbIXjH2qGXLnM7JADwdVMtipUAuimaxFobqnxoJ?=
 =?us-ascii?Q?LMuk50/byBvW22bpLMfTjceFg6PCm6WqG7LK7QSMiC3Z0xUrNAGE1t7Df1ld?=
 =?us-ascii?Q?75jUGTzO/GAZEwDO+MODDHHjobs+lRct8yDiVtzT1bHFcon4KMZ7rY7o1f7s?=
 =?us-ascii?Q?zO9r8NHxwgKRMid0VnOmV0a2ir189A96ESwuOVR9s5mm7lQQJaQNUq3rPOdI?=
 =?us-ascii?Q?TOKsUMoIy9nNqprtjYIr38+JlkiZ/oKpVVx2d15N1O7oxj3hupr4jlPT3ml1?=
 =?us-ascii?Q?nhYeypcI7qQP0bQrtaEkUlt4gUuw4pK36EHMbF9Bc319hxhVJCbhckUtuOP5?=
 =?us-ascii?Q?TNCt7W6md0ig/Iu74TV08MRF/ddJ12ErfUqiL/Cs+PzZh/t9rdJHryFZ4xZ4?=
 =?us-ascii?Q?021bHKptz20eOr/tjodvP12XjZqrtYrPhqWOrfIgg0HJsyQc8pXLgnE8ZtPv?=
 =?us-ascii?Q?9+2aKKZadL4GR57EG5KaOnzfhU1LGd7giAYXBYCmz+J7l2oUJP/GlR/jrUkC?=
 =?us-ascii?Q?XI68uq7rfXC1cRNWa16jwA4FL8N/cKZA336EoCdE/TpfeH6vQxNlgh2qg33f?=
 =?us-ascii?Q?pMZSmsE/wldTiNHRepQ6yZ2ZJrkAChy3XelkU3f/v++DgrPfIM5u1xYO+0C5?=
 =?us-ascii?Q?rUaIoNLXfKJFVLvL0XodFV9nCoVBnC+b/oWR9T2+f2lIAL2KbSLTr9gOO9TM?=
 =?us-ascii?Q?SUGTqvd6QWZBASAHSgiwj8rAAywjLLcx1kNfqJZyU9sTZ5AeSlmWBejoEMn3?=
 =?us-ascii?Q?AcdUZ4UUhDWYvyM9gOynziDgSAwIlD3LFhFnOx4abB8rNVgU8YKCICinvJNs?=
 =?us-ascii?Q?nRSuNsDbAR3/Pe3YhzX45uAxtVLBLDSTwNjRkPLybTA4eAUTxR6wRBBx7+OG?=
 =?us-ascii?Q?f1YTch2fLC+weFpo+pWLCJh8AjNKry0LemHCaWlck4TNkQ0ZGPIFulMUh7dn?=
 =?us-ascii?Q?MiBe5wya9n1Xb+TVODYUInIOOYC589T30MOkCg9QrzI1zxblpkKZOUkPGiMe?=
 =?us-ascii?Q?bSiFqsUf0zuHakx2s7lmGKHtz2argZCrPoOb1E3TfMD4sI/cLLLyMKym0OXM?=
 =?us-ascii?Q?dqSU7aGCt6KPX4PjBu0ete5z1ZNUitEV/rCD5jxJIGK5U/Uo1RzXtZuk7ToW?=
 =?us-ascii?Q?CYwRcp2+76ExTjaR+lx3B4RrwvKKuTQ5Wpar69KV44J0alyBr4wpEBAkxEat?=
 =?us-ascii?Q?yvWaRUdZjqlbgwQIHkdb/LHUQntIZalsfc7YBYy1kuT0OU2SD2k+026L7JdB?=
 =?us-ascii?Q?Q9c/RFSNXHxFqnyaQ4s0g/5Sdy6KOJ3p3bkLE+w53v2I/FmSDoQa3uv31qBF?=
 =?us-ascii?Q?uDZJ4AEFVs0/a3K43jTzCE6FqjyTWfDN0Z0gbPb/Gx/qGgODyp/MMVmoibUl?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad9a064-35e2-405b-1590-08dc1dcab11d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 17:25:57.3474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixomDKvRsYDqbHDip39/CLRsTo7adT7i+Gzl9EW8Nw5qubUiLaTFrWkIHtYrmshJKljui9mel8JlmxCeDmWtgmHep8F5Ji3soj7D1gagvro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 25, 2024 at 05:52:09PM +0100, Janusz Krzysztofik wrote:
>Instead of wasting resources on reloading the base Kunit module each time
>a different set of filter parameters is needed, try to write the required
>values to sysfs representation of those parameters.  If that fails (e.g.
>on older LTS kernels with read-only filter parameters), fall back to

we can't really execute anything on LTS kernel. I don't think think it's
worth keeping the multiple fallbacks we have now.

I think trying to maintain compat is good, but I'm not sure it makes
sense for these tightly coupled tests with the kernel.

Lucas De Marchi
