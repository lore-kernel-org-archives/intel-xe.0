Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1DFC27C53
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 23:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99910E392;
	Wed,  5 Jun 2024 23:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yfft9L7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB8E10E38F
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 23:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717630709; x=1749166709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aF+tseauo4yJrQECPJd/y+EuLGR2pRxbIahot2YKsAY=;
 b=Yfft9L7VBM7qpSVnFUJhoSaxZ9dfDls1rY3NhsY7dSHOufwSYWEviRfZ
 ybAl1+PRarjw96KyzkCJTpQ9J7vkJq5Xzz8MNA2893tEVe3aSnMdvupY3
 fRiFDZPf/mP2k2WkdEpcDS+iqubAqmnZePYjphzXDwxNx2/6rmDp6gGP5
 7HY3pBRiv8v+5zcgZX/Lb8zQKYjCQOKso7yCFiPo+PbNIxsZR3y6BpcY7
 ehLMCsmo+yYDjfNPqDBc8YbC9UCgG4JdQnCZ6NsNFBSp7wN9RwwS+J5Pc
 YvzqoM/IPDsYdEyANXFwfn9L/Ffzp7Ne9iXX46fjvCX9W4t2pqzwbSdg/ A==;
X-CSE-ConnectionGUID: Hm/ZQHAGTeWEqXyyK2MRyg==
X-CSE-MsgGUID: nj4y9k44Rwq8ofx3Iy5auQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14228413"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14228413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 16:38:28 -0700
X-CSE-ConnectionGUID: SiiXPOiPTUqRpB0hXigs6Q==
X-CSE-MsgGUID: W98eaKB+T5OvbxOeaZb4uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="68906870"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 16:38:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 16:38:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 16:38:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 16:38:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 16:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIHACBPDLjjukvcy2J2mw8kUihVfpoevK1SCNLrLlj58zcsmweMcTTq5fcAgjjTAnzOnfgFxLp9qS8PV7hOjScebjcIwxK7xbrgFZVzkZ1tMzjOVw/HKKumEizPrUoVTfPoc8OmwPTJGj4UbN1kXwtJ24wrIO0We4U41UCW8flnKGknPUqdqx1bFgBotmt/nuKylnTr+PHnTYH7RAiAv6jAei/bWUzphu5caQjujPLM284Iing2WZdrW2ojgPbhkhz3GAaERjpA6+2rD3NTCdJfW+BhVyGMnxaTEbqglz09C8P2rfhEoHsQdGstak6bAixhaDKUdvebcBikxTqvb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VR+bXAm6VkSmS1uRZ2mh7LwSleoTlj+zVSnstUOeslA=;
 b=di0tWOic/ByzpeYtxbBsJDfu8Je2ZOU62Vq6LUMPeX9ekFwC7PmnRNZ4Celgek5r9W6+aeiZ+gmVQt54ZsoDDJxXXh6oKxxxVffoNd2OzExDnlV4xTqDEf+HmV1bJ5VMm3taXNErszQ4LlTS9RbPsDEcKkGv6fJTDqdRcMqcpYWKrJiDQ5x25FnLYsLMUarRHhZzwV1xXW550TRFME5erQrS72bv2djLw72RT4zZh28xIefU1WP73Z7UTks1SlpMCYMpN7Whr1vvBO7nVChl4zbf3Ig7wXMHy99oH6yLxE0uhdt1lXvZ5+TCDibjdmgKChq/oAUZit8bXVjYIVcBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Wed, 5 Jun
 2024 23:38:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 23:38:14 +0000
Date: Wed, 5 Jun 2024 23:37:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Message-ID: <ZmD2sk3F3TQXNctr@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
 <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
 <PH7PR11MB7004D00816F98BE869CEE31B92F92@PH7PR11MB7004.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB7004D00816F98BE869CEE31B92F92@PH7PR11MB7004.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: c063d5c0-20a3-4d05-c603-08dc85b8919f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pHPftk96gFtmvoiqQcBV3E4ixAT9ltBWYS81AbmeOofetPL9JrmWuZgo17?=
 =?iso-8859-1?Q?7LV649b3nYdCq4QjCFA6OBcu5BStaxHg3TqhSy8+6R4iZ4lwPfhktmSPsr?=
 =?iso-8859-1?Q?DztqfUJ7f/YwILVOWIp00JKkeISzX49FLwd9Ba7GoYxG/rH87MUMywwe/0?=
 =?iso-8859-1?Q?B4U0yvU2Odveg9XjMdStButqDuPRDOQEGMdFJyFdgFKboB4HXgqoGMrwhZ?=
 =?iso-8859-1?Q?gZvgzFk0FMYZjgqy4/kk/Mk3erOQ/MDAhk6MykFswrMg+VyHKO+qfFbGMN?=
 =?iso-8859-1?Q?aNbbrPjmgg4pG7WjkYVBrOX6sbKfnbyx+hhpirTjSp6UbWPkUCNAdZi7pV?=
 =?iso-8859-1?Q?pSsOxXib1sa9bOBpj0FKYa8GpSythJDuVIuMdzIFLigZlTBgqDIEfbSfv8?=
 =?iso-8859-1?Q?cJXLu2ox0ZtITjFV+1XC+RMCe2OAMNIGDGFzKMWVbBqYm3yJZ9SKi49y46?=
 =?iso-8859-1?Q?kRkTI1/WgHILxW9RWoM4aXdHjMEsSBBgXqbrcy/1s5CHQLxJpDqbfGk97b?=
 =?iso-8859-1?Q?tSylOTpifqVd3NeZL0Gwan3jw+Idtpj3wXCTpa7Nd/psFoD9Yk1HqoJ+UK?=
 =?iso-8859-1?Q?vJvQNq2Q0TTYg1oNfiZG40wuK8OIebFpvMUFeGn+zA41OF7IxHcU8L4IQD?=
 =?iso-8859-1?Q?i2Uym0r0LjRGJXUP8Gw1jw8nH7WhkRczFLqst9SeIMJRwJ1I62+hXEIwMy?=
 =?iso-8859-1?Q?YQ9b3Yyzw7N/rXAXLX3G1u+o86k+Zlnk48VE+7th+Ld5g9D2u/j1KeCrAH?=
 =?iso-8859-1?Q?ISRYJRsMOjdFY/ziySjMc/DxppozYI1dGUiPZ3ZRqMXRW5ErncF1xhLzV/?=
 =?iso-8859-1?Q?Kh2A6B8RO1Y6tJOQBMODVnjssRnKInMKW7RlnzwzoG6xDv8wO1K62DVXi0?=
 =?iso-8859-1?Q?fGSpzKbvVjZBuOv/wM9xSNXUzW1OaZkgvE4/c1c/a4Fo112bMmQmTCyXo0?=
 =?iso-8859-1?Q?QFBKesM+kBiqk8BuAsGJ854OHCNm3sRy0QRYL+reWfa1pzu09khWTyaA/6?=
 =?iso-8859-1?Q?8GHtuIsAdntxsH7hWLbWwTvLiCzzKXFqDJrlxveWjC/6hOlBtbUJhJzoxI?=
 =?iso-8859-1?Q?yVdCsxTsllgOily5QbCnlBYRF/lXmQww4mzuMhPVfVRkp+BItjzUNhWQGQ?=
 =?iso-8859-1?Q?VYza+Km/r2nKilSarMLf5c4dnmAI5ogv/Lo+6uKSnttbCi1uPKF8G99tlf?=
 =?iso-8859-1?Q?tzDZX3z/GFY1tJgJ21H7KHCmlkK/sq1Of1kpTMQAFYnY44m7H7gvG1Z5Io?=
 =?iso-8859-1?Q?JFpwP9WLqUtOiEbhDmR7d8vvOXTz+MJXt6KRUO/vOgUstQcgXbeIruqXxU?=
 =?iso-8859-1?Q?EJZ0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?51ViJVtVbEIF2rFPB/OXEDUINbVdtf41F0qsM2PA3YeijeZc+/nIfejLRG?=
 =?iso-8859-1?Q?AgM7c926H+29QhiL52qSr7akA0WIKZSlctelaajwqCrXDBECTPKve0XuZx?=
 =?iso-8859-1?Q?vq1Jt+XkjLso8apw0DUWjBUOwotOU0QXKX4/5W7pVK+E6nnHP/BSo4hcdT?=
 =?iso-8859-1?Q?5JAN4Q8mbU7kGSPnfkwG5fOCpV3Z9nAt9hXph/fcX1Dj9LVPIPurGyR/oR?=
 =?iso-8859-1?Q?kuMqNqC8bJbY2DH15VkeJ81n2j1NSdZVPfHza5u1dnDDD2bEMa55+qSPnu?=
 =?iso-8859-1?Q?3p0HkMLlDleCUtOFz9NSdsbBK7T+q4jkq33sgcwtJdPGKKS337U/tVgSLK?=
 =?iso-8859-1?Q?HPWE/pT/ktzGS5vjQkb55FCAJyhYxMtDOIw5XVBD/x/nDbRBVuWvnSobXw?=
 =?iso-8859-1?Q?fTdRySHZuZJls89lyGFOVktmV9uB1MUQDKr6BYxwIs3ohPnrtXxXSFOB6S?=
 =?iso-8859-1?Q?djpCp2lze4o6Y8qxLBbDl7cmdZO9YX1yN2HU6Z3Po0GjNNLPqMpJ+cAuLM?=
 =?iso-8859-1?Q?WEoXvrOZNoGUbsJ816ZAs3ZP9+/2nZMJzH42RKFTCREZjFHHYxUxr4iAs+?=
 =?iso-8859-1?Q?asYlgAfowOKJgdNoWNwKsXNWduXzwJET4I20jTuZPvDVK9YoxThYFwDelR?=
 =?iso-8859-1?Q?cU6uMrlO/qG5pp3tKpksW/Kt/UYV2YqkInh6jkDo7NidmWUewsBngJna3i?=
 =?iso-8859-1?Q?Qtt1k5G51DKrGEttWhUYZyM2EE360DIfzfdm4rKwNFaPEJ3uDGszcfcjuu?=
 =?iso-8859-1?Q?zUanBZn6TbDNK/QKb5L1GRuDVt0AeveNMrVItAGVNUv0y5HAU9zkAvpjo2?=
 =?iso-8859-1?Q?EIfXB+dBGILGr84zcBTgQaU1RlrYL38s9KHL1Xz/RfgDpxiSwW6/wy+46v?=
 =?iso-8859-1?Q?iRccVGkm9udllRFhVtE01qbe0Tp/iUxk6FRk0pDgSujXSAzG/ifXISWTIP?=
 =?iso-8859-1?Q?lxJ87MqNqat6Njs1HreZxgTyADqj3Z5YOzVeBWUgacx7OX+O//yb8ThvGY?=
 =?iso-8859-1?Q?CzGHXWuefpjEmkZjFBRStMlQOc61ncjoxz7XVBd35zD2Kz8cOj834I3Nb+?=
 =?iso-8859-1?Q?LJO/+gpRPkOLnyTfzWAnjwt/FPAU0p9Zl8auztabHbRHsV/HAgi/PGuy5d?=
 =?iso-8859-1?Q?QZYifFgIk+850/xqIWMxh3Sm54Kr4HfhEFagqDkva0Xqi8S+p7Pu6do1Ly?=
 =?iso-8859-1?Q?lZXCvp9jwFHJCaLouuQDyDgHrWMRrMd7AthuSy6JBErdV4WXuH6uN4VliY?=
 =?iso-8859-1?Q?tmq0SHaM4YTrkVhw9SV9hkZzCXal2C1KuOAjMMNKq4q5rew1e8lRBdsPWA?=
 =?iso-8859-1?Q?B3UIHmQQTopdP5iMQLIqAgzvtTYVDlUJWX00enN+U9Tm0nmq+JTryboVc9?=
 =?iso-8859-1?Q?VIvkoghjdXlqvm8mU+L8Hbcr8TE8pAeL0kr286QNGvuWT/UTopX5KZJ5GM?=
 =?iso-8859-1?Q?GDvFVLdSc/Fi7BTylwH/xq8Cg/tDAF1psr93eLCHVZ8a+49l93hnaOyNaX?=
 =?iso-8859-1?Q?Bp5KzMectx9ivp0EyEEbi3lx3kMVxVrbbV658Ws1ssshlaRNRBvRCaEH1P?=
 =?iso-8859-1?Q?b9YDqrTFxlU9+LEsBJOEQqKdMuZ9HAm/yBRt3rrsqnVx43EmNeB35/5R00?=
 =?iso-8859-1?Q?r+nXO/xhym0nKPKTe+4asRCwcForBPzd7nYZxDSNOYtl8IgysxtG9ahw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c063d5c0-20a3-4d05-c603-08dc85b8919f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 23:38:14.4564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDyuAdrmQDd6eLJLNwGSBaa/mLMedE9tPjjP9ZCN3Uu+p+W1ntGeqdo6CnKEI3xsiKaZRQ3yUCXOwLR8RXVjfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
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

On Wed, Jun 05, 2024 at 04:16:32PM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 6:24 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > Brian <brian.welty@intel.com>
> > Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and
> > free device memory
> > 
> > On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> > > Function xe_devm_alloc_pages allocate pages from drm buddy and
> > perform
> > > house keeping work for all the pages allocated, such as get a page
> > > refcount, keep a bitmap of all pages to denote whether a page is in
> > > use, put pages to a drm lru list for eviction purpose.
> > >
> > > Function xe_devm_free_blocks return list of memory blocks to drm buddy
> > > allocator.
> > >
> > > Function xe_devm_free_page is a call back function from hmm layer. It
> > > is called whenever a page's refcount reaches to 1. This function clears
> > > the bit of this page in the bitmap. If all the bits in the bitmap is
> > > cleared, it means all the pages have been freed, we return all the pages
> > > in this memory block back to drm buddy.
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
> > >  drivers/gpu/drm/xe/xe_svm_devmem.c | 147
> > ++++++++++++++++++++++++++++-
> > 
> > See comments about file in previous patches, they apply here too.
> > 
> > >  2 files changed, 152 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > > index 624c1581f8ba..92a3ee90d5a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -46,4 +46,11 @@ static inline struct xe_mem_region
> > *xe_page_to_mem_region(struct page *page)
> > >  	return container_of(page->pgmap, struct xe_mem_region,
> > pagemap);
> > >  }
> > >
> > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > +						unsigned long npages,
> > > +						struct list_head *blocks,
> > > +						unsigned long *pfn);
> > > +
> > > +void xe_devm_free_blocks(struct list_head *blocks);
> > > +void xe_devm_page_free(struct page *page);
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > index 31af56e8285a..5ba0cd9a70b0 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > @@ -5,18 +5,161 @@
> > >
> > >  #include <linux/mm_types.h>
> > >  #include <linux/sched/mm.h>
> > > -
> > > +#include <linux/gfp.h>
> > > +#include <linux/migrate.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/dma-fence.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/bitmap.h>
> > > +#include <drm/drm_buddy.h>
> > >  #include "xe_device_types.h"
> > >  #include "xe_svm.h"
> > > +#include "xe_migrate.h"
> > > +#include "xe_ttm_vram_mgr_types.h"
> > > +#include "xe_assert.h"
> > >
> > > +/**
> > > + * struct xe_svm_block_meta - svm uses this data structure to manage
> > each
> > > + * block allocated from drm buddy. This will be set to the
> > drm_buddy_block's
> > > + * private field.
> > > + *
> > > + * @lru: used to link this block to drm's lru lists. This will be replace
> > > + * with struct drm_lru_entity later.
> > > + * @tile: tile from which we allocated this block
> > > + * @bitmap: A bitmap of each page in this block. 1 means this page is used,
> > > + * 0 means this page is idle. When all bits of this block are 0, it is time
> > > + * to return this block to drm buddy subsystem.
> > > + */
> > > +struct xe_svm_block_meta {
> > > +	struct list_head lru;
> > > +	struct xe_tile *tile;
> > > +	unsigned long bitmap[];
> > > +};
> > 
> > This looks not needed to me but admittedly haven't looked at the LRU stuff.
> 
> I am moving to page granularity memory eviction, so we can either use the lru in the struct page itself, or I will have to introduce some other data structure which have a lru.
> 

You almost certainly cannot use struct page, pretty sure that will not
be well recieved putting a subsystem memory management feature into the
core memory management.

I'm going to say this again, I disagree with this design decession as I
do not think using a BO / or migration + eviction at allocation
grainularity should be dismissed. Using a BO offers eviction more or
less for free and possibly dma-buf reuse for multi-GPU. Please study my
PoC [1]. It has SVM full featured and largely working.

If you have a different design, great. But I'd expect the next post to
have feature parity, thorough testing, and well thought out design
choices with explainations of said design choices beyond someone in the
community said something so I am doing it this way (i.e. deep thought
and understanding of how all the pieces fit together and why this design
was chosen).

[1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post/-/tree/post?ref_type=heads

> Yes, I removed block_meta in v3.
>

I don't like speculation, said this many times. Let's see what rev3
looks like and will review then.

> > 
> > I am thinking roughly...
> > 
> > - I think we drop all this special tracking (kill xe_svm_block_meta)
> Agreed.
> 
> > - Have functions to allocate / free the buddy blocks, store buddy blocks in
> > userptr
> 
> Why we need to store buddy blocks in userptr? If you do this, you would need another block_list in userptr.
> 
> I currently use the struct page's zone_device_data to point to buddy_block. It seems work for me.
> 

It doesn't. See my working PoC [1] zdd structure, almost certainly
something like that will be needed for a variety of reasons. Also if you
allocate a buddy block then it really isn't page grainularity nor does
offer an advantage over BO wrt page grainularity. I stated this multiple
time in lengthly explainations and not heard a reasonable argument
against this.

> > - Blocks are allocated before migration to VRAM
> 
> Agreed
> 
> > - Blocks can be freed on either CPU fault after migration or on VMA
> >   destroy (probably depends on madvive hints for VMA where we free
> >   blocks)
> 
> My current understanding is, once device pages is allocated and handed over to core mm/hmm, driver doesn't need to worry about the life cycle of device pages, i.e., core mm/hmm will take care by calling back to page_free vfunc.
>

Yes, we definitely need to the page_free vfunc callback implemented.
This was a misunderstanding on my part, certainly you can make it work
without this but it is not correct.
 
> > - Blocks allocated / freed at ia chunk (xe_vma in this code) granularity
> >   (conceptually the same if we switch to 1 to N ratio between xe_vma &
> >   pt_state)
> 
> As said, I am moving to page granularity, moving away from xe_vma granularity, to address concerns from the drm community discussion.
>

That's not what the community is saying or it is not at least how I
interrupt this. The community is saying on a fault, allocate at a page
granularity of the CPU mapping. e.g. If the CPU mapping is 4k, allocate
4k. If the CPU mapping is 2M, allocate 2M. There quite a bit of core MM
work that would need to be done for this to properly work though, namly
the migration layer splits TPH into smaller pages. I think that should
fixed (e.g. teach core MM to understand device private pages that are
larger than 4k, likewise coherent pages). Conceptually I think this is
the right approach but would take quite a bit of work. But with that, if
we layer the code properly only the DRM layer needs to be aware of this.
e.g. We could build SVM without this like I do in my PoC and then switch
over to this model once we complete the core MM work is done mostly only
modifying the DRM layer. This would eliminate the partial unmapping /
invalidation scenarios which my PoC implenents and provides
documentation for.

Below general comment:
If we post something that we view as good and working, community
feedback can be pushed back on with a justifiable design. Blindly doing
things without understanding (e.g. community said do it this way) of the
larger issues is not a great way to work. Nor is posting untested code
with a partial implementation.
 
> > - block->private == memory region so we can get pfn from block
> 
> In v3 code, block->private is not used. Will use it if needed.
> 
> Each struct page has a pgmap pointer which points to xe_mem_region's pgmap memory. We can use this information to get a page/fpn's memory region.
> 

That probably works but there may be scenario where you need to from
block to mr in which the device pages are not readily available. You
always can go from block -> pages -> mr but it may be advantageous to
short circuit that with block -> mr, especially in hot (performance
critial) paths.

Matt

> > - When we need migrate_pfns we loop over buddy blocks populating
> > migrate.dst
> > 
> > Also I noticed the drm_buddy_* calls in this file are not protected by a
> > lock, we will need that. Currently it is tile->mem.vram_mgr->lock in the
> > VRAM mgr code, we either need to reach into there or move this lock to
> > common place so the VRAM manager and block allocations for SVM don't
> > race with each other.
> 
> Ok, will add this lock. Lets keep the lock in vram_mgr->lock for now for simplicity
> 
> Oak
> 
> 
> > 
> > Matt
> > 
> > >
> > >  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > >  {
> > >  	return 0;
> > >  }
> > >
> > > -static void xe_devm_page_free(struct page *page)
> > > +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> > > +{
> > > +	/** DRM buddy's block offset is 0-based*/
> > > +	offset += mr->hpa_base;
> > > +
> > > +	return PHYS_PFN(offset);
> > > +}
> > > +
> > > +/** FIXME: we locked page by calling zone_device_page_init
> > > + *  in xe_devm_alloc_pages. Should we unlock pages here?
> > > + */
> > > +static void free_block(struct drm_buddy_block *block)
> > > +{
> > > +	struct xe_svm_block_meta *meta =
> > > +		(struct xe_svm_block_meta *)block->private;
> > > +	struct xe_tile *tile  = meta->tile;
> > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > +
> > > +	kfree(block->private);
> > > +	drm_buddy_free_block(mm, block);
> > > +}
> > > +
> > > +void xe_devm_page_free(struct page *page)
> > > +{
> > > +	struct drm_buddy_block *block =
> > > +					(struct drm_buddy_block *)page-
> > >zone_device_data;
> > > +	struct xe_svm_block_meta *meta =
> > > +					(struct xe_svm_block_meta *)block-
> > >private;
> > > +	struct xe_tile *tile  = meta->tile;
> > > +	struct xe_mem_region *mr = &tile->mem.vram;
> > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > +	u64 size = drm_buddy_block_size(mm, block);
> > > +	u64 pages_per_block = size >> PAGE_SHIFT;
> > > +	u64 block_pfn_first =
> > > +					block_offset_to_pfn(mr,
> > drm_buddy_block_offset(block));
> > > +	u64 page_pfn = page_to_pfn(page);
> > > +	u64 i = page_pfn - block_pfn_first;
> > > +
> > > +	xe_assert(tile->xe, i < pages_per_block);
> > > +	clear_bit(i, meta->bitmap);
> > > +	if (bitmap_empty(meta->bitmap, pages_per_block))
> > > +		free_block(block);
> > > +}
> > > +
> > > +/**
> > > + * xe_devm_alloc_pages() - allocate device pages from buddy allocator
> > > + *
> > > + * @xe_tile: which tile to allocate device memory from
> > > + * @npages: how many pages to allocate
> > > + * @blocks: used to return the allocated blocks
> > > + * @pfn: used to return the pfn of all allocated pages. Must be big enough
> > > + * to hold at @npages entries.
> > > + *
> > > + * This function allocate blocks of memory from drm buddy allocator, and
> > > + * performs initialization work: set struct page::zone_device_data to point
> > > + * to the memory block; set/initialize drm_buddy_block::private field;
> > > + * lock_page for each page allocated; add memory block to lru managers
> > lru
> > > + * list - this is TBD.
> > > + *
> > > + * return: 0 on success
> > > + * error code otherwise
> > > + */
> > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > +						unsigned long npages,
> > > +						struct list_head *blocks,
> > > +						unsigned long *pfn)
> > > +{
> > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > +	struct drm_buddy_block *block, *tmp;
> > > +	u64 size = npages << PAGE_SHIFT;
> > > +	int ret = 0, i, j = 0;
> > > +
> > > +	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> > > +						blocks,
> > DRM_BUDDY_TOPDOWN_ALLOCATION);
> > > +
> > > +	if (unlikely(ret))
> > > +		return ret;
> > > +
> > > +	list_for_each_entry_safe(block, tmp, blocks, link) {
> > > +		struct xe_mem_region *mr = &tile->mem.vram;
> > > +		u64 block_pfn_first, pages_per_block;
> > > +		struct xe_svm_block_meta *meta;
> > > +		u32 meta_size;
> > > +
> > > +		size = drm_buddy_block_size(mm, block);
> > > +		pages_per_block = size >> PAGE_SHIFT;
> > > +		meta_size = BITS_TO_BYTES(pages_per_block) +
> > > +					sizeof(struct xe_svm_block_meta);
> > > +		meta = kzalloc(meta_size, GFP_KERNEL);
> > > +		bitmap_fill(meta->bitmap, pages_per_block);
> > > +		meta->tile = tile;
> > > +		block->private = meta;
> > > +		block_pfn_first =
> > > +					block_offset_to_pfn(mr,
> > drm_buddy_block_offset(block));
> > > +		for(i = 0; i < pages_per_block; i++) {
> > > +			struct page *page;
> > > +
> > > +			pfn[j++] = block_pfn_first + i;
> > > +			page = pfn_to_page(block_pfn_first + i);
> > > +			/**Lock page per hmm requirement, see hmm.rst.*/
> > > +			zone_device_page_init(page);
> > > +			page->zone_device_data = block;
> > > +		}
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xe_devm_free_blocks() - free all memory blocks
> > > + *
> > > + * @blocks: memory blocks list head
> > > + */
> > > +void xe_devm_free_blocks(struct list_head *blocks)
> > >  {
> > > +	struct drm_buddy_block *block, *tmp;
> > > +
> > > +	list_for_each_entry_safe(block, tmp, blocks, link)
> > > +		free_block(block);
> > >  }
> > >
> > >  static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> > > --
> > > 2.26.3
> > >
