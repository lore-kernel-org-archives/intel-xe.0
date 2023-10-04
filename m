Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7EAE7C4E9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F8A10E0A4;
	Wed,  4 Oct 2023 18:17:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72C210E0A4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696443476; x=1727979476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ajQ3BUlkc+L2ymY1PLyEq3DiVxhFKrilj/DBU+6m4C0=;
 b=SU99HiE4fT21vnpFPNLu4vjqhvR5pWgu/ruZauFtrN1+1UIjOcnKKAOK
 JYfjP2geUGs6JFCDypb85R0HEAhHmoiZwJIbrnZg5nzuAfhxoaZZtVF1E
 99fNKQNzh4I16+EAZIxkgkJGE4qsiryfjXk9mP4tElbmjbrpXjGXfBykh
 tnq39APRwQC5hjWohZMcDUexaYPE42yo4+Ouo18IfEEMOuj0f4XyFTc3F
 iAwE+5FEthtj6iGIMmfdmSJdJ9cnpBYzjHYKtWUYUWBBJVOmtu4S6b8+O
 sDThjwl7mdS6LuGSU/ZtK3OLBIXaKdNWewMfE9LxBNnMCPGHCvxBvG64Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383164004"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="383164004"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="895086469"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="895086469"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:16:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:17:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:17:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhTeFEJwptfEONFN9RoLL6QAlASFojehp3SHRDYoFq+82t4vBmffko6OocFxzBmA4tFVVXtTLaufb2O9HiirnPQa5+8aQGsC7PyvMKUzIgyOslHP42sqha6Qwkb7HS+5wvdAi1/pnINPQzSsayCNT3OgSKpO5G65vCfhCfo/beuRYv5R5DfIOZNBsJGKKEBE9cF2B9e83I7jlP5O46YXwtQpHvreNpjrLTEebrLRGUmnGnzqGLuMZkvpTyBFpdI4GX7NW+gMa1LrAmoFyDNlzL+qk37rQvy6+hfGzCVo0Dtzu4eXhomNWarf/HQEb57Hn0f2kkHJe/clI+60quLtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lK0eQ/5GWgS4sNH5e4P17zIa2rpw1jKj/TAEKzWRjdA=;
 b=FuHVbBXklRVPlvSdWz2h6eOIP3sBiNwIty7RYShrMR+3ejHZBhhpzbIQUt4zgq+bpTdtdqSs9nAah0EintVCTojGHXaGLsyEPOeDHoe9i3RxPeFGJgNomKYFGtejT4uxGs4/c2MPd/B8h+fJYVZk1jipU8dSRn3zRfqZxsvYQ0gnRuZ26LeINaoVMiSKIR2JSeMHEEVDPUADaELnOziEe8xk3/E2ZpBldFTH1Pft25TIQkKv40kepsbc/NUg/X0zxxLQaZxK+6ofkqid1XdlcSG4Gp8tpnDsei4ntIXdsi1xg4HdPNb/EU31lthvlMIS/DVr4nlOnoNGuUoXQLdvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM8PR11MB5606.namprd11.prod.outlook.com (2603:10b6:8:3c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 18:17:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 18:17:32 +0000
Date: Wed, 4 Oct 2023 13:16:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <xgggupdygmhbyruwqgr3d3hoorvokgdahfqpfdnhb64qna23mu@zlcb3borrej7>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-3-anusha.srivatsa@intel.com>
 <87fs2qg6pe.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87fs2qg6pe.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM8PR11MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 514db712-40e1-4eef-9536-08dbc5062d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxGYdm0jPjjshusxwtJj+X/zY1b51ojoDiTzBHhYTEomj+IRpIji6QrfYLU1XdGPVIwZPFY/pNRpd/Gpo0xxNFHoqAfHXgkbV0FqpccGQFz4VqXYTsB0z4AiBOtl0TFFiprC1Lo3MKrXyqScQCnJ+ktTNz8wLVlv2GXU71qqG9MO4ZAPcHINpr1NbV8IQjqvJNt6jvk7sfBUtm8efo+6esoO+2vgV9udIap4FNu6hKYhxNAVTjCfaSsaqvBXZazokZ4fIdir1omFoC/DLc1EPtRrWslpP9GKJwVNzQbr5gfkUY72nsfvt1UJY4FKFD0NSsfc6iZj/PRRr4Lg7nji1SdNLp2NywEw4qScjyFkfS9k51yZ+/vhERRwu1gDmPW5r4b3exX3sCED5iKd6urS4Wyx2zCBYOBjg04wjX2I31JShTbkRjuBr5CiyRx0izA+wKmVrWniCDVIlMTXbqfEZbb9INKRc0/5mU6TpVQ38/5oAmkgaPC8GRKsTm8NvUZJMTQSK8W8HvXfYC+68wQP2gHubpDie4yxHa6R4QxFAg1faCFqBEldXrbHdjVqK5mH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(9686003)(6666004)(6512007)(6506007)(6486002)(478600001)(38100700002)(86362001)(82960400001)(2906002)(6916009)(33716001)(83380400001)(26005)(66946007)(66556008)(66476007)(8936002)(8676002)(316002)(54906003)(5660300002)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TIyPJXnbRIazCsbvhMHysfR50vTOs6wsJrjoB2GysMIfI5QieExO0ErIVa9g?=
 =?us-ascii?Q?WgmzHD2OffGcnbOjcp2af7/tG9HykL3FbSCTNEVTCgAxhkjvVsEwtDvIbgia?=
 =?us-ascii?Q?hSnqK3Jm2O1srBhy4KZ9PnDUTFWZZxe+VRHLw8gAHx8exJpmNsc6k+4RGElp?=
 =?us-ascii?Q?vfaM7ZiDY32l1QjL1Oa/Km8x0mad/uoihnxvbCO94SK2d/ar2KeI+jJDxrww?=
 =?us-ascii?Q?4gcMOkpn4WGq0/LwwkKjAqPICmNBUjMpeBy1j6yMF/cTKNgUbmka6JFIIi1A?=
 =?us-ascii?Q?vNfW+AYKPs16HQdY1E6HNd/kuH/9lJz9MU1OGG6K1KcOAHzM/6cld8ZezAsl?=
 =?us-ascii?Q?2eDDeAt1Js3BuUktNi/DisLL+SckfwALSzahqvTdks6FKXKfOWV3k2SXDfPi?=
 =?us-ascii?Q?+82sGtjSSS7YTmv3lGHfKqF0BJjrLrZHJFnG3eFsgcErqprPWqMzijnXCECt?=
 =?us-ascii?Q?vD2Lj0f9AgSAOztaf5i3aaLjqCl+ZSX11C6naiIIxPjePBaFL4vk2wjJW4Ol?=
 =?us-ascii?Q?JOUjeTGu+nGBkdy3VsQGOtpXwiXNWOoFSJOHta6DbtInzrlk10JBc6dSp4hg?=
 =?us-ascii?Q?bSmJA+Zcjwsf5CIMrrvEQaJlys1ta0P6ZZAUQFtMYRdzAWARb5awUqbUUjsj?=
 =?us-ascii?Q?HjhED/FgiUpnTOCxQl32iZL6k7C9YwBS6RyuX+yVhNdzePHSPDFH3sOgFkMv?=
 =?us-ascii?Q?VyawAohsam8wxLhUkPN+LFOKC3tVFzgHLi1pyYDfarMy2u5jNVIhaGxR2bNm?=
 =?us-ascii?Q?IpsrnhrJUmu9kNvUkLvwyO//I6S84claerO4yF+aFD8ZpI1pKUoqUEFw1AAh?=
 =?us-ascii?Q?KZ8k2ajKx61rxUQYfeDH6AHjaVC8tPw5RotPAoEL+0qBvcHMbb2ZtwTZP5ZO?=
 =?us-ascii?Q?2nJ8zicD83P3IpH598DxUPZYZfPz8iaNJwJQeH4FNV5+1+yKNd7zH9mCHcyy?=
 =?us-ascii?Q?jMmgmvPIzPmZD3zlLW7o/vcbUuIA+Dxox9N/HawlSRoV1ZeU/dQSqWRy0g53?=
 =?us-ascii?Q?zpMtGovCqen3QoyX2Rw9rTX64yf0eNU/bxblRpdrpO6wYLZAhG2Tvhu4QX8U?=
 =?us-ascii?Q?x2vxC7qt4T5LqH35zUa0QH1n/8ZBr/2byIvWzGHZ6nySCCCeF4J+m9++T+lB?=
 =?us-ascii?Q?lseM0i/Z33JQM4Eu/V0B57qvMuNgjTaStIk16Gshunt7KUyqclhO8Pk7/h9V?=
 =?us-ascii?Q?7hCie9qCk67JwTSWfrdd1ik0CkS76uX5+l39vEfcRB32BLM2BgNaEvfII4+w?=
 =?us-ascii?Q?dl25Jer4Q+sopvhXm/5LYalTRVesuMWcMUWCKIIc3O6Wh86HkDm7P9jG3X3C?=
 =?us-ascii?Q?qyXzdJ+K/Ydm5MQlmKAAyijc7FyXkFVdtZEjQO8bYZY4WeQjQ9hFVB2Tlqa3?=
 =?us-ascii?Q?kRkZvW5isckuPDrFleWMVFKsxc1q48M0syfR785+aiwJJCsz0vWXZzgG+RpR?=
 =?us-ascii?Q?us3Qj7F3ufaMd0HttO2QRQRTU9CGTdJCnfGPCESdm4hx9YgaykXOlcaH+AWl?=
 =?us-ascii?Q?W3Ib7iyZ8v410O5jsePi2ArqTdzqGAgwkHzjtzuNRlvPyiY8ADy57jTDW1bV?=
 =?us-ascii?Q?MvltPlMWXJJMlKFaXS0lPrlcTPKXecYRq6FMowplw6GtPeQOIRxWYnaNU0N1?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 514db712-40e1-4eef-9536-08dbc5062d46
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:17:32.5359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1/ZOUdzk4XdOj8rhj+n2OksvzSn5J+VHrLuC51IdmZ2xEwmiIkR7ZhAawLfW0W+CvTb9w2eSxIsjOdus9IGr8Z2E/lg0iXoFmZ5qyX1ziY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5606
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] fixup! drm/xe/rplu: s/ADLP/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 10:58:05AM +0300, Jani Nikula wrote:
>On Tue, 03 Oct 2023, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
>> Extend the change introduced in the previous patch to xe
>> driver.
>
>This is not a fixup to the previous patch. This needs to be a fixup to
>the commit that added the file to begin with.
>
>The order of the patches will be changed to add display enabling last.


assuming we are still going to move display up. Rodrigo mentioned
recently about maybe stopping that. +Rodrigo

In this case the commit message should be:

	Subject: fixup! drm/xe/display: Implement display support

Lucas De Marchi

>
>BR,
>Jani.
>
>>
>> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> index 7c825f129166..918dd27868fa 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> @@ -146,7 +146,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>>  #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
>>  #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
>>  #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
>> -#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
>> +#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
>>  #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
>>  #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
>>  #define to_intel_bo(x) gem_to_xe_bo((x))
>
>-- 
>Jani Nikula, Intel
