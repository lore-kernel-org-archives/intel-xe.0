Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58521C6FD1E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 19:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332F610E273;
	Tue,  7 Mar 2023 19:37:25 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB2010E273
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 19:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678217842; x=1709753842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oqju7nQ8fHUYC5CghBWSse9Jjo0dUDcqDQpvts5Rnzk=;
 b=W6d/1S+BG9epIhB5LLWuO9yODJ9SoKHJDHdtzyAYbS13PTqV/uqaEQyY
 sl2VxxWvQIExaEdz+Mf2R+q5Kko5pNiW09uuMhj0R98Vf/fPVn+Ux0U+6
 BVrLRdyhVqakdf2SbqbO9SO42i9FZhLWgnHcbWonlfBkDBhL0L+LqCJwx
 Is/sxhNEKyE/esPomBbiix5uPzDLw3wGTabR8U2ruDHxRBV6J+c+uQnjr
 Vcnm1ee63n80t0pnd5cCX6JsanKaFtQX4aHzkLQU1f4/RKpD4/Ze+TA1+
 NZaCKIskh/AWNuBv8Khr/5vLuevthl7UEDXbeROp092sAKQvuSqwaZkFx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338275227"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="338275227"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 11:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006018371"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="1006018371"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 11:37:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 11:37:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 11:37:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 11:37:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+J8bMRWo6fUJBjelxTzeKX3w6qanqPgfUj/bEU6f7X9mpPwfLjG1XJG1Fb+pc18k/6e6vfwCNQiTo/oS89PIZNyfE8rSkIjrU86dy7TaY2JypkLJs4J+pOefGa5BllvaaN7/wbalTBLSMaLAbb6j2qWSZSO/+RG8GB4ZeEc3zORFIiJ+iCHzy5idS8ifk7LTh8JrjkdrLbgRJei0741jF4oOlkJUfyskcfmvMk5ynjJQCZWKpIi53ekI28TIgJt+xcgeABK/RgeWYknjLrP/X6+NoRymgcOQAYTqicrWUgo+o2wHZrrKp4o6oJPZTlIIOe3LWKWqLJEdM0ByFlF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYvJegVpWxX+m7EusiohUtRoKPU3ek7lItrBXOhHMvk=;
 b=ShZ5YLeADcndmrqhmzjRgwjpozVXTwhgZMkAza6fuS13Gt3enZDhK3S9AIzp/uIMiodJ96Ed3bta4pZzeQoPSHUZFpLiYKh2Wj9Hnn+mS8L6xW18RsZYNdHh8IHoD1llrLwgcoogj2ocq68qxJrPbM3duAcML7+HpV7BdDKqWVALMWIfXQjJBEOviSTT/vf9KPDUbmT66KQKiEuIkhQfURY55KOR/Putj6A8vj4oDojzGMhr+wKSJq9EA2/T2Uf0+kOtf5S42gw7ZdGteTQqbLpacx8iSCmlaI02WLOYyMclfriULc2IXdqOiNvSJSjWjx94AhEhncE0AIdIyMT0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 19:37:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 19:37:18 +0000
Date: Tue, 7 Mar 2023 11:37:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230307193716.2xanpqxaizt74egl@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230303105222.3550161-1-jani.nikula@intel.com>
 <167820788410.31452.11072511456478019404@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <167820788410.31452.11072511456478019404@emeril.freedesktop.org>
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c553e1-8e6c-42fe-2f3b-08db1f435cc8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +sJOcGrrzYS4JUvst4eNVAn+qN6sthhy5SXjdren9tMPJqzTFy2BPfNFzNhhxur9cwmavdp4E4w3pCfe+j8DX3kuqAjqX65OWLt0sio9QzKCyajz7HBlBvJUmDqzF8EZguaaeBfac+qJ5vzDvID259S9lO0Y6IG/LJlCPpbF5U82yPy8rGCrwo+2gTtckJGVUdUvMHy6vtssrbD9qh19GSKgb3oSIHF2pxcr+9zpt2k5RQ4UDn+57LVbwbbI7pw/VbRNhfqweXR/qi/52UivoZZESIQhKGKoJxMs7fCEBkIKFa0FyY2jRJDfpvysiSOTrtF6Pe/908kluG/wtwWgaccMiHOI5XgV1jDL3tQyuGvbqAaR06MOr2oC3gpMkMpSEOLD6vSTZEsroDiB6u9g1XZk/QaxYHkZQLsc7UdHpmKxEaoVvgN1y7J7tp7dfBuWpNRS9AXCXe8rD1uCb4KUYgN2AGwd4GOdrFtCq7pCzvC8QnClHVZ9Jn3THvBMyo9/9mEmtp06ChDT5VZD9xFNqYjuQtlpbXaGu3GUvg3GDM+rsfspbyu+EoUe++rQ2VxOalA8EwEvQl0i3DmOE3a1vCPgmUZFLbqlyZ8e6psNMcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199018)(186003)(478600001)(4744005)(5660300002)(9686003)(6512007)(1076003)(26005)(107886003)(6506007)(86362001)(2906002)(36756003)(6486002)(966005)(38100700002)(316002)(41300700001)(66946007)(66476007)(66556008)(6916009)(4326008)(82960400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iDMOTVTrPzJibL/b/ycnarqJAC2RR71EYiKn17aayT2toNXsKWF2vLuKnXHI?=
 =?us-ascii?Q?oiL6i4od3KTcE0+prSgrdvSEJzhpXg6+bc7xuWbcsLn1Dsv8CmgD7HTKV0YF?=
 =?us-ascii?Q?zaiIZa81JHR34eAq4LkiaRxcVKKZt4i6wjuJ3sq8ZbVIrsafELjrl2itrfcD?=
 =?us-ascii?Q?N4SN0DdiN3FD+sVudmObvtE4IhOQFfLS2TdpPtY8C55GvHhW544sVNi7QmMS?=
 =?us-ascii?Q?Qh5D0XrTvjNC9mRFmw2OyPPmdmfXpvGOUMIZ2b7CXUzEyM8ivCVX/cykDYPN?=
 =?us-ascii?Q?cVI940jkZDGbEznM0p9BTudRZz4VlOwx/EvJ9FVpbKMJN0vthElK9xP7jGR+?=
 =?us-ascii?Q?ARE6rcAPNDgeYxUY+tejs1HpU/WMfrW35O7Nu89CPKd0+v5nIRIQrNJJ6ndP?=
 =?us-ascii?Q?14tgJMfkDTCVJIu8HUUwikHvmA4dEb1uVIXw9dONUqEKUZuvKl+LvAfGPVXG?=
 =?us-ascii?Q?V763rbpZhMzAZinnbxcUf0VY355QUBh7oHXPAAyOEUi73fMt0500bjGsYw+D?=
 =?us-ascii?Q?yg1LJUcU6eMglDM9N64e2+ZY/Gw4KJ+m6GuBzoed0VeeWK2RqMkMVU5JGKsr?=
 =?us-ascii?Q?oXhKHcR31CsXjNUwc2gK8EoHpU20s+a+LrbOBdN9m9pR8t9w//KPV32X1m3r?=
 =?us-ascii?Q?kBFDYcx7RaAFiNPM5wJWgJBRTeIBIbyTj8KD2kmFUAMIKyBvYY3hjz4JOKCr?=
 =?us-ascii?Q?5yHBDjGbVMu8N6sWlpfpPS1+yJmb/LIQl3BMnFlH5vy+Zq27RdJ9m7WeJdjC?=
 =?us-ascii?Q?Nk5ApxNe/hnBC5yW+pKWFEsmMBkNVbTOC9EGytDGAsTi5B8d3xqQyvPJ+Bz2?=
 =?us-ascii?Q?Phfaw5kvnoRokUjMYLOfshXwLcVaDycFlRPCSyt4wYdEy34faQ5cDNuoISEf?=
 =?us-ascii?Q?1CbV76LGWLo6KYQ4XSbBayur1UWT1k+FZfCSf0yGQLFJ+ZgIDpmKdbvPhA2O?=
 =?us-ascii?Q?tePvZzg166j3osXxmTUviYSiuMRK3qxdQsNuTNTi6JAHRdSF272sGCWc6RgB?=
 =?us-ascii?Q?34zTkZKpCSq30F3Pn6eqzIZdnka6GP1FjuXWQBcQKw09SbvAcS7Ymrk2pUll?=
 =?us-ascii?Q?yEDhJNqsOzpG5EViM7Girr3J6TYbAIuqInzesJLlYMEXx4qsN4doyRS9hq8t?=
 =?us-ascii?Q?MCoXmv+5rOWoaThSYKq6SNABL5S7SAG+smYC6xOpAJ6EWzcf7O0GUh8+sAJG?=
 =?us-ascii?Q?NLJSovPFAXbxvv/aR3MjgJ2pNX9Zsz97CNus0w3rc8FoMqpkn7CB1QHnSkeQ?=
 =?us-ascii?Q?1B5Xge8uT3f45UeRHQIPsUorDtd1qypSB0fzg0HDW+/ir3iHQWbHq446iCEJ?=
 =?us-ascii?Q?xnDVVj4EHRNCTzeXGGZORrkmPQ2ZQMTVg+raL4zHVOieQMMjHBdWLhvmmHDE?=
 =?us-ascii?Q?gT7kikeinBJpaHIQ3TawwvSosNc2hsMFLfWBywT9AuXcalXlWs3GVCEENBiK?=
 =?us-ascii?Q?mb9WwfyN51GxwMMav35StjeJ55giHzJVAGjYJr99r+o/gCkGf1Y8QcSskUeY?=
 =?us-ascii?Q?CV/Z5inAkkkHdZVzENO8wyCXliVFRQiOeHf7BJHIKv5paKvMh+Sv4N/UVDut?=
 =?us-ascii?Q?bdkz8+gzVbGIGPSxnQ4QNGrUbmGd5J4zACiKj3D5NxS/KImcEqBni1zKfAec?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c553e1-8e6c-42fe-2f3b-08db1f435cc8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 19:37:18.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eN3lRWLjjtPlNwkWI4OSEutO+sfvM5iExl1QvG0MJfmnkZWfrwLzzwHEjSB+K8SGnrufidwHGWcVMbynnL/oij+/p4SmaL/UrRgOpTgDGVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_clean_up_i915_includes_both_sides_=28rev2=29?=
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 04:51:24PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe: clean up i915 includes both sides (rev2)
>URL   : https://patchwork.freedesktop.org/series/114573/
>State : success
>
>== Summary ==
>
>Applying: drm/i915/display: don't use relative ../i915 includes
>Applying: drm/i915/display: drop redundant display/ from includes
>Applying: drm/xe: drop unnecessary include
>Applying: drm/xe: drop redundant display/ from includes
>Applying: drm/xe: drop redundant ../ from includes
>Applying: drm/xe: move all top level i915 compat headers to a separate subdirectory
>Applying: drm/xe: remove unnecessary include
>Applying: drm/xe: drop top level i915 from include path

great, now we can see the patches are being applied.

Lucas De Marchi
>
>
