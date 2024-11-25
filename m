Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49330D5808D
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 12:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1671410E2CA;
	Mon, 25 Nov 2024 12:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTDUCtnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D36410E2CA
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732536720; x=1764072720;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BhpGgkE3/gbZK25eHdeQpIGumUNHkRSwTxjKTM8uv10=;
 b=jTDUCtnBshWGJ9bv5sJMjPki7iVTnqONxc7CzXqnHiuDxuVKRDOuUaqY
 ogpT4oDOr0nWEGODfz4QK8FpRYywGVZIiQeq2zMdm1S0ld8WIsSuMvT+w
 5omz/9Bx9z16L0lRCU3OrgFYoNP/+ihBEuHvq2EkCOFnfUKTsDunt5g7O
 2LKQluSLMpHMNE0cuStf8TNMdBTaL0nWwaTYjpKeAcdyYqwNItj6gHt83
 gItpI5T+vPsaVWtDI5jQ+WUYCHKPJqO6UcUwGLHRwO9K349DKI1i0CecO
 OxrhrtDnpe/q11Ky7hmKQiTiETF26S6bNM/NOj+Nb4t97ZvGUsCOZ7AhX g==;
X-CSE-ConnectionGUID: eBcB9y2pQ0yKm/qBnFojRQ==
X-CSE-MsgGUID: 94wBsUejRgWL8ll3YaZVDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32498120"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="32498120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 04:11:55 -0800
X-CSE-ConnectionGUID: YAHfIZmVSiq4BQ1sIMCdkw==
X-CSE-MsgGUID: lWHr5WrqQ8aer+KWS9yr+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91046763"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 04:11:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 04:11:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 04:11:53 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 04:11:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbIZ4RUmAbueFLt1zh70fJrYkVp6SdPKglCJnu6Riq6Eba34spv6zINoWZR+Psy+1gN1EqKriQM2nRIgSqSBjmqpBmlsUFG2IpYFx6B3PazuL7TBj4OP8oBQi7OgtH1ggTjgA9cCvAZuS2CIATGUyZlcnkI/8U4LGj0F0IwLPAIc8Kt2XBcW9NrRgDezt90Uh9UcbohjsgmVG+vOxWPoE387yGGpIF2BTEt6anQhtCMPhiUp0HXQ4rg1GDlOHl4vdNkecgWNMFrNtkBaq14il00R3Gherf/vfWd6ESerIKjjY7jdEx2Oe6xmecAmQ7Cc1yEKvmXVRUOKB1NlF0uUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syjLjXoXwzRYIFXVixhTiovk/OwHN6ujzypWOCit2lE=;
 b=tpopuAoSEhzst8qNPgaSRkkkhnm277Wcemr1t9oA10xOkksOlAcrRALrQuBZbxIFJnWczL3v7nM7arMRVCgiPJei41UrWJT4xyFE0OoEl6E1rqcas6+cZ27PhEY8YzYr/Qy2D/AeZZeXAv8zHEr2INMl6bo+QUcBNDs1ATkEKNiGNT9ohrCC9QgqDzaj6oVnSjYX2CJMa5470eRNXrlX6EKF4/9tqDWD36gNKQihDWlEA57Hqm33qmoSxvVx+mYiargjWbKQY7GDBhicQR8XptZLyIdPS+O36B3AY3PJJRuF2va+0TKAOdcC1o4Zw9ILU8QRO+r1QWFmQjmn/k5Iiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 12:11:49 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Mon, 25 Nov 2024
 12:11:48 +0000
Date: Mon, 25 Nov 2024 07:11:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>, "Himal Prasad
 Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Introduce force-wake guard class
Message-ID: <Z0RpewnaZocMaBoX@intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-2-michal.wajdeczko@intel.com>
 <ZzzdQGnrSSD7jKs_@intel.com> <ZzzlLQAh9yqAl3q8@black.fi.intel.com>
 <4mulnkmh6np2ney767qf5hvcj4tfse6t2bavudulnz77jjyagg@r4xtypqhsnkq>
 <855208c6-cd7c-4e63-a865-8d970bda11df@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <855208c6-cd7c-4e63-a865-8d970bda11df@intel.com>
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB4834:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b94239-b7b7-4a95-a980-08dd0d4a563d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EvmcE8qrZqJO7re1xPlzTPukymyYgd2IZ+H3hw/UaDShiHot+UQdsq9Rpt?=
 =?iso-8859-1?Q?xHS9dXmMVCsR4W/3H7fevA5yH0+PPT8ifwiT82Dvox5CJGN+uxz7GKNpAe?=
 =?iso-8859-1?Q?rYKdCpFGbhjdvfhnACzIk3ePuiuQe9zShReHvUqkvlwx2gsmHpjYT/9gWT?=
 =?iso-8859-1?Q?DG0K2vam17j04aFPMcoxSfR4A7BqFwzoKMcHWAyiPOiAzA/mA6O2I6nPmw?=
 =?iso-8859-1?Q?ok+KAIY6XzSGRCsuGSz4HCs+328BRSu+shbrhuFRg1dz8cqjzvh5hPB/KD?=
 =?iso-8859-1?Q?UwllInfB637pNMKvw8D/3b0IkR/RYnPtjZEbu6kDfBOHjz0YGY0gT0IGIB?=
 =?iso-8859-1?Q?n1xfLFyUtMmAWXJhw0W3r94DyNqNHS8P8oKP24YN0kY+91Fe1wkn6YcNsw?=
 =?iso-8859-1?Q?Dmf2KlOUbUMmOkRsm/SRVxImjGb/PjNU16gGPr2KrKtP6uWPd4Mq8vCV4Y?=
 =?iso-8859-1?Q?ZrHLJu8aYUYgFyjCDgjq8YrvhwN1SiiIRQpph7jcneuD64eJpEifSM/3Zg?=
 =?iso-8859-1?Q?M3aETxsgPMT2PMmFXL+3FIqFyoYmKcpIU5ro4DlGvKeFSJ0lfulS2fr5SR?=
 =?iso-8859-1?Q?dY/bB0Kmx571azy8bmWz32Y2Xju5q2/auELUDvcd2DBATM6UEMX5ShU4U8?=
 =?iso-8859-1?Q?oqL0/+hMNloeWHor7YyO+IOIQr9RbyFr5GfNNPrMk1r/3srfGvXPWuLFqT?=
 =?iso-8859-1?Q?w4eFKlGyk9oF9ePVZxfUWLaQHvmVg1ySk07yKpC+oHfG0qTlEEk2BSxv6d?=
 =?iso-8859-1?Q?2lSCoeoYzOCiqsvAG0X2aE58/R/VBtGI2R/HRd7qhJ3+qxkr4GGFmZBbK5?=
 =?iso-8859-1?Q?7E2QDon0OkGyAjGGJnQp9qvLCpa5GSvHZ5p1Fwco3PkLlabmzJaArw9glH?=
 =?iso-8859-1?Q?n8ljRG1yAYg9IO3rWhI9yWlEd7DK+HeEkj/HWDMLwq174OsBsGWRamQVG8?=
 =?iso-8859-1?Q?dDDGSME4Kz/7tsfVAIvGVaZIvP89xY9xzBTOy8TP19WzffMLJcBXc/Bpzc?=
 =?iso-8859-1?Q?vAcH79KIfLvtX9unb1cX59JvdPYWWriYVkRtgj5r4V1jckkvP7E2xj8U/a?=
 =?iso-8859-1?Q?FWkFcfOlqSg9fa/nKnOSvm0nDPPlojqtrrrAvNreu8h9sbd32V+sTKZaLo?=
 =?iso-8859-1?Q?fQFIsSXjtnkAEmF6v4iHy6/5Aqlg7wIJaP5YOf/J9TDKbhp4TrIh99Nslw?=
 =?iso-8859-1?Q?TnNA6oh4c38RBCfC3UbcHtf8dNeRY/WdmDxWCKnkAImu4f7KfF80wmp3wo?=
 =?iso-8859-1?Q?lWxLjBGhmtN7wMgLJL2iwzv5JfnbmTbkuXqZuiC/SoC6EE0rMP64boG/qE?=
 =?iso-8859-1?Q?KCz7I+AuVI03q1ZyRI+8G4DWaqVRh0VpjVPI3s3xpciOG7ss9iZgZMfAvL?=
 =?iso-8859-1?Q?q4a0M1YQPXsCKcz9x/eCPXsRwXGnPT1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VMrQ+yK6Zx8jIal54aBCkU6P2xm64SxWKkUfvGl4Xr8PbGlg7v+rRqmzpC?=
 =?iso-8859-1?Q?STCTfrQUj/J1wMTAlHqfReiD6PawwJ4HcKGB/EtLUjE2kGx9JjH5uOx+Cc?=
 =?iso-8859-1?Q?7SKHyVVqdmP4vS2L6eDH5XTSmhklPhY4xh09Q+D43lj2Vn/gPOj45mfKqA?=
 =?iso-8859-1?Q?MZD9G68DgWic/kPJfCCP/SI62q/ucJQNcDpEtDqalVSStilbHDTjNgtBm9?=
 =?iso-8859-1?Q?XiK/A8moGxZFqxsfydMIzbyKcHF2D1YFcUZiHIK0pcx2bqv248JbQEtZBk?=
 =?iso-8859-1?Q?kDjwH6oNSukloiF9a+uUqm7zQ/RkWUCPjI5MExObtCOrFD7zcvOYzQgJDK?=
 =?iso-8859-1?Q?yLTAjhz4lQFt0CNLWy1VkI5dNzojzsD+/Cxy+J2gb8SDXkP7KEkpZkt9QX?=
 =?iso-8859-1?Q?DLXDGCuKMMATs3QHHV/t35reOU+wvmJZoPZpYpW98EqJxeFRJU/i1zeKCZ?=
 =?iso-8859-1?Q?+OK1oqfR8rfhH8sIlI8RxgDncRrsWYF3WqfCICu9lY/pzBDyehAy4RbziW?=
 =?iso-8859-1?Q?6S5FHmNM2KwPnQC1uM4opFOgbHn5Klrnaz2cKbggL1uUTPeNQWgVReBsel?=
 =?iso-8859-1?Q?yKSy07EhqtN5WyeRnneK8TyTeAhUu5ALPk/FCmB5PCc15qzVvaktFLgiJW?=
 =?iso-8859-1?Q?iuR0FwVXsJt0YNQb4PqXfTLEOfpn8HDZnzrDWJbjfh6V7s62/AtGgc12Td?=
 =?iso-8859-1?Q?Ev65F2ppHG+k3FQIxKVvhXXkDpzEqbMbPjrF/stum/We4XmBlrizShf1Kj?=
 =?iso-8859-1?Q?/3OrIZVecS+PMD0mjI1xpzhd3j5Suuj2HO+6Hn0dqybdIDJy8PmjJLiGjG?=
 =?iso-8859-1?Q?FNg67gRvLuOgcDhhrWuSlrV4nIx7TGk/TCLClO2+KFWVYnsXVk9GOsK1rI?=
 =?iso-8859-1?Q?WxIx6HNOXZ2Lr1bOnQwi0imFvzUf5A1NFmF/jg8etUzzKmcBK2vSio2IsO?=
 =?iso-8859-1?Q?ISvd+rlkiYrk2koXuCpLuuvUK92yyq2xnmX2zbBX/cp0uL7XHfOlXsMWwb?=
 =?iso-8859-1?Q?I55AjH95kBGPNKR9k80CulgEjoL0BuNWYZ3chAmDs9kvjP0Xvvv9COSw76?=
 =?iso-8859-1?Q?diFy9ZLpKAeeNlQIOU2eFKap3WSs9uFAohlDEDA3yK5z+QsJGeM0eFhUpP?=
 =?iso-8859-1?Q?Ak6sqV0SkTLj8kmFijFvAjPqKRShu4SOAGn6EoecE7fbzaLjPXPd1faagP?=
 =?iso-8859-1?Q?z22o1iJMiR0r2irktPvckoCi7V4Et683Apdz0QifoNEqYiEoOdAW31r3SH?=
 =?iso-8859-1?Q?ZE4GW7fZhVRvr893WcH7rYauUQ631jTwXVzOxlE0MySN28kiH8+rOLYgrG?=
 =?iso-8859-1?Q?QYHkM2SEespwXEANLl+3MSoEibRDssZY2VKjfRfpAnfKMgI3I76lLKoznT?=
 =?iso-8859-1?Q?m2qorOkABnUe5J5LEyxCyQQ2k9BC5sga5t9u1F8CDKhftGpU2pBIRYNL9n?=
 =?iso-8859-1?Q?Z6VjCre2ExHUv/RIwXU9XTyNsNewpDYsNF48sMmCApdJ7ZTnVKdYCyHtnL?=
 =?iso-8859-1?Q?fKl0KKDfpeAaT0Hx6+yXQIm9luMRnWrwrUbkmvwxAW9ae384qoDhW18fdq?=
 =?iso-8859-1?Q?ittidHWRbdO5v/67pCUtNLUmp2Wk6h0YJHndak9tyKse2aAe5D9FU3TIE2?=
 =?iso-8859-1?Q?2rDGP/Z2HP653t4pV+7GDNRN8fOZZygLXRZZEh1i8kUALqg9Hb2NguTg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b94239-b7b7-4a95-a980-08dd0d4a563d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 12:11:48.7882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yNf7AzGhBQ4nbYs9C/BG2qqulebhQEFvoJunituSyNN6jGAVMIHArGnPirheee1W/pLai02Lguo2mney2wcpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
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

On Tue, Nov 19, 2024 at 09:26:42PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 19.11.2024 20:59, Lucas De Marchi wrote:
> > On Tue, Nov 19, 2024 at 09:21:17PM +0200, Raag Jadav wrote:
> >> On Tue, Nov 19, 2024 at 01:47:28PM -0500, Rodrigo Vivi wrote:
> >>> On Mon, Nov 18, 2024 at 07:45:10PM +0100, Michal Wajdeczko wrote:
> >>> > There is support for 'classes' with constructor and destructor
> >>> > semantics that can be used for any scope-based resource management,
> >>> > like our domain force-wake management.
> >>>
> >>> There is, okay...
> >>> It can be, okay...
> >>>
> >>> But why do we want?
> >>> What are the advantages?
> >>
> >> Makes error cases easier to handle + less code.
> 
> and this 'easier' is not just that as it also means that code is much
> more robust as it's the compiler job to take care of all the cleanup,
> which could be tricky when doing early exits from different paths, or
> due to late updates to the code done by someone else
> 
> >> We significantly cleaned up intel pinctrl and gpio drivers a few
> >> months ago
> >> and almost halved the footprint in some cases.
> > 
> > I'm ok with using this pattern as I already expressed before.
> > Particularly seeing other subsystems adopting it and being used well in
> > the core kernel as well.
> > 
> > Main ask here is to provide proper justification in the commit message.
> 
> there was a little more in the cover letter:
> 
> ""
> This should allow us to use:
> 
> 	CLASS(xe_fw, var)(fw, XE_FORCEWAKE_ALL);
> or
> 	guard(xe_fw)(fw, XE_FW_GT);
> or
> 	scoped_guard(xe_fw, fw, XE_FW_GT)
> 		foo();
> 
> without any concern of leaking the force-wake references.
> ""
> 
> do you want/need more?

this block here also just say 'allow to use' but fail to describe
why we should use. But the upper block started by Raav seems a good
why. Just make sure that that is in the commit message and

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> > Lucas De Marchi
> > 
> >>
> >> Raag
> >>
> >>> >
> >>> > Define xe_fw class that can be used for force-wake management.
> >>> >
> >>> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >>> > ---
> >>> > v2: aligned to new force-wake usage model (Michal)
> >>> > ---
> >>> >  drivers/gpu/drm/xe/xe_force_wake.h       | 12 ++++++++++++
> >>> >  drivers/gpu/drm/xe/xe_force_wake_types.h | 10 ++++++++++
> >>> >  2 files changed, 22 insertions(+)
> >>> >
> >>> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/
> >>> xe/xe_force_wake.h
> >>> > index 0e3e84bfa51c..e46e44f7eb70 100644
> >>> > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> >>> > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> >>> > @@ -6,6 +6,8 @@
> >>> >  #ifndef _XE_FORCE_WAKE_H_
> >>> >  #define _XE_FORCE_WAKE_H_
> >>> >
> >>> > +#include <linux/cleanup.h>
> >>> > +
> >>> >  #include "xe_assert.h"
> >>> >  #include "xe_force_wake_types.h"
> >>> >
> >>> > @@ -61,4 +63,14 @@ xe_force_wake_ref_has_domain(unsigned int
> >>> fw_ref, enum xe_force_wake_domains dom
> >>> >      return fw_ref & domain;
> >>> >  }
> >>> >
> >>> > +DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
> >>> > +         xe_force_wake_put(_T.fw, _T.ref),
> >>> > +         ({ (struct xe_force_wake_guard){ fw,
> >>> xe_force_wake_get(fw, domains) }; }),
> >>> > +         struct xe_force_wake *fw, enum xe_force_wake_domains
> >>> domains);
> >>> > +
> >>> > +static inline void *class_xe_fw_lock_ptr(class_xe_fw_t *_T)
> >>> > +{
> >>> > +    return _T->ref ? _T : NULL;
> >>> > +}
> >>> > +
> >>> >  #endif
> >>> > diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/
> >>> gpu/drm/xe/xe_force_wake_types.h
> >>> > index 899fbbcb3ea9..15456a24f707 100644
> >>> > --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> >>> > +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> >>> > @@ -85,4 +85,14 @@ struct xe_force_wake {
> >>> >      struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
> >>> >  };
> >>> >
> >>> > +/**
> >>> > + * struct xe_force_wake_guard - Xe force wake guard
> >>> > + */
> >>> > +struct xe_force_wake_guard {
> >>> > +    /** @fw: force wake manager */
> >>> > +    struct xe_force_wake *fw;
> >>> > +    /** @ref: opaque reference to woken domains */
> >>> > +    unsigned int ref;
> >>> > +};
> >>> > +
> >>> >  #endif
> >>> > --
> >>> > 2.43.0
> >>> >
> 
