Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F94CAC596
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 18:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C11F10E082;
	Tue, 17 Sep 2024 18:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbY9B43e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B3210E082
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726598985; x=1758134985;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uCuQCuyTK6rkRi1rblCcKcdB3q1fN+OSJDBxgabsirE=;
 b=KbY9B43ePhbtCFrryS0kkadCK3T/Pw3wo0YFCO1IC2CZz90PRBirfZBK
 OZ9pwkkcV/N/6iEH54slKqrETajbouoL3poMc46/NNZpZG7d9Q8uOiXTg
 zhAAspEpgzu7OapN3QLGt1t5J5tBBMbzHjSWR0yx7WaA/ncyUx43Gs7fr
 oV8wI/LtqF6K291dLn/mfGwPj+iQIv5ccblqvD+vfOKzfvrYBenipuQyS
 BbbavuGMLbgHeI9LDT1qmwI+sUEvPE8jOFsMTzyzZ6eJb9mkRmiTn1zmx
 10a/WnlgS62ot/EM3nHQJ/XrZOr5EAH637FiuTjusTflI6cOtS11Mzrqm w==;
X-CSE-ConnectionGUID: DGt+jlNwT3W1v3koQUJMsg==
X-CSE-MsgGUID: 0gSM5+45TGOtaTcZSV7fjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25635986"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25635986"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 11:49:45 -0700
X-CSE-ConnectionGUID: etjBFdbFRPubi+wu2iWtXQ==
X-CSE-MsgGUID: 0uG8plNUS/eSItTctUW5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68906333"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 11:49:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 11:49:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 11:49:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 11:49:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 11:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7J+wkY5l0pT2pbv2gMVlr6VOO9LrTeITsq8O/SabGVgBiPMshjBOUlhosroHsz/vw3q4fE4s1YucCeEIvqzpZPG+ucbWN+rlGNFqp0mdGDgy+FzrOUaF0ZTCc82GF7gRmvort/FkeXx/c4wi5owVZhlMVPPU0oWm7e34heHp2jbiimWSNhCuhoDDEHF5m6kXjY4Kh9jj7gdljkk0+LTP8lmnvW5AirvOciKKc0z7JvLWwSPZkxsaD83AeqPiy6WZSk6WkTuDlleh0p+zD78+5fKWP1Xd+fuaibDPlMSLyrOtcJgZ17ltVFuFdwarLQR6WystYTciUr16vLiytDD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qscUqgXO6Fuqex/QT+JRTPfLLOc2QTxRx2vtDfaUqPA=;
 b=XO0S6FFPimwYHyZNFzW9hfu7mKvrEWdLuO3EnvDjGZLAShcizViVDnw7i4WmTLVkujuWnryTBRcvbxLs24SzWR3UbFYBv/77xmYtELIuSRYxtDWptUQswQzDi4NhgD5JqzKplpeCTkMEL8x/3bfnI3fitryADTuiHrb9ImqzwmcngOqpwY26KrZEerqK4jczD+rzGT/ex/McLvY0oZb4lPZxVOVjQXoCxr17WhkJGOKa3i+XvzDzkPO8voB91VHjcHfbj6xgHU2OW+wfFjPN8BPUkhBOZrR8e6wZJXBW/GnwTSFL+/L9pbm42VlYxVdIwoAgAraPryNiOtJqyMB9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 18:49:41 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 18:49:41 +0000
Date: Tue, 17 Sep 2024 14:49:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
CC: <rafael@kernel.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Restore pci state upon resume
Message-ID: <ZunPQeJb2zoVbNSN@intel.com>
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
 <ZuQbnRfh-wkuMR83@intel.com> <ZuRduLqXs4za8_PN@intel.com>
 <ZuRuSgnnjGSr8xI_@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuRuSgnnjGSr8xI_@intel.com>
X-ClientProxiedBy: MW4PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:303:6b::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0324a3-0d0f-49a2-add6-08dcd7497c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5mbsTJuK0FwSYd9OeBHJm9kN97i9/sffkCdIwhTJEYzVHGMBlr271vMxM8?=
 =?iso-8859-1?Q?Ul3myotqHGiqRO80sFANcSjZQofwyKR9NpWbuTdbXkgtiTJUgVwEdh67GR?=
 =?iso-8859-1?Q?5XBXZeeU22jR7TkdFFFAIVNY6Kt6GPiBOa2dcMm2a3za4ynQA+Ez+fTBT9?=
 =?iso-8859-1?Q?kRB6dcISDcBPrvnkMwa7vwuBuxVlsk+Gwi3Mv3so3pgHEyUdkrmAIRy20S?=
 =?iso-8859-1?Q?dAsMjrMIxXuDWPsNOVJ3RButk5ZqvaTgflgHF3pyGsuqP/1hKlYqoEIBvG?=
 =?iso-8859-1?Q?jMf1lngTesNr6DYI7PE2CNnGi+ayDnOTLKZGBWAjRp4xtRQCdX2DB2b0iF?=
 =?iso-8859-1?Q?MNAwuZ44ui2f1mhq/uqSWIGVqbWKBdBWy+NUX+83TdG8hHZL9LhC2TmJU6?=
 =?iso-8859-1?Q?xdLANgJKaiJAZqngSU9gucxZqNm5m6pe4/DKgcX+3bNek0N4bxGqu7iyaV?=
 =?iso-8859-1?Q?ic3Z1+5oiN8l84j/vt0nc3C9xG8Jn+udGlYe6oNAWWjArw9Gcw94L7PAKK?=
 =?iso-8859-1?Q?8Tlz6sy6QVRVWZP/j9V618ckofmNXZPCjFiW6t5V0/W9K5fVBJThSrlltA?=
 =?iso-8859-1?Q?WGIl68MUQHxuxL1kC3cTje7JitFjL5Uc0jDdPQe9qMkrK+DAwLzWqOAOcN?=
 =?iso-8859-1?Q?gVfIazn41KcFofyoIiXOlLh+SgLSFr2kGowNf/RaX3lDvNIPYXdTxXV8Lk?=
 =?iso-8859-1?Q?tKsjmfHXQWQd4Ui6cFpHYKy0T+6j+kYKPwpSZRHSkoHxXmnevtbxy7j5t4?=
 =?iso-8859-1?Q?CoUhuARm8I9JnyCoyinpAvOZ4MtRdyo2lxywovHyLKargjFeUj4j482jj+?=
 =?iso-8859-1?Q?alTFPOTbtYO59J6vCTh4/W2v7ZUWYp9ff4Z5K3vBZxiwY7aGNb/FC8bz1X?=
 =?iso-8859-1?Q?LO7Psd4YCxtl94vNtddxOR3pg2DU/UIWBZp95p0j5VPKO3wG6Jqr+eQTF6?=
 =?iso-8859-1?Q?WqRhBpbz8ZX1qUIJwlp5mGSuohogh21057a/ozmkwFN7mUC4OfFQxfSB/H?=
 =?iso-8859-1?Q?5qOZKncUNL6b3gjz6jP5wKvWKN6qEeiBXIYKPUWHEj+vH8QKTm9R+aGd5b?=
 =?iso-8859-1?Q?eIykEju6zFtEG1KElvxEkoGGJqbGrRCj5JCU3et/fIAMXe3JG2gGYtahr0?=
 =?iso-8859-1?Q?ds0hgLEU92R5kF1+P3I6Hs8Abu2HIa2PbMjXBOt9SBGRnDkOsXn/sz+PsE?=
 =?iso-8859-1?Q?hrjGb0LbnLdCnuzcAKqefrpwrY1dXTeoDeBWAgWaVDRSBlO+9m/LeUbLSQ?=
 =?iso-8859-1?Q?0rsU3Ehdn85k+2Jmhp3Dr+9K/0KomglmLeuYhzWVz6KTK8u+31/OumR2TR?=
 =?iso-8859-1?Q?IXV0bWe36qDUtC2CWeOvreSEqchVPwDR1osN9ZB8nTT5if75/4mWxmHMIt?=
 =?iso-8859-1?Q?olaO8WBnJEpw+OMR5hurJY2EqQykcM7Jpf1+N8Jb9R71BzLEJuRyc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XmPGh8Vjlwbbozask3rdMdky/6kvw2sMuH0o8lomNKikMo5cPQ5ty78Eac?=
 =?iso-8859-1?Q?hvLRwJ/gO8sh8JgKvozOJO3e3WeqB57o8it2da4Ix5OlE45vNBogQPl4cT?=
 =?iso-8859-1?Q?orXyBUPT5EgroVdSUuCgdj4N43f4iVmCLok+vilr2QLNf7tlqVD27et0DQ?=
 =?iso-8859-1?Q?a96sAd0PnVFRjJ8p0Z5yVIya4RPThFgv3TPtjoBmLofQJI/giS9xzp/4zh?=
 =?iso-8859-1?Q?1zW/0Ugv7tqVgqb+WlTHTifsuKV9T4v18Uzkw783ObYcTDimzwEgRIfR8g?=
 =?iso-8859-1?Q?Qzok14ZhvZ0f0t+8mG4RhwqnXiuW4k05Xc+AlPP5PuZzcIYCAC5pvMspB2?=
 =?iso-8859-1?Q?ObxU8HkCkX3YIkWiCAcK9EaciQdhGbc5vnQcJCpaR/pMtnjb8xDWXxohw+?=
 =?iso-8859-1?Q?09qWJeqS56XhpkHPPejp/yFG5vG90V82veYloA/r0eRoqEgvFo9aPcGmPw?=
 =?iso-8859-1?Q?lEWdtW6NrWGRnHcSCk8Bh+evKAum6/jZVSJ4tHNWGWD8Ho1Cp3sMAsGPKb?=
 =?iso-8859-1?Q?EfSPcw1wZiJdKxRLug2yeGorgJYmOxb5dZG+r+zD9EywNVI6gyujL3na03?=
 =?iso-8859-1?Q?6Gr7z/AiExjhoW+svfog/GqEiB/LI0+dd7AFPq6Im/x+d9rEVU2ST2yO/X?=
 =?iso-8859-1?Q?i+l7Xz3ezuNTle4YoAzsslrgLAxoSB5SWgFVNGZLmQ1Is00vULGUUid8Qm?=
 =?iso-8859-1?Q?yPB7Mt8QjaQuf6sTwdJO2dBoR8VKKLjDtWvrS4MKyhqSiKMHZSFkllDJ6M?=
 =?iso-8859-1?Q?rdlBnlOrpW9zYczG+p13a7mtiXAs+ikC63JuwwLxrbDb4Kky9LhYscyOLW?=
 =?iso-8859-1?Q?RjKjSvl+xjFMBcceOTKJJxcVplqc0RvxaQakyzKWH9BADwH0cgXu/V9RRU?=
 =?iso-8859-1?Q?YjSnDw2fTB3rzabNIOKOJtxqqc5FSBlmE8zuLY2PSldC7bLmMn3nCzAQxh?=
 =?iso-8859-1?Q?BRzm94hC8QXdbQOWuvOr9AVXECbsygDl1yJIpTp5W0/2eNsHEGvtdLH1wo?=
 =?iso-8859-1?Q?yazPoyiSuZQy9UNqpRzhskmWohO20uJu99SSP0s9zeSdli9xoLBby6Jiav?=
 =?iso-8859-1?Q?3LIzPJZ/pCtU0LzdvAxnNRmfRhdxrhcHF9wEB51HIj4RvP/CzknC3AY1U6?=
 =?iso-8859-1?Q?wYk7YSnf2LN85czGXt9WvzJfY3ZrMB3GWOSZGBzBMaeiokCJscEt5EFHHh?=
 =?iso-8859-1?Q?FZwuR7ofRLbBFWshzEjXY0GBywBb2q1MWmiN+5Z/f7YSb/l2BvVtfR1DL/?=
 =?iso-8859-1?Q?A5vh099SqUsXIlPyTWC29hdSwdFK7FXdSvkuHchVm4rIySBHdRDl5QeUZt?=
 =?iso-8859-1?Q?k0Tc1FMQauHDx9a6P22AtSKoJ0wOSi9buPdwxHoRj2TBz9vEEuJm7PXspH?=
 =?iso-8859-1?Q?tvSPCS8dcQGy723ANt4rK+gp6e8Rpi51QTagHnIZrlEUA6JriZuoALUEK5?=
 =?iso-8859-1?Q?iSSSRPlgTAl0NjQ6xg8IxitIUBa3idk0e51eGzpjKDBJ7N7cvoy6CsICVp?=
 =?iso-8859-1?Q?NXmm34EhVl22Pw7WvPOWaH7yn4zKbnHNJtgkqw60lC5syzuB+p1x2U37GU?=
 =?iso-8859-1?Q?4cDR9eGJLKUxFxCQ2HKYMOqcwkSC91Ge9rN/taJavcYvAk41psykxcwOcH?=
 =?iso-8859-1?Q?aJ9rOPJhPEGnlcb7eOLnn+EGuBwGD+W1GEbjZLCaJHIidbugtdviYqlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0324a3-0d0f-49a2-add6-08dcd7497c7b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:49:40.9991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KC0ToA42DJVtPebw99kQDh9uZIw67c/eMtOIeL5EGm5GH7WRLWqK7S0+HLSunu7LAlmAFqo46M+yX6oGld6VjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
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

On Fri, Sep 13, 2024 at 07:54:34PM +0300, Ville Syrjälä wrote:
> On Fri, Sep 13, 2024 at 11:43:52AM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 13, 2024 at 02:01:49PM +0300, Ville Syrjälä wrote:
> > > On Thu, Sep 12, 2024 at 03:05:30PM -0400, Rodrigo Vivi wrote:
> > > > The pci state was saved, but not restored. Restore
> > > > right after the power state transition request like
> > > > every other driver.
> > > > 
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pci.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 5ba4ec229494..6d29ef4b396f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -949,6 +949,8 @@ static int xe_pci_resume(struct device *dev)
> > > >  	if (err)
> > > >  		return err;
> > > >  
> > > > +	pci_restore_state(pdev);
> > > 
> > > Why is xe even doing this stuff by hand instead of letting
> > > the pci core handle it?
> > 
> > That's a fair question, given that there's not much documentation
> > around it.
> > 
> > Looking the pci code, it looks that the pci core is not calling itself
> > for the restoration of the config space anywhere and looking to
> > other drivers around it looks like a safe thing to do.
> > 
> > And the pci_restore_state is paired with the pci_save_state.
> > Both i915 and Xe are doing the pci_save_state and not restoring
> > it.
> 
> i915 needs it because (as a side effect) it prevents the pci
> code from automagically sticking the device into D3, which
> apparently breaks hibernation on some old crappy laptops.
> But xe shouldn't need that.

Hmm, doing some archaeology here, it looks like the
both pci_save and pci_restore were added together on
regular system suspend-resume by Jesse from the very
beginning:

ba8bbcf6ff46 ("i915: add suspend/resume support")

Then, later pci_restore was removed by Zhenyu on
b7e53aba2f0e ("drm/i915: remove restore in resume")
because it was hanging some platforms.

The only reference to d3 related issues that I could find
was this one:
https://lore.kernel.org/intel-gfx/1497281047-25204-5-git-send-email-animesh.manna@intel.com/

but that was trying to add the support to the the save/restore
in the runtime pm side and not here in the regular system suspend/resume.

Am I missing anything?

Empirically Anshuman showed us that PCI subsystem is indeed taking
care of the save/restore.

Ville, my question to you now is: can I go ahead and simply remove
the pci_save_state() call from i915? Or you still believe some
hibernation somewhere could be broken?

I believe we should either remove both save and restore for both
drivers or add both to both. But staying with a lingering stand
alone case is bad. Also it kinds of block some of the refactor
code that I'm going around intel_display suspend/resume when
trying to reconcile xe and i915 calls.

Thanks a lot for all the inputs,
Rodrigo.

> 
> > 
> > So, we either add the restore state to both, or we remove the
> > save state. Adding seems to be the most conservative approach,
> > hence this patch (i915 is queued in a branch with other display
> > refactor).
> > 
> > Rafael, any guidance here?
> > 
> > Cc: Rafael J. Wysocki <rafael@kernel.org>
> > 
> > > 
> > > > +
> > > >  	err = pci_enable_device(pdev);
> > > >  	if (err)
> > > >  		return err;
> > > > -- 
> > > > 2.46.0
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> 
> -- 
> Ville Syrjälä
> Intel
