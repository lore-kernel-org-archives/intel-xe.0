Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA59EE7FF3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 13:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C710E8A9;
	Fri,  8 Sep 2023 13:17:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3368510E8A7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694179048; x=1725715048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JrlL3Op+4aYXJO5iQut0OVbyeUILuHwGIh3+VvJAR4c=;
 b=Fq9j6IMLA5J8KNsOEYRcBHfZaHKT9PWiDAN0R7fo9yhhmyLexxAMdViW
 aoSbyu1rAwCuM8AbCvAUACLuX4O8s/A4LiTYdtGQLwTKVie9UkDH6zFXF
 1C7P1nojXjGZFR0VC/OvaCyv84vzJUxkgwsmyBajUwPX/R00Z1UziIlB+
 ukoOJXwR8y+bG1zmlOFpmHWDcZVqeviyvkVMNxFeGPqbJGKsIQFL2dx9e
 ThyLuCTswq1JiUuW1o85Z/aP9vo+ov/aT6vxxfcbM0JsUtQCkSpKgdmhN
 tOZX3d4OOjlxiKvdZgKc5hPDfQrtuaOtc3uTsbtydo8bjNXQ9wQCRyJLp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="367905072"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="367905072"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 06:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989247829"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="989247829"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 06:17:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 06:17:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 06:17:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 8 Sep 2023 06:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQdIOXvM07l8XsKhZ2oDzSJDHWGjWXsXgrlTuWbuJB+XCtdHsShChu3G8/GD5A5jcaJKG1vDGZzHufkBI2UXotoGWx3xVuhsU83OfRW5kiAVgGxWEa5mO0EGaggrx//A5XkV3111x40Cwr1kUgTYW6Q4hEU610FOthQNNi8+Aw4cKBMl4QDGJvGQZU+O38vEwgRjliIAtPjv3/cnunazgofT8bPdbCs6kmc21kzUspZnAgpbklPdhW57zqNMvTuLr58jgYIHMFxYrYKnNxvTISCTqH9WRiFC9etJ8ZOCyMMxyymbCgWWy5YG9xV/FZwVEYw7AbE0uucktB3oo59oVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY8CtGwJhYRtDRBmLft4syFTkYR65DK1+JVp2JccQgw=;
 b=cLesoAETTihMHcKwhuUWk9uPYEpscG3bzMi+OPqS2o7kV4u/Ef1M5RbUK2+XVmv7RUybGS94tAUs2TOsEP7NxSFc1E9mMGjSf6PBvIpqtDMcsYfgmcTaiPR/1vi6ab+S9PVh4Xe1YNhNn3y/h1g0WTRa8U/H8cm3LN7Tf/4PkzXuQINCkPhlRBFTXb9e79KxM0OE3PrAmG38X4fgujoLM1KXh/qNXtPrXO8GpR5+fuflyt4ftKnvh6bKGNNVkEKmMzEcA3K2GAiGbWDTNan5YKQcGgtuCrXNbVdfUqcjjTXok1sKrDXctsPRIMduY4eoOiMGgx/UaASl5nZLe/YYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8704.namprd11.prod.outlook.com (2603:10b6:610:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 13:17:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 13:17:25 +0000
Date: Fri, 8 Sep 2023 08:17:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ru3jqocgwkfmhyfgdvttfwewmoducukeqhrl43shkutsyjrvru@hvyfaxmnnlqu>
X-Patchwork-Hint: comment
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
 <20230906180457.GF2706891@mdroper-desk1.amr.corp.intel.com>
 <26hcp33tuu24jtl2tyo7iyqaucnkbww3sd4na4k5boa577eof4@axnzegfuxdya>
 <871qf9gejk.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <871qf9gejk.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b2c312-3626-4323-ee86-08dbb06df136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eRGbu9efHZk0/DGv9SZVW2y9vcKjWIF6Z9+LMGWDuVM4B2LKNlyx1WnSFW8uCXqlmhPcp9EI8jupxWnx6qDNxYHG+LlucEaIK9mr3CgB1PKMc3m7imk+Tf5KRseZdWdquPPuM7L3/twcb7OC3s2fYPI/vuoluBFaQLTTQo+9fP69sbjeIqOK24X8B7hQD2YOOTJvgm3MrdfNDoM3k6gsS68kPgkQOGI0HgOb6/QAJNBbypukrPCNJDwIHMA3Vz3cdrZXhyBSKi/amqgGEkKgWp4+CkE82TAK5b+jLk7DxtmLXQp5KcvNMvXwqw1E+pCMgDl3+1CaCMFM0t7HqLiWoVoL3a4XqOGNVWyvDj4Kbh0WeZLDjX3fJhRaVbAAXUd/oSN0bZUNa1oTG6+O7ID3f/yzSNejRg5/voTZgAl0rBCQuuWTZd25wOOUvfKLbyAeT3TQVkw2o9UmSalGR9gXIUaA/qFSknw59xftJcJM1BwPLHwYQ1QYEC8m/OtyzqMIz78b9+hS2NNq87G2vayB8V7lq+m7HYfsGPv4XbCU10E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(376002)(136003)(366004)(346002)(1800799009)(186009)(451199024)(6666004)(6506007)(6486002)(82960400001)(86362001)(38100700002)(26005)(9686003)(6512007)(41300700001)(83380400001)(478600001)(5660300002)(4326008)(8936002)(8676002)(6916009)(2906002)(33716001)(66946007)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQX1LzU7H2qBvgub49+uyUsh62kioeCZbesbKeoD0N83R2einHA9xxdzYBRW?=
 =?us-ascii?Q?lZ1rL9UBvEUup3LOrZ4YJywuqWIRtmYqOi6M2gW+pc1bQ6pAaqp4+aausuCT?=
 =?us-ascii?Q?JQC8A0k0JQvdh0W8m2jKJSw+M/DO4BfUqtGNJ540rpbZFY5rBTc7cwWcmNRH?=
 =?us-ascii?Q?hX3Ubmw/VRAr6BxoEQD2+9Hs7X4hPwjlERm5wYjpXXC7IiL+v8Mr63eZ57lO?=
 =?us-ascii?Q?E5sMKesWpUkXzkTlPEur1ERgeUkVoE2vpXPndUgCbdjrYR22ynZxY8baRcUj?=
 =?us-ascii?Q?IwFsQ8+x+zp08SsJIvmLLk/lu7P/oWvpXgM+H03Vo/bs26G63SoHTc3HxIru?=
 =?us-ascii?Q?263/BjZ/UfLXRmbUwwhf1TVvsDvNWsRazFvc50zAR+wW2k1Gz15Y6OlaF1CZ?=
 =?us-ascii?Q?hp/1F6F4ycWVo5v7jo42O9WuNYGS5a7IIcnbtU3uys3C/9nB3ym0GrNPT41z?=
 =?us-ascii?Q?eRSd0GsXL7U+23lscFUA/sq1d2+JAUFoWp3SJNlDDAGnIK8392SDNLVjBF3q?=
 =?us-ascii?Q?8ta3WWs9MHQW82jf0qyhOXPdq7vTgzuPMfI7/tvR+NIjB98d0VrJozG6EgVT?=
 =?us-ascii?Q?sL5cFbJJawB3czQDNFmowd7IFTsOGifFjSSkT+9c6v34QI7DvLglKRp8ifjx?=
 =?us-ascii?Q?V/wZnJR7FgngSG0B2ztHsgyFRU3nx2YuhOLod3Ch9iWd2Ff17bosM+29JuQD?=
 =?us-ascii?Q?NW20RLk8b3f6ug5I5fXNNY0fFfJ24YJNGzbXzJlhL2/9cEI+WpS3i/KxWUIL?=
 =?us-ascii?Q?LSQj9wtjx8w3h1d720vdxkMdFkWQ9sr+a9hcleoHWjl9I564UdpEyHCJKTeX?=
 =?us-ascii?Q?s/tZHxiPJDHHTGXKKyq9kntw+SOGq58LFwMBV08+a6jtrBH0ZbcoKyoXqpEc?=
 =?us-ascii?Q?AGG/a1WQATK9ZKH+BWQDAi+OZ9sT2GIqTpZRcdQYi33KDxNOdCJZYrDe3R42?=
 =?us-ascii?Q?/7VfHl0yQr0ylc4cp4/WhqlSohVTV/ZEc6LoCuI1v/IGMjQWyfv0aII2tJ0j?=
 =?us-ascii?Q?LSWNQxKfX/kDHxci/6E6nKSlOqrBXa+bzlVJNAEEaeCa4Phqp2YIC3nP+0sx?=
 =?us-ascii?Q?lU7Gg9/9tXvaIMjiHrrHDILHcYx+9COJgIUJVnZAWu3gHCVKsU1RhGhpq0IF?=
 =?us-ascii?Q?mf9ccQSiYOKzrL88fNbXj+BG+K9GOfICJTDYs5GdayWBb25ByRUG5c/QBBtX?=
 =?us-ascii?Q?IuzlO+5G2/4zgFUFoVTu5duPPe7+6FiYpP2bBl9smQRb92FEAtIWDqvDL5gg?=
 =?us-ascii?Q?gTSJZ9njmLIBra5YN/6ugptq2MRSDL4rBa6JfdpBkqFtHTKiGK/1850WMgCH?=
 =?us-ascii?Q?s9KKRqZL2oS/Gn/pPQOf5EaKLU2Vs9xL1RHaxZTFyPlhk3ZxEbJEZfQtI/p1?=
 =?us-ascii?Q?8aFhjTUWBeVOmP+6g2lWyCop2CoXi1QN6pkibi6kfkLOPloeELO/TcsujWTo?=
 =?us-ascii?Q?FU5N6q8Eu7lVIyl/hKwOlO29nePNliQ87NKrD5u/g7tM/soK180oSUbPR/At?=
 =?us-ascii?Q?jXBU8SnY4K2fnNfu7nunPrue1yldnSi1CU8045PRTVuXEF5XVErO6+kPNzCI?=
 =?us-ascii?Q?V02aJp85hIQ2YZ+uJIwn8Ov7YxSq5/4gaplTtPlEW7Zk8EJrh+vudh4nNb9M?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b2c312-3626-4323-ee86-08dbb06df136
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 13:17:24.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE7El+ITc31JQokr083Xp+QhtCEl1AWnLj97Vz8pKD/O59cMR0I5DcRiOvLAYhb2x4Dwj4AWMnoe64tCb6CgDbvFaQS6sqdm4ANbmLx4EXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8704
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 08, 2023 at 01:11:43PM +0300, Jani Nikula wrote:
>On Wed, 06 Sep 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Wed, Sep 06, 2023 at 11:04:57AM -0700, Matt Roper wrote:
>>>On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
>>>> Print display ip version during module load
>>>>
>>>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index 60f3474844e2..fc01544346d5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>  		str_yes_no(xe->info.enable_display),
>>>>  		xe->info.dma_mask_size, xe->info.tile_count);
>>>>
>>>> +	if (xe->info.enable_display)
>>>> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
>>>> +			xe->info.display_runtime.ip.ver,
>>>> +			xe->info.display_runtime.ip.rel);
>>>> +
>>>
>>>Rather than printing the display version here, it might be better to
>>>call intel_display_device_info_print() somewhere appropriate which will
>>
>> Somewhere appropriate would be xe_display.c, so it only gets printed if
>> there is display.... or if it's moved to a shared function in i915
>> itself that we already call.
>
>https://lore.kernel.org/r/87r0nbheil.fsf@intel.com

not sure if you are confirming what I said or saying it was wrong...
A call to intel_display_device_info_print() in xe_display.c seems very
reasonable.

Lucas De Marchi
