Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2953BC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 21:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7A010E572;
	Tue, 16 Jan 2024 21:59:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF2F10E572
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 21:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705442368; x=1736978368;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nobJZArVOJjxiXxT+VdFKdVdRdrJNb8ojDBQGPTDQyk=;
 b=L/Q0rudjmd8Znk1Ps2Vdsos1rXlE9Gqa36+dZ6/+hV3WZD4si0jpT+Fo
 d8OLrCk1kKFlz4o9nFrA28XL6gdHBrcenbP5pu/sb4Ackxn7Exg7wZT+f
 PXAPa44mpJe/0DLm3KJ9rOZkP9j98gxJm5MCrmL8L7lNQPqECmn3EhZNP
 +LNJg87nsZEQkj8+/b2xtOZZKCo26SZGWCNBcV6sq3z5yY5GsDB1eYxOl
 ssdrd1+nTYNfal52SjUUxPnu6K8Kzc4Ph747Cv1VZgIHFlGsk2wQwiQ2G
 cpx5mzd1qwIniLGP/oV5iyClF8alWkxLPWMTTRwPq5YlX4BHlhCyMXZzD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21478046"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="21478046"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 13:59:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1031133807"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="1031133807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 13:59:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 13:59:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 13:59:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 13:59:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 13:59:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECot0Ri7QUBOMVIzdl4ONqwyUfi2vr9KNSjOVP71ONmylIhGy4nl/005K1j9MPWBOIHmBtW6n/0f0ysPVdV2n8Z7yAFb4cHrwc5tXncA69P5GFMz3vIBE6i9rL6dhn8/31SpY6ixo/NUAN1gkCA3mwO+KzrmcJu+YfzGq05Y1S6GGOsJ5rCoOvw5CWi+/xiHS4KocHhdi/RMaQzQ97WAtzu3bGX+I82R9LlwBGcnYq3BP53pnTWMaPFyqwKfsoEHWsov9AihubGqg1GTyj0Sw7p6a42TR4jL0zL0jU3wtu1q1HvercfpJQI2PEP1F6ttyiN94pVmu2rx+SaOcEKesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llAWiDhIgMZvQm9VEQUK8V9aY7BOKbKOo5poTooy0FU=;
 b=GvFg7b/9WL4sJEWIXqLGGRWydntojTx6U/tTRUyD4363L8PaQvRYnj5kWkeFY0ILuk7y95Sz5WplxnvNcSaYhSIZIDsgeyUczkJDRVKzgtBVuvm1yMj9aLOESsvA6pdmFTRJALSiD0ikK5EhXb63lZf4/kMuRRaIyqSk3WRGr6DLK5Ns9JR69bVvrsPGviUBpGkhFage5UqtkTdYWFH/k15t6hgqGWb4gB882EMp/FEjFdParcQBxUtb9fJAyQB+RDlXku7CfNm34SDujKKUa+jGhjHdkJe5Zbr6PLDZkWv81NeiTfAc8fEIFj2AU2GBiqrgdG38k/+D0oxA+BVJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 21:59:22 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::6ec2:62fd:7aa2:9c19]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::6ec2:62fd:7aa2:9c19%3]) with mapi id 15.20.7181.018; Tue, 16 Jan 2024
 21:59:22 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 1/1] drm/xe: correct the calculation of remaining size
Thread-Topic: [PATCH v2 1/1] drm/xe: correct the calculation of remaining size
Thread-Index: AQHaSLbyZllMA0NzNU2Tk63Nqk9KCLDc+goAgAACrDA=
Date: Tue, 16 Jan 2024 21:59:22 +0000
Message-ID: <BL3PR11MB63622A95EE4D70D9B4F47D249A732@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240116200424.651661-1-fei.yang@intel.com>
 <20240116200424.651661-2-fei.yang@intel.com>
 <20240116214826.GG45138@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240116214826.GG45138@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|PH8PR11MB7966:EE_
x-ms-office365-filtering-correlation-id: 215a8e61-905a-4519-d822-08dc16de65db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uw1CvPAx7d8Ldapj5Vungc0AJrpU4mZkJoB/xq5oNDt9gWka7pE9WfULxmiR1ObBPRPMSXXUAugpmUc3xGgKHy57fnhmovwL/1wYfAIXwaC1F1HVFXmhIx6TGNnmAS+vzdRZN1SzyEvb95R5njZxA2hU0+Hyj38yx6zPiMX86Zhe0LREwru6kPuJsV3EgSn9793lGKHMQUJgle8MoXZUWcsjeDUn2C48cPz0+oAxtZ+WAoZ1FsLuFmh2Kz0pS9Qsj4xlrdinbuaeDD5zo51Kle2OB8ucRWoHCRHsQZ8+xUYLN/o0pDSC1n29KymcrNE0xJhHAacv33yrEKFJuDnecCQvBmRtOCfJ5AStOj8zveWL8BIY+iMu4vUr5gYBu4Ni8fG4NIYXWwJZq9xfw1Mw4Mm0exm9t2n/lQCbprHnV+mkWQHrEOcE5YAaievP5aTJI7vaO2rp+rB1jOz1ji+q2xxdGlNORG0EAfBN6f2dyK7LKIv/h66RbWXyLfYSh74TYCfQFAOX14dxj+UEAuk+OKa1cZRy+qPhYScvFY9B20UhawSb5AIlQmhlgwv8nPHzxK9NHbbgjZR9zw4w1SVrxtELDLe2sSqK7fi9hpAGAH/364bmt4VEkkJ+TLPiTPoi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(8676002)(8936002)(2906002)(4326008)(6862004)(52536014)(66446008)(66946007)(64756008)(66476007)(76116006)(66556008)(6636002)(316002)(9686003)(7696005)(71200400001)(6506007)(478600001)(83380400001)(26005)(41300700001)(122000001)(82960400001)(38100700002)(86362001)(55016003)(33656002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t7EIj2lZG9GzoRhbtORTDLAifWuh+mMhd0cS6Ixqcl/mz5ntfLkP9VnkkhaR?=
 =?us-ascii?Q?wD6Xgbvn29+TIL8Vw010ReCxHV7SKAWnaK/z0dF9/11VaR1iIn8JzqQ1s7Nj?=
 =?us-ascii?Q?6V9d78jgmMWEGp3Pv2U7faFlNCPjXcwAT3ert9nlGxJHdNKGC94+sYuUZD2K?=
 =?us-ascii?Q?h4HazWG8fj7QBZnzmusuSARE3nbEF74pSWFX015zbsf+YoKPX5fOKf0cMOZf?=
 =?us-ascii?Q?VLzGezQ/gieI61hVWgOvcTKPzD7xjTHSQEa9l6t1RMiZFydoo4MgynJ2vB70?=
 =?us-ascii?Q?NAkY5In4hl3iU30DdR6JheuO3IVFk1fdjxH8FVEVNd3Wk1HPZGZeIDlVOXK6?=
 =?us-ascii?Q?ScVvLYnUTEH3h6vnbrzkhH8ufTWUDtsAdVCigd24yHfVuFc9eCBuI29mAV5v?=
 =?us-ascii?Q?yEStSOljDo/YcrFaL7rJZxRFDTQWs8H+dROVUYUtDoosqQk3oiAlGFg45dbs?=
 =?us-ascii?Q?GCgzRwXBBkffdkkcvGY+PYWVCfrwCZxq7cO6wHb67zez0j53pnCE/ac6jOkY?=
 =?us-ascii?Q?uFiUAJ8nBXLWBriTXk+3td8dyd85QakIU+7tgXx2iA8C70ejTGoEd6E9KT77?=
 =?us-ascii?Q?1LOWIyt8boAiJ8PZlLyb+vO6ZKnHvjshWcAGeORtPL9JeSreeYUBP0nWHeiQ?=
 =?us-ascii?Q?ormTlnGQr+y94wUjt4WdU+/Qv81MW7KcGRs2H+No6cXcIvlq6D899+ukwp5J?=
 =?us-ascii?Q?W2CIutIDhEQ8tj0nCjPr/JDLS8Vs25XiWJA3R3AGmZo8LVL0nKw7+/MVn72n?=
 =?us-ascii?Q?cxAu0YZ/7IN7JJ6iiTqKZZz+KQoyN8ZWxr3/0HSnQKu/GFbGd/zD01Oy9eUD?=
 =?us-ascii?Q?/nBaIxhWoOdy9g5LpyHB1Rojm/PNroHq5N7UquvSO3MfydHl0tlZkKum4Zo3?=
 =?us-ascii?Q?zldbwi6KzaZRCU/LWkoxg7kkXBbfMe0MvzL6uSXNyayUzP3mJ2LT9d/wk+9Q?=
 =?us-ascii?Q?vfeERe/9VkxoACxxxLGYiKRQmwHrWOauyuSlm3SGVdwDiI/YaASR6DHX8Xpo?=
 =?us-ascii?Q?C04OJxgZIZkzzDEEZTTiptvKYlBLPSJSpIzLTglfHSEUTXfAZe09Ilb+Abe8?=
 =?us-ascii?Q?qkIs7woRuzvffV4OSMZlHPk1rAvyH7iK+nL4l4DKn6ngEw6CPbaZcYZsjbko?=
 =?us-ascii?Q?0ynL/oibm6VRgUDpyXN4rIzXqonhPZjChDoFQjoIQVAs/9FN+TgXFBzyAFse?=
 =?us-ascii?Q?OnDDwtmYaouO5CU/zT5kCkUHl5r+hYjkCBkeQ0O69AWrVwpwYSsrbrJSENna?=
 =?us-ascii?Q?SI17ndAs7j/fRMd08rJFYYRpisDTW46/58IQkzN3c2rHAKCQkFiw6vOLr0wE?=
 =?us-ascii?Q?mYNYnNMMshM+HNbEGIEWgmTFMSsRxUhRCiqBIStAn2iG1AbbB0CEnEi6oE+J?=
 =?us-ascii?Q?CxJjYjWlSkIIX2xRcsqmeh8UQmeJfbCbax7UhRp3l5G/NMqFBuBhX7ar1cD4?=
 =?us-ascii?Q?aW4u7ZcROEpChDUOJaIrqzVEWHp+SFVMd4Lr90VE0vYVbVz8BkzRUHYz6xAC?=
 =?us-ascii?Q?qaCAYCYz0Fau6Qj5o7kSvsQlQ12iP5pP/UebWVyzYsyjM0s6rDwC+pE4jLpB?=
 =?us-ascii?Q?TVPpu0zOtjA48cS2/Ms=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215a8e61-905a-4519-d822-08dc16de65db
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 21:59:22.6717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7Mel6qTUtXQhtumQOOvgovZpW6xizEmC3QX9nqAtdBWI0DvX4l8KQp+KUQWRQPSo8fBnovo9/ldtwHrr7kcZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

> On Tue, Jan 16, 2024 at 12:04:24PM -0800, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> In function write_pgtable, the calculation of chunk in the do-while
>> loop is wrong, we should always compare against remaining size instead
>> of the total size update->qwords.
>> Also, when performing dword writes, dword length can be any value from
>> 2 to 3fe, always adding 1 is wrong.
>
> Always adding 1 should be correct.  This field holds the number of dwords
> for the instruction as a whole (encoded in n-2 format as it is for all GP=
U
> instructions), not the number of dwords being stored by the command.  The
> instruction always includes three initial dwords (1 for the instruction h=
eader,
> 2 for the target address).  So if you want to store n dwords, the total
> instruction length is n+3 which means the encoded field contents are n+1.

But according to the bspec, what you said only applies to qword writes (bit=
21 set),
not dword writes. So, MI_SDI_NUM_QW looks correct, MI_SDI_NUM_DW is not.
Am I misunderstanding?

>
>Matt
>
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 2 +-
>>  drivers/gpu/drm/xe/xe_migrate.c                  | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> index c74ceb550dce..415609b070fb 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> @@ -36,7 +36,7 @@
>>  #define MI_STORE_DATA_IMM           __MI_INSTR(0x20)
>>  #define   MI_SDI_GGTT                       REG_BIT(22)
>>  #define   MI_SDI_LEN_DW                     GENMASK(9, 0)
>> -#define   MI_SDI_NUM_DW(x)          REG_FIELD_PREP(MI_SDI_LEN_DW, (x) +=
 3 - 2)
>> +#define   MI_SDI_NUM_DW(x)          REG_FIELD_PREP(MI_SDI_LEN_DW, ((x) =
> 1) ? (x) : 2)
>>  #define   MI_SDI_NUM_QW(x)          (REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * =
(x) + 3 - 2) | \
>>                                       REG_BIT(21))
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c index 44725f978f3e..d5392cbbdb49
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, st=
ruct xe_bb *bb, u64 ppgtt_ofs,
>>      do {
>>              u64 addr =3D ppgtt_ofs + ofs * 8;
>>
>> -            chunk =3D min(update->qwords, MAX_PTE_PER_SDI);
>> +            chunk =3D min(size, MAX_PTE_PER_SDI);
>>
>>              /* Ensure populatefn can do memset64 by aligning bb->cs */
>>              if (!(bb->len & 1))
>> --
>> 2.25.1
>>
>
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
