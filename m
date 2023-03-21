Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCA1C6FD20
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 23:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378AD10E0A7;
	Tue, 21 Mar 2023 23:05:11 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2DD10E0A7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 23:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679439909; x=1710975909;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tDOVYB1kh6Us8OjyFkM0iXCTYHAPidnAWoUBLzzDu0s=;
 b=guFnG08AhHdwgYyXTAyosewjc0qo6wSQztpUj5Jm5tbm0zfSVAwhpGQ+
 lg3SZNFzeQGagW9nJqn74kKbJyYm3+CCFfbzy2AHL2kwL7gfIpr8X6NZe
 /3AsrtnQ8XUoKxTM865GFsY2Yv3knUidC6b5f0dM4exHbKcYAMe1WRDe1
 YQA9B3Idrrpmx2tH8IT0EMK020uVS5bTVxuthXxN7RB6OMvHlMhcDS4WZ
 0gT2kZrtJrG2eITuraZCtvjpihjBJh3NjgYARXkdhnxHeV5CnaISCr3nO
 I2bu9fkDJak772AlSHZFYsjlFEGmCy3l3+8OA3MkoaZjLic90BSz6caRy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336585250"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="336585250"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792299904"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="792299904"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 16:05:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 16:05:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 16:05:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 16:05:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC83jP795R54bg7plhhC4qYEtoxXbAexr6585vIJpKz54S3zvAvDUd14Q6CgXj6at6wxFrfCLranVab1jvXNL9CgZqqO2qUkGJudJ3V0aMBpsGEUkYlej5DWycZ/EITrhb0wbb3ockHz7EdlxL7b+4fDFZGI5ss9QU89vOyhuCVtOvXuJ1KbcLqjEQuxRN7r2kFPRdhxYoqZNXm5AVSZ1oZ/CpTRbagcWdeOJ3QB8ARUQenjYxUrslU8p7eUCjdX4HcMVeHgw4rpxVG9PffnnVWp9ZmvygY75WZbdxmCC6jqm0XiOeKQPeYlN+o9Y6nMA6TJ3LAvzCxiXvX+cz1DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdJP7RuYmnkSRGJA8YIJz+NcMSCKNHKRw6yWIF/k5Xc=;
 b=m/ZCWrkD2Dmur/vuoaJtHEfBaY99zFrbRvispPR9ZoTBerRf8Z772CjezWtCvmnbsgsvlHS6S5ZN6alR9UMNCKn7QFce3uPFGJisxg0iQXHDuVp+NzpXeXhu9Sao4OrAtsNCGM2Cuo7E4Ps4PYH8eXRiOlnfE26YvCxTup/ej44fuyVNDrfNFaMTQdYxSkGvpBdllrHHHwlWMq7P5F3Fi7z9ZAKjm02LDzaaD/6VnIllvDOH0PL0Hv5rbA0T0OnBwKfpHZWUyMY7Rh3WsYO9eo1DMUdwdBpbTn33v2RUedqG4KvB38Kj/2lvhLkR/9XYqLJD4XettvdFE6wLUdj3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 23:04:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 23:04:51 +0000
Date: Tue, 21 Mar 2023 16:04:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230321230448.rkgnfemrg4ehwfat@ldmartin-desk2.lan>
References: <20230321160420.1352889-1-jani.nikula@intel.com>
 <87v8iu6qc1.fsf@intel.com> <87sfdy6q9k.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sfdy6q9k.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1c1b9e-ebbd-4a25-8f9a-08db2a60ad44
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqM51w6IMXjD3nr0McLR5Coibl6XHLyVlZEb5hM3CjY17eobqKjmGkAkBN8/wU2xvjRNR9PRQO7Vj7ZZONJuqZ+dZZSYTso4mU+pv05iIHmj24vhwi8oZrjdDF0NIe3i8dnUVOy1X7hxiE+t4vOV51c6mxHwJHPWzNDmXSCo0c3Gek7pQYJ0t9TyPwu52mxQ5T4r72JWTzotMaeULCCvS5/4vlyRjmNx90xePHOqc4UcBBy7QPMLvFhkDm1u7hmL5bkqBWaQo2bZ7rmDbCHTTCyxGS5NlZuuMvaNjcIdWIYi/suAwZcDLnq4zQXE+cyvCCPTiEiSW66vmk6Pvn/6rZn6YfNRFLX0zEkwxJzLfck/GdNwfkuUbEhDe5vjjEV812+S1F1jru14K4xEaWTvpwStlhzXUkvb8PC+w5VjHkhWdXL1ABIcUaKi4VkF66+Pidvfqo7Rk71QPdNmlXUzlmlQChs+CwGdG9fHT/EwQTbhIbgT4S2lxL0fm8E1o0BBBL5lp+O+t/PPsqXqauDlFSKjiczan6Jq9yw2Hhj0dpu59W1lVv3LYieW0Wj6xsYK1NfbxDZgcdHdIeR+Ez1kZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(36756003)(86362001)(6506007)(8676002)(66556008)(66574015)(30864003)(4326008)(5660300002)(2906002)(8936002)(66476007)(478600001)(66946007)(41300700001)(6636002)(316002)(38100700002)(83380400001)(6666004)(1076003)(966005)(6512007)(26005)(9686003)(6486002)(186003)(6862004)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jc6AlaOyAeNgDGC4XOsc0pHT8/2rvuZm0czJCzj0lnzpg+BmY9RdgJteOs?=
 =?iso-8859-1?Q?sOZMVugQ6y7xVu6zxP8shs25Z/EdKenCN38/L8PHy5+9IcdLua00oEzwNa?=
 =?iso-8859-1?Q?84XDbA9KVrOKqSxa78YBdQ31chHeVW+zTkR701p2XjDsHQCsSZ06NTF/vq?=
 =?iso-8859-1?Q?IrqewMbziWqCwVCewpcA57/MShqurHTCu9nAgBgYSvVJg54Hsn0TplhKBN?=
 =?iso-8859-1?Q?vafSZXyKCDR+OVGyPWj6ilbERzqxMxHNCV2Z/I7Me26qCZ3PENjsxeymkz?=
 =?iso-8859-1?Q?GNrU12iQC0SRBpCBjySvil2nZSjXOKlNbRDgm+NRoDXHeL7eds/IXIQCLc?=
 =?iso-8859-1?Q?Le4X+eNVYgCXnp87bUG6I48UdNQYgxRH01qqtdf2OKTruq9oQacI49TFNM?=
 =?iso-8859-1?Q?tQFxcNtkA6mNohxdS0iqXDcLK8MI3GMfGZYf2A4r5YbyadYLHHxDcQYlR4?=
 =?iso-8859-1?Q?3Ar1TjMwAjRCI3wa1pQQQjq7XGx7Fyc0PYMLq5X7iFNRICKUGhyG+K1LhQ?=
 =?iso-8859-1?Q?fC2zfnsfiIK+dLiO29yhY/uicH/4D5G0oKFbuSGHrEB4PTIVbifhUe8HJZ?=
 =?iso-8859-1?Q?YQzlLlfAGnnpiZ33sRJL7ihqoI6SQgwETp/HhX/Nw2X11f4UQoIWo1Ow2t?=
 =?iso-8859-1?Q?bFuyPJvYRHLnxituCbVLT05eBb6IO4ceG/QN7/rPhrXDISmEXjq3mS521b?=
 =?iso-8859-1?Q?UV2IwWo3TUC32SpnZZx/hus4Li1+cUTcjSRll8bB5ixLJN/NbtG3twMWHo?=
 =?iso-8859-1?Q?nVwH62+wNgChVAORDya1bOQMkm3CwqaiH1NzOO/YjPMoHB30bFqI30GXnQ?=
 =?iso-8859-1?Q?+fJ7lhSs/PF2AoY7oD1o8fnFPjVlyxBbXM09dznmMbCU0C5HlPwLLZAKC1?=
 =?iso-8859-1?Q?nWYkb3ovIKoaMg2dpOqwMUnaIxVBItHnlDgiW/PgYmzzPzH3HRYem0uqsf?=
 =?iso-8859-1?Q?5ubMJhPxnlRbHyd6QjFZM8foV7a8vYEQULTnJto52SJnralqydg2GdUn4q?=
 =?iso-8859-1?Q?z7J5vcDh80L+8xMlOTlHWrTQO06GlRPbdC9qJ5P5jFHY61QH+amg9LDQ4f?=
 =?iso-8859-1?Q?h9P3BiZsVPY7D2HH9guvCumwrFsOd5bLORYH7VAwffzHizHidZvCLx611z?=
 =?iso-8859-1?Q?3vtpPMxdouog+di/nb5UfzbG9+CXE/o7RNoBeK3G8JAzFc5sweQoG6weFV?=
 =?iso-8859-1?Q?XTYvq6lkNaf2S9slWETs35yXg+E0+5yBHqctTx0QtEIKParzw5UWxplpzJ?=
 =?iso-8859-1?Q?ml0RpccolCyNT1z9l3h5bUeHSF4qR8pzHBLrh9ULgr2IMI/3iSavOUt7Ry?=
 =?iso-8859-1?Q?ylFcSsLcSA/8Xv6Aysq9BELJNXsA4N57/72eY8NpqCDZ9QYqWniVsLA+cj?=
 =?iso-8859-1?Q?nK+QG9xh4J3mq3uq6uy7zvd/wp/7uEW8mDonIPNOFP9vi4t/qoWDc1Ozf7?=
 =?iso-8859-1?Q?c8zNP1VEPa95Kd7/evOh0/4c/mAjpvj5tj4snufXcNVd3QCvAE5HqtZ/mF?=
 =?iso-8859-1?Q?Kd7QQbDe7hh797bze8ehad4N/arFDCIVNaNF39jlRBlxsvLAOTOLN4KSQG?=
 =?iso-8859-1?Q?RBgLW4ceSo3N2OSLnP+OE/mUf05cVibX6hktEUTXouNVeLqg/ss5u01HT3?=
 =?iso-8859-1?Q?SOMzwgV9mu3xuvLefbfmlCdv57rhAg/xKu4CxHWok1Q3lWsPS3PA6FLg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1c1b9e-ebbd-4a25-8f9a-08db2a60ad44
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 23:04:51.7422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUoSwqLKYLBdAwrYUkTOMAr7AMykYygORLVFP+17AQCZiLiLkFZoKKTiVRdRUbQS3ySocvANM676Jw/N8DCKo+0M0S8b4UherdwdQfmbfSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/i915/rps: split out display rps parts to
 a separate file
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
Cc: intel-xe@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 06:08:39PM +0200, Jani Nikula wrote:
>On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>> Split out the RPS parts so they can be conditionally compiled out later.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Link: https://patchwork.freedesktop.org/patch/msgid/20230302164936.3034161-1-jani.nikula@intel.com
>>> (cherry picked from commit 6dbbff25b39565c801c87379bc85933fb436518e)
>>>
>>> ---
>>>
>>> Here's an example of an upstream i915 commit that can help clean up
>>> cherry-pick as well as cleanup of the #ifdefs in one go, otherwise it
>>> breaks bisect.
>>
>> *sigh* I had something more here, but having #ifdef first on a line
>> dropped it as comments, and turned it into nonsense.
>>
>> It's a backport of upstream i915 commit to help clean up #ifdefs, but
>> how do we want to handle them?
>
>Moreover, even if we're stalling with adding such #ifdefs to upstream
>i915 now, we can however clean up existing usage in the xe branch to be
>more suitable for upstream. For example, I'd take the #ifdefs here
>pretty much without issues.

instead of a cherry-pick + squashed-ifdef-removal I think it's better
to do:

1) cherry-pick
2) remove ifdefs and commit with

	git commit -s --fixup=38a139546384

   ... or whatever commit added them (there are a few before that commit
   above)

The reason is that I don't think we will be able to avoid 1 more rebase
before being merged upstream.  We can't do merge-approach neither
because of these commits we don't really want to ever show up in
upstream (and because we are on top of drm-tip rather than e.g.
drm-next). So doing the above at least makes a rebase more bearable:

Whenever we do a rebase (with --autosquash) the cherry-pick should
automatically be dropped by git and the fixup should automatically remove
the addition of the ifdefs in the commit that added them.

Lucas De Marchi

>
>BR,
>Jani.
>
>
>>
>>
>>> ---
>>>  drivers/gpu/drm/i915/Makefile                 |  1 +
>>>  .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++-----------------
>>>  .../gpu/drm/i915/display/intel_display_rps.c  | 81 ++++++++++++++++++
>>>  .../gpu/drm/i915/display/intel_display_rps.h  | 34 ++++++++
>>>  4 files changed, 123 insertions(+), 78 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h
>>>
>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>> index ae9259ab3261..f689132e1506 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -239,6 +239,7 @@ i915-y += \
>>>  	display/intel_display_power.o \
>>>  	display/intel_display_power_map.o \
>>>  	display/intel_display_power_well.o \
>>> +	display/intel_display_rps.o \
>>>  	display/intel_dmc.o \
>>>  	display/intel_dpio_phy.o \
>>>  	display/intel_dpll.o \
>>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>> index 3d37f44ec835..e666a5c1fd91 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>> @@ -34,13 +34,10 @@
>>>  #include <drm/drm_atomic_helper.h>
>>>  #include <drm/drm_fourcc.h>
>>>
>>> -#ifdef I915
>>> -#include "gt/intel_rps.h"
>>> -#endif
>>> -
>>>  #include "i915_config.h"
>>>  #include "intel_atomic_plane.h"
>>>  #include "intel_cdclk.h"
>>> +#include "intel_display_rps.h"
>>>  #include "intel_display_trace.h"
>>>  #include "intel_display_types.h"
>>>  #include "intel_fb.h"
>>> @@ -951,66 +948,6 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
>>>  	return 0;
>>>  }
>>>
>>> -#ifdef I915
>>> -struct wait_rps_boost {
>>> -	struct wait_queue_entry wait;
>>> -
>>> -	struct drm_crtc *crtc;
>>> -	struct i915_request *request;
>>> -};
>>> -
>>> -static int do_rps_boost(struct wait_queue_entry *_wait,
>>> -			unsigned mode, int sync, void *key)
>>> -{
>>> -	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
>>> -	struct i915_request *rq = wait->request;
>>> -
>>> -	/*
>>> -	 * If we missed the vblank, but the request is already running it
>>> -	 * is reasonable to assume that it will complete before the next
>>> -	 * vblank without our intervention, so leave RPS alone.
>>> -	 */
>>> -	if (!i915_request_started(rq))
>>> -		intel_rps_boost(rq);
>>> -	i915_request_put(rq);
>>> -
>>> -	drm_crtc_vblank_put(wait->crtc);
>>> -
>>> -	list_del(&wait->wait.entry);
>>> -	kfree(wait);
>>> -	return 1;
>>> -}
>>> -
>>> -static void add_rps_boost_after_vblank(struct drm_crtc *crtc,
>>> -				       struct dma_fence *fence)
>>> -{
>>> -	struct wait_rps_boost *wait;
>>> -
>>> -	if (!dma_fence_is_i915(fence))
>>> -		return;
>>> -
>>> -	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>>> -		return;
>>> -
>>> -	if (drm_crtc_vblank_get(crtc))
>>> -		return;
>>> -
>>> -	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
>>> -	if (!wait) {
>>> -		drm_crtc_vblank_put(crtc);
>>> -		return;
>>> -	}
>>> -
>>> -	wait->request = to_request(dma_fence_get(fence));
>>> -	wait->crtc = crtc;
>>> -
>>> -	wait->wait.func = do_rps_boost;
>>> -	wait->wait.flags = 0;
>>> -
>>> -	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>>> -}
>>> -#endif
>>> -
>>>  /**
>>>   * intel_prepare_plane_fb - Prepare fb for usage on plane
>>>   * @_plane: drm plane to prepare for
>>> @@ -1102,13 +1039,13 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>>>  		dma_resv_iter_begin(&cursor, obj->base.resv,
>>>  				    DMA_RESV_USAGE_WRITE);
>>>  		dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>> -			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>> -						   fence);
>>> +			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>> +							     fence);
>>>  		}
>>>  		dma_resv_iter_end(&cursor);
>>>  	} else {
>>> -		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>> -					   new_plane_state->uapi.fence);
>>> +		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>> +						     new_plane_state->uapi.fence);
>>>  	}
>>>
>>>  	/*
>>> @@ -1119,10 +1056,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>>>  	 * that are not quite steady state without resorting to forcing
>>>  	 * maximum clocks following a vblank miss (see do_rps_boost()).
>>>  	 */
>>> -	if (!state->rps_interactive) {
>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, true);
>>> -		state->rps_interactive = true;
>>> -	}
>>> +	intel_display_rps_mark_interactive(dev_priv, state, true);
>>>
>>>  	return 0;
>>>
>>> @@ -1159,12 +1093,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>>>  	if (!obj)
>>>  		return;
>>>
>>> -#ifdef I915
>>> -	if (state->rps_interactive) {
>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, false);
>>> -		state->rps_interactive = false;
>>> -	}
>>> -#endif
>>> +	intel_display_rps_mark_interactive(dev_priv, state, false);
>>>
>>>  	/* Should only be called after a successful intel_prepare_plane_fb()! */
>>>  	intel_plane_unpin_fb(old_plane_state);
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
>>> new file mode 100644
>>> index 000000000000..918d0327169a
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
>>> @@ -0,0 +1,81 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/drm_crtc.h>
>>> +#include <drm/drm_vblank.h>
>>> +
>>> +#include "gt/intel_rps.h"
>>> +#include "i915_drv.h"
>>> +#include "intel_display_rps.h"
>>> +#include "intel_display_types.h"
>>> +
>>> +struct wait_rps_boost {
>>> +	struct wait_queue_entry wait;
>>> +
>>> +	struct drm_crtc *crtc;
>>> +	struct i915_request *request;
>>> +};
>>> +
>>> +static int do_rps_boost(struct wait_queue_entry *_wait,
>>> +			unsigned mode, int sync, void *key)
>>> +{
>>> +	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
>>> +	struct i915_request *rq = wait->request;
>>> +
>>> +	/*
>>> +	 * If we missed the vblank, but the request is already running it
>>> +	 * is reasonable to assume that it will complete before the next
>>> +	 * vblank without our intervention, so leave RPS alone.
>>> +	 */
>>> +	if (!i915_request_started(rq))
>>> +		intel_rps_boost(rq);
>>> +	i915_request_put(rq);
>>> +
>>> +	drm_crtc_vblank_put(wait->crtc);
>>> +
>>> +	list_del(&wait->wait.entry);
>>> +	kfree(wait);
>>> +	return 1;
>>> +}
>>> +
>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>> +					  struct dma_fence *fence)
>>> +{
>>> +	struct wait_rps_boost *wait;
>>> +
>>> +	if (!dma_fence_is_i915(fence))
>>> +		return;
>>> +
>>> +	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>>> +		return;
>>> +
>>> +	if (drm_crtc_vblank_get(crtc))
>>> +		return;
>>> +
>>> +	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
>>> +	if (!wait) {
>>> +		drm_crtc_vblank_put(crtc);
>>> +		return;
>>> +	}
>>> +
>>> +	wait->request = to_request(dma_fence_get(fence));
>>> +	wait->crtc = crtc;
>>> +
>>> +	wait->wait.func = do_rps_boost;
>>> +	wait->wait.flags = 0;
>>> +
>>> +	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>>> +}
>>> +
>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>> +					struct intel_atomic_state *state,
>>> +					bool interactive)
>>> +{
>>> +	if (state->rps_interactive == interactive)
>>> +		return;
>>> +
>>> +	intel_rps_mark_interactive(&to_gt(i915)->rps, interactive);
>>> +	state->rps_interactive = interactive;
>>> +}
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.h b/drivers/gpu/drm/i915/display/intel_display_rps.h
>>> new file mode 100644
>>> index 000000000000..2cfb8a303b77
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.h
>>> @@ -0,0 +1,34 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __INTEL_DISPLAY_RPS_H__
>>> +#define __INTEL_DISPLAY_RPS_H__
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct dma_fence;
>>> +struct drm_crtc;
>>> +struct drm_i915_private;
>>> +struct intel_atomic_state;
>>> +
>>> +#ifdef I915
>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>> +					  struct dma_fence *fence);
>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>> +					struct intel_atomic_state *state,
>>> +					bool interactive);
>>> +#else
>>> +static inline void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>> +							struct dma_fence *fence)
>>> +{
>>> +}
>>> +static inline void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>> +						      struct intel_atomic_state *state,
>>> +						      bool interactive)
>>> +{
>>> +}
>>> +#endif
>>> +
>>> +#endif /* __INTEL_DISPLAY_RPS_H__ */
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
