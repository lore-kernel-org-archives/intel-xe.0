Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB8DC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 20:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187FC10E148;
	Mon, 27 Nov 2023 20:39:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822C610E148
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 20:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701117572; x=1732653572;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=mcxn0SOp34HmwzBnBOiN8dRzGp4xEdzVx9lgGciS0Wg=;
 b=oAzOxE21eVB11WHTqjacLeFC53QfVhlFoHv+LfueICye6WlT3r5X+UOp
 FiMJY6usAuHJKa846hm5/2UAsuKuJU4H411pC+eIlNCHSnEKwCdtSJIYO
 tJbZmpm4MsafODejTC5bDAbZ468KHD92vNet6h4mfANn0GLlXG3BZMIRb
 yBAxSocP93q2asSImVPiIDIDoBc0qupm1eXj0BHKzjSoyd2BESVYiMr6x
 VD+7wfUhq02B+bDv/DcAu6R69fr2gCoOBBEUGGRDbitNh/QMy1Ter2MxJ
 wkVCzylLeWE8QdYTkcVobq9tA1fkAx4KNHg/6NBNt3oPZxAj9JJ9tzsuP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377814245"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="377814245"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 12:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744677257"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="744677257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 12:39:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:39:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:39:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 12:39:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 12:39:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3LTYqfzDA4drrHfRsTxvYR3Tq6KqlIsIS80Jli7cbb2Nqefxkflxq+aWQ59oYeZbzS9X+w/g9F296Wf7fSBxD0dbx1mMl06kMiTi+WWWRfL+sBorfiMHmnmg23UUu/iEES4pk5ja+5G5b6aC6lGvWn7gAFVqB8okzhu5x3UKZORlPo1iB6sn7CYRKYwBai1Ps5hdxlvmtin3lm9QZ+UYVxW8I5qWjdU49RBZyFEkgprUybJ1Q7yn2XQvYrV2hPwYsOL3rFbfwfet6BGEmbp3uZ0DPcVpDGcjVuyfkZ/XZQd7/qkvshHZ6H44IvgpwQQLyr54jw8ojlruLkzW6aaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwXGnsR8V9xR1n6g6IUNDFpfvWD7tQ+FCeyJGXDUKz8=;
 b=axSOCJF1DEVcVAhjHQUhBTK2HCND4j9iPFV2guFRnCqDjZkW1CIFoU5DAzL0ynFubJrU4gLBF8uiPp9bCBp4zuVSsniqKLpNni7BFtPS7eJ13+Scw+KEkwuOYVZzQ93N5bSBS5zPxy2ymMauv22F+Y/kE4H5ITzd65cgJsIsW8nKo62LzMzSt8nzCKAf5OZ1YDGpxkX5Uv16kE7ukLSExOltVR8F75a3znMXtQCjW9uDkpDRCjtyizTnvO0iQNjhAsgs5JuNTQ2ZZfr+7ViWANxGBnAltts/D5efiP08xFHyc471IkFbIGx+hkWfspc7BnM4aP5P/Wd06QPDjW0jHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 20:39:29 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 20:39:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231127190332.4099519-2-matthew.d.roper@intel.com>
References: <20231127190332.4099519-2-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 27 Nov 2023 17:39:23 -0300
Message-ID: <170111756376.56286.12271139830516445230@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH0PR11MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 4369aae1-214c-4e47-66f4-08dbef88f3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuEvI6w0d+e3xdQio+eAGgF1nHBu5mHkuy9JqxOuAY32LDVpk7IXeiUtda2hTO2/U/d/5rZyyidWZsOMF4+VFzPDn+XpA21aEO+Td8NewB+cco3WMSII3pFnvV8lX9BqjSq12X3bYpXPMGVDFqEs9rGtX8O3fjYC1riDc4F2rDb7GjppoPb8+xSp3h1b37zcVArkGpSgRBhd8/TZTK3Kyg5ZvjGbPVtGuJMqeR/He8kmTiaxlaMTF2sWLWce8oJ+xIFqfmQlj4n+rIxyABDEMlwPqjFCMuCEYq6NUYkV54SMgsT4wxcLw7VOX57Qhzgm24P2uVQRt4aWSTJ3izgM8SLqBkde+HSAXBMSpNObSW7XwkEnnxEpnB3ahoUI6cW/X4Z4a3wduhLrezHmjlh7giU9GWOdLo5UOzisw8EEbe2OwGAikuWNK83vyCzBk53PgeI8C+03hHmkrEm92NycC4JXrylreSu1lv8dM6RptAoFBIgskO0bhxxQ9ucc5/u4YN5nQUJVYdmbAgOzWaQV+oqnFFJ5kVjtdp9PUdGB0Kmdcp4MJ5JU0Me23FjeBOKs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(107886003)(26005)(6666004)(6512007)(9686003)(82960400001)(4326008)(8676002)(8936002)(5660300002)(6486002)(86362001)(44832011)(478600001)(66946007)(316002)(66556008)(66476007)(38100700002)(83380400001)(6506007)(4001150100001)(2906002)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUVsRU1JN09ZbnJHNGhjMXR4MFIwRUM5RElnQkIxV3VpS002S0VaY1ZXODV2?=
 =?utf-8?B?L016Zmxjamo1WVlHekhubUxVTzhsdlQvaFhFVzY0Q1dyazFkSFRkR05TOHZG?=
 =?utf-8?B?MkRGNU5kVG5xNmFHeHpSY05PT3A3MnVobjg5cFppalVEbkhXb3F5bUNQdktW?=
 =?utf-8?B?RzhSK3hYMk42VjlzSWpKa2Y2QVBPZ2hHV0w5SEJwODlOc1dRcEdoL3RUeFpm?=
 =?utf-8?B?U1lrYXdBOUhwY2kvdElGYUdQT2svOXZxaFZzbWhnRjFwVElqMVVjMjNEQU5I?=
 =?utf-8?B?WlplUWROY3ptZUtZejEwaDZBam5PQ1I5U2MxZWtZajZpT3FzWUxYTHgvNWFK?=
 =?utf-8?B?VHk2ZFZpKzF4R2NSTkt4eG91NU5pRUkwZXdLbndnL0VrK0cvRjY4QVRvUHJu?=
 =?utf-8?B?bi9WVzBQYVJNR2hUd1A0dHNyQzZSS2lNMnZUS2YzVnNSci95S0RaN3JyUFd6?=
 =?utf-8?B?cmc4eHpydzk5a1luU3UweXBnU1NaYmphQlNtYUl2T3Jucm4xcG9jSE9jRDBE?=
 =?utf-8?B?M1ZkQzJZTVJJbUZQNlR1TU1Fa1BnZlNNS1lOOVRlM3NZckNQUkNkWis2WGFY?=
 =?utf-8?B?U2FCTkVZczlRWGx1Y2pyaWVobjl1OTBpTCtrNzNKYzRnUUhTVHU4alZob1hk?=
 =?utf-8?B?ZU5NMGNhUDFQQm8zYURha1FWOFdlVTg4R3ljMDJ3VmFCeHdYaDNJT1VqQUx5?=
 =?utf-8?B?UHg1NHNWNExJcG96cEx4cm9seU5MMDRrdkZsVXpseXMxN0REa0VqT1hsQWp1?=
 =?utf-8?B?a1BkcTZlTUsxbmJ4KzdZUFM2eExjNnoxamdGV0lXU0hTS3laZkNvRWd6V1Z0?=
 =?utf-8?B?WGhJc3orTUJKamwxY0ZBUjhKRXBQU2h2STN4VGEwR2ZIZnZWUm5wTmI1N005?=
 =?utf-8?B?U3Y2c2lYbjMzOGI0dEJxZzY4QjF3bkRiQjdFZzNUVGxqbm9QeldkdlozajV5?=
 =?utf-8?B?RW4yWWk3OGliRGdwT3JaTDNaZlBPcjdBMGpEc0JIV0JBaVlJNThjT3ZoVXB5?=
 =?utf-8?B?ZEh3QlFJbmJWYWJtMUxjN2dIODJXU0FKVTZsQUpCU3FSMk94c0RyVzFBN1RZ?=
 =?utf-8?B?WU03UmwxUStEZ1BPNEJPQ0RmUTBKVytMVjVZNnJyL3QvVDJMcUUrRzFlamNu?=
 =?utf-8?B?THdlbXRJb2JNa2J5d2hTK1ZZMW9ReUdKMmFWLy9zUGRJQjQ5NTl0YkJIMmYz?=
 =?utf-8?B?dDFxUXNSbFRjbEsySGpucUQxSTJOZ0hJemp0SnlmRHR3aGcwQy9scTA5M25u?=
 =?utf-8?B?TkUxTExGZ3cyUGE1WFduR092eDlvaVV2RE9uK3crRFVaV0QvcEplVU1RZzRC?=
 =?utf-8?B?MlV1ZVY3WVI1NmV5SjZTRVpQdlFtUVZQRWlwSEZScVJYelMyM3kzWjZDR1ND?=
 =?utf-8?B?UDh2WUxsdHNNN3FScWwyb2VIUWg2UW5WUGpXbUJxcGtERzd0YjN2V0NQS2NC?=
 =?utf-8?B?cnlhR1RzQ2xNUHFjN2hmZFVTc2w5QmJIWUIyTDFWWVY3bzZxMGNGR2ttT2RQ?=
 =?utf-8?B?aTVMVFg1NDU4RVJFb0IwU0N4aGdxU1NUS3JWUzJLSWtMV0g3citJRXpkcUJz?=
 =?utf-8?B?blVFUUt4UmphcW9hVE5rY0MraXNBcGZPSm4rZDk0czZ1bi90aHNlR1VESTAr?=
 =?utf-8?B?ZW1iTDQ4U1ZPMWZick5LZ1lYYzZPc1Uwd2pLOVVobTJpZitud1FoVzE3bHBV?=
 =?utf-8?B?QjIvbkpuUjBvU2ZxbUNMY2ZvdytNUFYvWUMzSVVkWWZIb0RsckE4ZENFTHp0?=
 =?utf-8?B?Z0VwaXovWm9nV3E3eXk2djlDSmI5Z3ZUR1ZNVUtOUFBQT3Q1NDdrbW9rdmh4?=
 =?utf-8?B?WTlWdi9rMkNpUFJkeUxxNm03SjRPazdjdVdCMlViNzQwOWRJV2swQ1N6VCtS?=
 =?utf-8?B?b3RMU2VyWjdCbnFnZ1pxdFI5eGNDVDdvOGJ4c0htSUtvWnZwLy9UNWgrREp3?=
 =?utf-8?B?S2tzU2JsVDB0bXNpMXcyTTQxZFVHb3hJY2ovdjUzaUVnRFBKRVpjbUZxTi81?=
 =?utf-8?B?WWcrM0luZmtTQ0ZRblUzSHU0cWpoY0gza2ZsTVE5cUVFaG9iYm1XWVRBWWV0?=
 =?utf-8?B?emE0TllpalBOWnJLamxaWXIrVUFZK1BqZHNRREY4Z2VVRU1lNm14UjRnV1Zy?=
 =?utf-8?B?Q09GMmtZdWhkTWF2eVQxeFRoNmtjMnhDcDZZc2pib2t1YjM2M0J3dmVhbjAz?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4369aae1-214c-4e47-66f4-08dbef88f3f7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 20:39:29.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Rz3IdGFhGViBoL4QGUD1w6B6qCaeVvle6gCwOFPEHRVj+yCrdA4CM+D7KqcbZvnqrG5RGL2jAWAtUuio5LGPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Drop Wa_22014600077
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-11-27 16:03:33-03:00)
>The workaround database has been updated to drop this workaround for all
>DG2 variants.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_wa.c | 21 ---------------------
> 1 file changed, 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 81ae0232146e..e0853ab30c00 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -522,27 +522,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>                              DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>         },
>-        { XE_RTP_NAME("22014600077"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(B0, FOREVER),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,

ENABLE_EU_COUNT_FOR_TDL_FLUSH gets unused after this change. With the remov=
al of
its definition,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>-                             /*
>-                              * Wa_14012342262 write-only reg, so skip
>-                              * verification
>-                              */
>-                             .read_mask =3D 0))
>-        },
>-        { XE_RTP_NAME("22014600077"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,
>-                             /*
>-                              * Wa_14012342262 write-only reg, so skip
>-                              * verification
>-                              */
>-                             .read_mask =3D 0))
>-        },
>         { XE_RTP_NAME("14015150844"),
>           XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_c=
ompute)),
>           XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED=
_WRITES,
>--=20
>2.41.0
>
