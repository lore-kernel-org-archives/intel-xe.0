Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11A3CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 20:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B3B10E012;
	Mon, 16 Oct 2023 20:08:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F0A10E012
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 20:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697486907; x=1729022907;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3ocMC+Ixj7dYZvkAClYURs3thak31sQosBoavXVRIfk=;
 b=lztT5Zy8XOTk24wkOUh2IPyJw1h5spPUYx1ZYGGtwbOpj3OrinmS2wVL
 ZkC36/bdw0b6P2lrhg9JtRkgasCOr8iU5WXadELTcxQb51meEcMR4D3W4
 t5BuG2SOifZp3guRcuLj9zt0YfQktPsiYhL/kiQMhzm1f7/Ox9R8mKAJq
 Q3gBT/ALUMsqaMX9pGzTBPOfNtfFr4b6iCDHkc15tx9EB60NXLt0eRq72
 RsdnzWYugBYmS33k/hyGHMp+c+JL45RdPJTpPckpwEVH6de39HFpGbf56
 4bwwiL7LoN4UW4mDab8C8eYvZtQU0Y8o/fCbnHpYqZztEZ0GvBqgsulpa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370703920"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="370703920"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 13:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826148438"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="826148438"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 13:08:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 13:08:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 13:08:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 13:08:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 13:08:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIFyVE/fjToroOlAfVf67TE2ZK1e0xbTBNC935h8D4mXfokp5tR1sU+XWua4mXrZCStIb+vLPBwSGm9yYtirKXsChEL9u1pmKEbHRMx67i8/3WeVlqX9f+Us+kuiMHd66+D9hHr/1HJrDLIvySr0Yzc3/9D31G2OwqTIPVLSA7s+pp432yRqTxcdg9NMkyHUziwqNapniVF2KyCy96sk18R2cLb3d0yJg/HYunmm835jvyjjvR4N+ompr3SK7cOh9NxImPGVErY0rojTUsqJ26AtNi6yJLro/rJ1pFvTndM6kI9xsFL2vdvld/pedpp2uFfyyFn0dYkMqBjTM2BFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbqWSahTIGlQBM5XhSJEHOMHtuxpwQG/oMcfWQtO3LU=;
 b=OM/PdJ32AFFrYSRVfSsMYlMoGhiajzq9OozHDIeyhcsjUALFkpnhWEV8fPHCb4kBdwKaRB5KQVaPnhsSuFEQ9zq2mfI2sYgarSf/wGZpeoQRUJYWvNz/vffS9m2IC2cnchyBsU6XXQ0IZMjd/feUsqTGLjQmmgUihxPtlgvMCfcKFnXVMMWGgw0BxnzAUfbBprt4q13GZ8onzXY10y+4EegoOqAWAk6YV/epeVYF7InSXRuGgjflOmIFcG7lxiOpMF7W2LWUzQMYXzOYQ6Kb+tvyG/Y8tJu5CHPQwp6rFViMoB9lgxqkqaSLj/lAPXp8iN5jK372c1w6pR3AKOfqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 20:08:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 20:08:21 +0000
Date: Mon, 16 Oct 2023 16:08:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luca@coelho.fi>
Message-ID: <ZS2YMf+umJSSYkh3@intel.com>
References: <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
 <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
 <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
 <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
 <ZShRTTLRD7ltDGSS@intel.com>
 <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
 <ZS18QYFnoxZBRAtl@intel.com>
 <cfac5572e3d1ea7e0363cc58d4230ce7135b10d0.camel@coelho.fi>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfac5572e3d1ea7e0363cc58d4230ce7135b10d0.camel@coelho.fi>
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: a073b12b-9d57-4784-0948-08dbce83a538
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZuqXdg+r9hbenlBPw47uVv8sOGyl8cLfnD57GFBpUAN7VzMySJLvrqsvLdgelna9DT0vDO0xlhqvidsJ7hn7ZM9CsSQiFsIWjpksOFA17Kl91+mdpyjBcUpAuRyQrVg6UQk5iDSMr5X2XUflpN5KYuIzCKjgIgFfglHAfEb4lGgaUkYDLgCMRCc3fuJ/hXdSZFDcHOVMnTNjpDQSAfF8L8FTn5z0uxABV2JnEX5YOCy1o51LD+S/R4SULMqIKgLRQojaNXUe4BW1o96pYUHlPE/rLvHRKROvdNpCoE5S1qxT6HsDLR6rS4/hQycp0+NQt7C4VULolGJeZVdSTE4zrJqbZipGJZYlt15wkFzgEGnzrdNYhKeCUazeGK3NH9nlvYlgkJ+7hUPcJUSXPgEBOAqSy68ElAF5VxqcWAMhg10vqGsnlRTqaiSEe5pTpnEQ4nvLepuq9K4bKBHrqxuBGYktf5VxIy1PMiLI9sF4r9pnJkqWpZo2rYqgZY7+QmRapDTBBX4an4r4yLZ0aTYFczbsOI3Mr10d6VHD6GC8CR2o3EYj1lEEhwhGHj5P7brmZOCgZmjlULM7V+LXQShNq4axm0NbX9sCpih9UxmO/iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2616005)(6512007)(82960400001)(36756003)(86362001)(38100700002)(66574015)(2906002)(83380400001)(26005)(4001150100001)(44832011)(30864003)(8936002)(6506007)(478600001)(6486002)(6666004)(4326008)(8676002)(6916009)(316002)(54906003)(66946007)(5660300002)(66476007)(41300700001)(66556008)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdIMFJJWEpSaUtjNklNd1hLZDNyNmE5N3hZcjJ2OGdkSHlVbysrR0R4Slp6?=
 =?utf-8?B?ZDA5ZC9iV1R4WWJXaDhQMXBXUkY3N01ScCt6SXNJNWFVSlc5TXdJWSsvcHdY?=
 =?utf-8?B?YmYwT0xWTXZ5VU94S3h5LzRlK21BTzVNZjMzbTE2eTFWb1pPZlJMaG5ZOU45?=
 =?utf-8?B?b1pXVFNMNGdLTzFjZlV6QXVPWDJJK29HVzhaWXpIaFBOZFFrWUQ1VFFKUVVp?=
 =?utf-8?B?YUJSUGJialYzY0RRR1VwTnhpTXRpOUJqSzFDQTJvcFhFd2hheUZnSmdmNHVP?=
 =?utf-8?B?UkdFT3pqbkx1SGx2cnFhOTI1bHg2bERvOVBZOCt1aXh3aWNYUTd6QXd0Y25v?=
 =?utf-8?B?MjgzdENJVWxlQnVNOWNoNVZueng0WUNUQ2pERGVibXVMV0FUSHBNV2YwcTJj?=
 =?utf-8?B?MS9hOEFGSjl0a3R1VzNSNDI1MVN6dFRrc2VVWDF0THFkVUJIamRCaEI5MWdQ?=
 =?utf-8?B?SCt1SS9jQjNlRE1pYm1jazRDTHlqbWVVVUlTVnluWTdjSll0alUrVkpzQmU0?=
 =?utf-8?B?NTZHdmlNRFBSYzNHSTlUaDZjY0JWUFNUWTZlYnh1N3ZOMVNGbjdPZGhwU244?=
 =?utf-8?B?SjB4MG0rRXVTbUR6bWZpK0d3eXBJVmh5VzVuTTFJVkhwQTN3MzV2bjRGMjVV?=
 =?utf-8?B?SFFNcUNZNFk3MkthWHVsdHMvVTVuWDgvaUdHZDVxdFBEQmt6S3lZajdXWnZs?=
 =?utf-8?B?WlNRbVhRc0dROGRPVVR6N3Y1K0hpdGVQcWhGeEt2cUd4bExGQzgreExhTGJR?=
 =?utf-8?B?a0FSZFZVYnM0K2pGVEZ1TEo1OVVBTXhqdU04U2EyMVlzenNzcWNWeDdrQWpC?=
 =?utf-8?B?QTZsNm9RZUpabTVHa0dicHV0bEd4Tk9sTEJCTnVmTzE0ZHBiM3FMK3AyTTRE?=
 =?utf-8?B?VTErN1RKZFBpYmczSXpnUkU5eDcwZjVFZ0tCZXRYUHlNRXp5M0xTYUxhT0VX?=
 =?utf-8?B?OGNMMjRxS3E2bWxqVk9vQmU2ckdXSk5XcDJ1NDNvenR3aDdoYk5MT3NITTVT?=
 =?utf-8?B?NVZQK2tNaHoyTGFlM1Z5dHZkTi9tc0ordXkwTnllS2g3T3d4QVhqSDdYMk1K?=
 =?utf-8?B?bFh1bGg4ZUlzM3M4UHBPSW0rMndUZmRVb2dMK3ZLUEtodFlSSlN1VE1FRitM?=
 =?utf-8?B?WVN5Z0pSTzUzSnhxL1RFc3l6R3I1SU5NNHc4RklPMjlieEg2RDNsTXE4RjFX?=
 =?utf-8?B?dklIS1ZJUkNnYWVKWHZIRWlOb0hRK1hNNGVmVlcyWGRwbVUvM0FaVm1yTVUr?=
 =?utf-8?B?V0VsQUpjTk8zUWduODVrQk1oNTVEM3BQL0txbk1XYzRLLzdRb2x2d0w0N29C?=
 =?utf-8?B?UVZ6OVJ5aGpyNGliNHZBMG9oNVhXZ3BGR2Z1NTlxYUc2Nm5waUQxenExTlZu?=
 =?utf-8?B?V2x5YnVaSTR2bDY0YWFWeDVTalRMei9vY3dBUFZBeWpGS3VPZFZrZHVLRUJk?=
 =?utf-8?B?M05tMmIzekRhYk5yYkd3ay9nOVpQcEQxYjZHZXFvVzJnd2FTZTR6NGRJdGRu?=
 =?utf-8?B?RkpuYkRUbkl0MU1CZENOUUNkOVN2cDQ2enpNVWVTR2pWN1FtcUhtV0c4WC8w?=
 =?utf-8?B?cmp5Tng0OCtNYnlpcFRuYXRtMHNEaERXaytXUUpaSjRubjlNRTNWWlNLYmhS?=
 =?utf-8?B?TXRYMU5wT2VWTTlyZ0hUYTNPTkp6OXpjRDZlWStMU2NDL25DNkk5MVRGdlQ1?=
 =?utf-8?B?RW4vSUJwSGNIWWZJL2tONENTNjc3dE1HNWoyY3BGR1hPK3ZtbUlXQzZLVURM?=
 =?utf-8?B?Um0rck0va3lheHlwclVmWmZKRU14NllFaXNpQm41SlhaU1IyYlhpN3diRmpW?=
 =?utf-8?B?ci9ubHdZaTdvay9INW5KS295QytyYkFsZFBvdm1RUTlPNXl2NjcwQjVSdlVw?=
 =?utf-8?B?L0lmUVlobXM0QmVrcEhnZ3BUVDhFZ08xZmxlMWh0UG9ZSGt2MXVzZFlEcGN5?=
 =?utf-8?B?VEI1WGdGdEtOUkVpeG9mK0hEVHNZczRsSUtSY2F4T0x5bkYvZ2VtalIrdVcy?=
 =?utf-8?B?TWlTOXR6dlVJYkhtU3EveXRkZDZ3N2s2NFQrMUppcEVkZC84cnFGRTJmV3Nl?=
 =?utf-8?B?NUhrb0d0QW5XTWY3Y0JhbmxKV0M1cEJoSXh0Y3djbFZUbmZUT3dOVU1IbTZC?=
 =?utf-8?Q?gr4Sz+Jv5lF7ol1807tudfm+Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a073b12b-9d57-4784-0948-08dbce83a538
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 20:08:21.7157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qW5qW8ye9unm1ncIzdzWdAdJuzzuDEeNXX6CZs+15gsYP7afLaIn1Z19yZ5hNTVUShU9w6mmUsn+7gc662xWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 10:40:12PM +0300, Luca Coelho wrote:
> On Mon, 2023-10-16 at 14:09 -0400, Rodrigo Vivi wrote:
> > On Mon, Oct 16, 2023 at 01:22:32PM +0300, Luca Coelho wrote:
> > > On Thu, 2023-10-12 at 16:04 -0400, Rodrigo Vivi wrote:
> > > > On Tue, Oct 10, 2023 at 10:00:06AM +0300, Luca Coelho wrote:
> > > > > On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> > > > > > On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > > > > > > Hi everyone,
> > > > > > > 
> > > > > > > On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > > > > > > > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > > > > > > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > > > > > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > > > > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > > > > > > > > > > It is the maximum protection we can do with the current infrastructure.
> > > > > > > > > > > > 
> > > > > > > > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > > > > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > RFC
> > > > > > > > > > > > ===
> > > > > > > > > > > > 
> > > > > > > > > > > > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > > > > > > > > > > > Xe than anything else.
> > > > > > > > > > > > 
> > > > > > > > > > > > On i915 the force_wake is built-in the mmio functions at uncore component.
> > > > > > > > > > > > 
> > > > > > > > > > > > With that approach we had few historical issues iirc:
> > > > > > > > > > > > 
> > > > > > > > > > > > 1. Display performance with vblank evasion that requested uncore to provide
> > > > > > > > > > > > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > > > > > > > > > > > the name suggests).
> > > > > > > > > > > 
> > > > > > > > > > > In i915 there were more differences between fw and non-fw variants
> > > > > > > > > > > of register functions than just forcewake handling:
> > > > > > > > > > > 
> > > > > > > > > > >  * _fw() functions assumed that the caller was already holding
> > > > > > > > > > >    forcewake, whereas the non-fw functions would obtain it themselves
> > > > > > > > > > >  * _fw() functions also assumed that the caller was already holding
> > > > > > > > > > >    uncore->lock, whereas the non-fw functions would obtain and release
> > > > > > > > > > >    the lock around each register access
> > > > > > > > > > >  * _fw() functions do no tracing and no debug assertions
> > > > > > > > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > > > > > > > 
> > > > > > > > > > > I don't think the first bullet there (forcewake) really mattered much
> > > > > > > > > > > from a performance perspective.  For display registers, a quick binary
> > > > > > > > > > > search of the FW table (just a handful of CPU cycles) would quickly
> > > > > > > > > > > determine that no forcewake domains were needed for those register
> > > > > > > > > > > offsets, so we wouldn't be doing anything with forcewake at the hardware
> > > > > > > > > > > level at all.  For display registers, the more performance-relevant
> > > > > > > > > > > aspects of using the _fw() functions was doing all your register
> > > > > > > > > > > accesses together without contention with other MMIO work.  I.e.,
> > > > > > > > > > > holding the uncore lock over an entire set of registers rather than
> > > > > > > > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > > > > > > > specifically) doing it all while interrupts were disabled.  For debug
> > > > > > > > > > > drivers, there was also a bunch of other stuff that the _fw() functions
> > > > > > > > > > > bypassed (e.g., tripling of the number of register accesses due to
> > > > > > > > > > > reading FPGA_DBG before/after each register to look for unclaimed
> > > > > > > > > > > accesses).
> > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > > > > > > > > > > > other times that the spec was updated and we didn't get the notification, and
> > > > > > > > > > > > there were cases that the BSpec had bugs.
> > > > > > > > > > > > 
> > > > > > > > > > > > For these reasons in Xe we have decided to let to the caller the
> > > > > > > > > > > > responsibility to set the force_wake bits for their domains before doing
> > > > > > > > > > > > the MMIO.
> > > > > > > > > > > 
> > > > > > > > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> > > > > > > > > > > bspec update (or the bspec itself having incorrect information) would
> > > > > > > > > > > lead to even more mistakes if the caller has to explicitly grab the
> > > > > > > > > > > appropriate domains than if the driver does it implicitly.  The explicit
> > > > > > > > > > > handling only helps in the subset of cases where we blindly grab all of
> > > > > > > > > > > the domains (as we do during part of init).
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > MMIO access that requires forcewakes really only should be in a few
> > > > > > > > > > places, off the top of my head:
> > > > > > > > > > 
> > > > > > > > > > 1. Init
> > > > > > > > > > 2. Reset
> > > > > > > > > > 3. Sysfs / Debugfs
> > > > > > > > > > 
> > > > > > > > > > In all of these cases I think it fine to blindly grab all forcewakes.
> > > > > > > > > > 
> > > > > > > > > > Please chime in if I'm missing something.
> > > > > > > > > 
> > > > > > > > > I think as we implement more features in the Xe driver we're going to
> > > > > > > > > wind up with a lot more places where we need to access GT registers at
> > > > > > > > > runtime.  A few examples off the top of my head:
> > > > > > > > > 
> > > > > > > > >  * EU stall sampling
> > > > > > > > >  * Perf/OA
> > > > > > > > >  * EU debugger
> > > > > > > > >  * Various OOB workarounds that ask us to twiddle a register at certain
> > > > > > > > >    times in the driver.
> > > > > > > > 
> > > > > > > > Hmm, ok a lot of these I could make the argument that these are not
> > > > > > > > normal operation so just grab everything and call it a day. If some of
> > > > > > > > these fall into the category of 'normal enough to be optimized' I can
> > > > > > > > also make the argument it is no more complex (perhaps less complex) to
> > > > > > > > explicitly grab the forcewake than having the logic auto-grab the
> > > > > > > > forcewake.
> > > > > > > > 
> > > > > > > > What a compromise of in a debug mode we auto-generate the asserts based
> > > > > > > > on a table but we still explicitly grab the forcewake?
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > > > > > > > 
> > > > > > > > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > > > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > > > > > > > 3. Are we not wasting power if we are waking up ALL the domains instead
> > > > > > > > > > > >    of some specific one?
> > > > > > > > > > > 
> > > > > > > > > > > I think we're only holding ALL domains during init; for most of the
> > > > > > > > > > > runtime MMIO accesses, I think the code is currently attempting to only
> > > > > > > > > > > grab the domain(s) that it thinks the registers it's accessing will
> > > > > > > > > > > need.  Although that might be working right now, I'm a little bit
> > > > > > > > > > > worried about how that will scale in the long term when a single
> > > > > > > > > > > register might be in several different domains depending on what
> > > > > > > > > > > platform you're running on.  There have definitely been cases in the
> > > > > > > > > > > past where groups of registers migrated from RENDER to GT or vice versa
> > > > > > > > > > > between platforms, so the exact domain you needed for an operation
> > > > > > > > > > > varied by platform.  And things are even more complicated if you're
> > > > > > > > > > > doing any MMIO against the media, since the hardware seems to change
> > > > > > > > > > > exactly how it splits up the media power wells somewhat often.
> > > > > > > > > > > 
> > > > > > > > > > > > 4. What about the display disconnection now because i915 and xe have different
> > > > > > > > > > > >    mmio approaches but reusing i915-display?
> > > > > > > > > > > > 
> > > > > > > > > > > > It looks to me that the cons of the current approach are superseding the
> > > > > > > > > > > > cons of the i915 approach. But I want to hear more thoughts here before
> > > > > > > > > > > > we decide which route to take.
> > > > > > > > > > > > 
> > > > > > > > > > > > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > > > > > > > > > > > a double approach where the caller is responsible but mmio has the range
> > > > > > > > > > > > information and double check it?
> > > > > > > > > > > 
> > > > > > > > > > > As noted above, part of the challenge with forcewake is that even if the
> > > > > > > > > > > caller knows it wants to access register FOO, and even if it know FOO is
> > > > > > > > > > > a GT register that likely needs forcewake, it's sometimes challenging to
> > > > > > > > > > > make sure it's grabbing the correct domain(s) for every single platform
> > > > > > > > > > > the Xe driver will eventually support if the power management handling
> > > > > > > > > > > changes.  I think that was part of the motivation for encoding the
> > > > > > > > > > > tables into the driver in i915.  It seems like GT power wells don't
> > > > > > > > > > > change as much these days as they used to, but it's hard to say whether
> > > > > > > > > > > that will continue in the future or not.  Who knows...maybe they'll
> > > > > > > > > > > eventually start creating dedicated domains for stuff like blitters,
> > > > > > > > > > > GuC, etc.  rather than lumping all of those into the "GT" catchall
> > > > > > > > > > > domain.
> > > > > > > > > > > 
> > > > > > > > > > > If we do decide to go back to implicit forcewake handling with the table
> > > > > > > > > > > encoded into the driver, it might be worth doing something sort of like
> > > > > > > > > > 
> > > > > > > > > > Let's not do this intel_uncore.c is an unreadable mess, I don't want
> > > > > > > > > > anything like this in Xe.
> > > > > > > > > 
> > > > > > > > > When you say unreadable, are you referring to the macros that generate
> > > > > > > > > the table lookup functions?  I don't think that macro magic would be
> > > > > > > > > needed for Xe since we don't have to support old platforms that have
> > > > > > > > > very different forcewake behavior, and we also don't need to generate
> > > > > > > > > separate 8-bit, 16-bit, and 32-bit versions of each operation anymore
> > > > > > > > > (since I think everything in the GT is 32-bits these days).
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Just the entire file is unreadable in general, trying to avoid these
> > > > > > > > types of files in Xe, avoid traps of the i915 did this so let's do it in
> > > > > > > > Xe, and over engineering our driver to avoid hypothetical future bugs.
> > > > > > > > 
> > > > > > > > Matt
> > > > > > > > 
> > > > > > > > > The forcewake and shadow tables themselves are pretty clean in i915
> > > > > > > > > these days, and if we move to autogenerating them from a text file, they
> > > > > > > > > can become even simpler since the text file will basically be a cleaned
> > > > > > > > > up copy/paste of part of the bspec table.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Matt
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > what Lucas is doing in the OOB workaround series --- drop the
> > > > > > > > > > > per-platform tables into a human-readable text file that's more similar
> > > > > > > > > > > to the format used by the bspec (exact ranges, forcewake domain, MCR
> > > > > > > > > > > replication type, etc.) and then provide a small parser program that
> > > > > > > > > > > will convert that into actual code (and do things like consolidating
> > > > > > > > > > > adjacent ranges).
> > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Any other idea? Thoughts?
> > > > > > > > > > > 
> > > > > > > > > > > Once the big GT vs tile refactor stuff I have in flight gets finalized,
> > > > > > > > > > > I plan to follow up with another series that creates a more appropriate
> > > > > > > > > > > MMIO target for register operations rather than using "xe_gt" as the
> > > > > > > > > > > target (even for things completely unrelated to the small GT subset of
> > > > > > > > > > > hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> > > > > > > > > > > operations against a specific hardware unit, and then the info inside
> > > > > > > > > > > the MMIO structure would be able to figure out if there are additional
> > > > > > > > > > > checks and/or operations it should perform.  E.g.,
> > > > > > > > > > > 
> > > > > > > > > > >  * mmio = xe_mmio_for_device(xe_device *xe);
> > > > > > > > > > >     - Used to submit MMIO operations against the root tile of the PCI
> > > > > > > > > > >       device.  Only used during init (e.g., to read the registers that
> > > > > > > > > > >       tell us which tiles exist on the platform) and during top-level
> > > > > > > > > > >       interrupt enable/disable (since all interrupts are routed through
> > > > > > > > > > >       the root tile).
> > > > > > > > > > >     - No forcewake needed for register accesses through a handle of this
> > > > > > > > > > >       type since you'd only ever be accessing sgunit registers for these
> > > > > > > > > > >       types of things.
> > > > > > > > > > >     - Register accesses through mmio can warn on debug builds if the
> > > > > > > > > > >       register appears to be in a GT-related MMIO range.
> > > > > > > > > > > 
> > > > > > > > > > >  * mmio = xe_mmio_for_display(xe_device *xe);
> > > > > > > > > > >     - Pretty much the same as handles returned by xe_mmio_for_device(),
> > > > > > > > > > >       but if a handle of this type is used to try to read/write
> > > > > > > > > > >       registers outside the display range, we could have debug builds
> > > > > > > > > > >       throw some extra warnings.
> > > > > > > > > > >     - Unclaimed register detection could be confined to accesses through
> > > > > > > > > > >       these handles.
> > > > > > > > > > > 
> > > > > > > > > > >  * mmio = xe_mmio_for_tile(xe_tile *tile);
> > > > > > > > > > >     - Used to access non-GT registers that reside in a specific tile.
> > > > > > > > > > >       I.e., sgunit/soc registers.
> > > > > > > > > > >     - As above, no forcewake needed, can make MMIO operations warn
> > > > > > > > > > >       if used to access a GT range.
> > > > > > > > > > > 
> > > > > > > > > > >  * mmio = xe_mmio_for_gt(xe_gt *gt);
> > > > > > > > > > >     - Used to access GT registers in a specific GT
> > > > > > > > > > >     - Does automatic GSI offset translation for media GTs
> > > > > > > > > > >     - Can either do automatic forcewake like i915 does, or can do debug
> > > > > > > > > > >       check+warn like you have here.
> > > > > > > > > > >     - Can make MMIO operations warn if MMIO offset is outside GT range
> > > > > > > > > > >     - Can also trigger warnings if a GT non-GSI, non-media engine
> > > > > > > > > > >       register is accessed from an MMIO obtained from a media GT.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Ack on this if we keep in managable, worried code / feature bloat those
> > > > > > > > > > that will result in a similar file to intel_uncore.c in Xe.
> > > > > > > 
> > > > > > > Just to revive this thread.
> > > > > > > 
> > > > > > > I've been discussing this proposal in the context of a change we need
> > > > > > > to make in the display, which is to introduce a wakelock for some
> > > > > > > registers access in order to be able to remove the DMC trap.
> > > > > > > 
> > > > > > > We came to the conclusion that this new implementation is very much the
> > > > > > > same as the forcewake proposal here.  From the display point-of-view,
> > > > > > > we could simply have a new domain and range of registers to protect.
> > > > > > > 
> > > > > > > We _could_ implement a separate "wakelock" mechanism for the display
> > > > > > > part, but that would be mostly duplicating the entire forcewake
> > > > > > > implementation.
> > > > > > > 
> > > > > > > So, are there any plans to implement the current proposal? Or any other
> > > > > > > plans related to the forcewake implementation for Xe? As I see it, the
> > > > > > > "wakelock" implementation in the display depends on this.
> > > > > > > 
> > > > > > > Any thoughts?
> > > > > > 
> > > > > > Hi Luca, thanks for raising this again here.
> > > > > 
> > > > > Hi Lucas! Thanks for your comments.
> > > > > 
> > > > > 
> > > > > > So, as I said in the past, I don't have strong opinions regarding the
> > > > > > overall forcewake approach.
> > > > > > 
> > > > > > The since GT MMIO is not used very frequently, I don't see a problem of
> > > > > > leaving that up to the caller to take the right domain when needed, or even
> > > > > > the FORCEWAKE_ALL domain. Instead of forcing all the callers to
> > > > > > go through this extra steps and then have to opt-out with the '_fw' [sic]
> > > > > > alternatives for the cases where the forcewake cannot be checked underneath.
> > > > > > 
> > > > > > So, for the new display wakelocks, that's the problem of adding them to
> > > > > > the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the converions
> > > > > > from i915's intel uncore are happening to xe_mmio? So, when using the
> > > > > > intel_uncore's '_fw' variant you skip the wakelock and when doing the regular
> > > > > > mmio calls you just add a wakelock_get/put around the xe_mmio call with
> > > > > > the display domain. And in i915 you implement inside the intel_uncore.
> > > > > > 
> > > > > > What's the downside of this approach?
> > > > > 
> > > > > That's more or less what I was thinking.  I don't think there's any
> > > > > problem on the display side in calling the same framework.
> > > > > 
> > > > > 
> > > > > > Trying to understand all the pros and cons of different approaches, and
> > > > > > bringing some people to the discussion.
> > > > > > 
> > > > > > If we implement the forwareke underneath the mmio call, display needs
> > > > > > to anyway implement it twice on the i915's intel_uncore and on the
> > > > > > xe_forcewake, no?!
> > > > > 
> > > > > Yes, IMHO we should start making Xe the base implementation and
> > > > > backporting the new implementation into i915.
> > > > > 
> > > > > So,for this specific case, I think we can just make i915 call the new
> > > > > functions in xe and have them backported in intel_uncore.h for i915.
> > > > > 
> > > > > What I was thinking was basically this:
> > > > > 
> > > > > 1. Implement the xe_mmio_for_<hw_unit>() proposal in Xe​
> > > > 
> > > > hmm probably a new component then?! xe_display_wakelock that
> > > > implements and export the get/put domain in a similar way
> > > > of xe_forcewake, and then on the wrapper you add the get/put
> > > > around the existing xe_mmio calls?!
> > > 
> > > Yes, I guess a new component, but part of Xe.  I don't exactly know
> > > what you mean with "xe_forcewake", but it's the same as Matt proposed
> > > with the different functions for different domains.  These functions
> > > would do everything that is needed for the specific domain, such as
> > > keeping it awake, checking if the registers are in the right range etc.
> > > 
> > > 
> > > > > 2. Display code uses new APIs (xe_mmio_for_display ops)​
> > > > > 
> > > > > 3. Update uncore to handle "wakelock domain"​
> > > > 
> > > > then on uncore you would need to parse the mmio range and then
> > > > call the get and puts, that in that case would be static inside
> > > > the uncore itself like the forcewakes ?!
> > > 
> > > The callers will use the new Xe APIs, so in i915, the display code (and
> > > probably GT and others too) will be the same as in Xe. 
> > 
> > I confess a got a bit lost now. What's GT need here? Does GT need this
> > new wakelock or is it a display only thing?
> > 
> > if it is a display only thing, we have a new xe_display_wakelock component.
> > The mmio wrappers that translate intel_de mmio calls to xe_mmio would make
> > usage of the xe_display_wakelock functions. And no body else. no need to
> > disrupt the working GT code.
> > 
> > But maybe I'm completely misunderstanding what the wakelock is about.
> 
> Sorry if I was not clear.
> 
> First of all, I don't think the new "wakelock" mechanism is any
> different than the forcewake implementation we need in Xe (which we
> have in uncore for i915).  AFAIU, we don't have this forcewake
> implementation in Xe yet (which was the original discussion in this
> thread), right?

wrong. we have xe_forcewake. But it is up to the caller of the xe_mmio
to decide if it needs to forcewake certain domain or not.

What we don't have is the xe_mmio calling the xe_forcewake based on
some pre defined mmio range, like i915 does.

What is this wakelock about? is it only a new display range of forcewake
with a new display domain? or is it a new sequence of display mmios
that needs to be executed before and after display mmio calls?

or even before and after gt mmio calls besides the forcewake domains?

> 
> So, my proposal is that we should implement the forcewake stuff in Xe
> as Matt proposed, with the different APIs for different components
> (e.g. xe_mmio_for_display()).  When this is done, we can add a new
> "domain" (or maybe even reuse the xe_mmio_for_display() one) for the
> new ranges that need a "wakelock" (which IMHO is the same as the
> existing forcewake mechanisms).  If we do this, the implementation in
> Xe is solved.

I really believe the wakelock should be totally orthogonal to Matt's
proposal on the mmio split for device vs tile vs gt...
To me, mmio_display is mmio_device anyway...

We already have a wrapper for translating intel_de calls to xe_mmio,
why that cannot be used to implement this display wakelock sequences
anyway and regarless?

> 
> But, of course, we need to make sure that the display code will remain
> the same in i915.  To do so, I'm proposing that we make the display
> code use the new xe_forcewake APIs, even though they won't exist in
> i915.  So, for i915, we provide wrappers for these new APIs so we can
> convert the calls into calls to uncore.  So functionally, the display
> code in i915 will remain the same.  We don't need to implement the
> "wakelock" part for i915, but we convert i915 to use the new
> xe_forcewake APIs where it currently uses the uncore's version.

i915-display should only call intel_de functions this should be a wrapper
to i915's intel_uncore or xe's xe_mmio... maybe intel_de itself is the
right place to implement this display wakelock?

But i915 should never call xe functions directly.

> 
> We won't disrupt the existing GT forcewake usage in i915.  That will
> remain the same.  But we will need to implement forcewake in Xe, which
> GT will use.  But the GT from Xe is not shared with i915, so no need to
> create wrappers for that.

The big question that nobody could ever answer yet, is why do we need
the intrinsic forcewake underneath xe_mmio, that is not already covered
by the xe_forcewake call by the xe_mmio callers?

Looking to the '_fw' variantes of the i915, we see that there are many
cases out there that we don't want the intrinsic forcewake and then
we had to create this bypass option, which name is extremely confusing.
Opposite of what it currently does and means.

GT MMIO operations are very limited to small usage during init, reset
and resume. And the underneath range seems like an overkill and historically
brought us many trouble.

Again, I could be easily pursued to the opposite direction of the intrinsic
forcewake, but so far with the current arguments that we have at the table
I prefer to stick with the caller's responsibility on the forcewake.

If this 'wakelock' is something new that is bigger than display and that
maybe justifies the intrinsic forcewake, then we probably need more
information and details on the wakelock.

But if it is a display only thing as it looks like, I don't see why it
couldn't simply live in the inte_de wrapper that calls xe_mmio...

> 
> Makes sense?
> 
> --
> Cheers,
> Luca.
