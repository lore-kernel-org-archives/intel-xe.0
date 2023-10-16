Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9B7CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 09:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD0210E15E;
	Mon, 16 Oct 2023 09:08:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE3510E15E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697447302; x=1728983302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=njzHdLsL4gBUqf4uQkz2uRrqYZcHFJbL9FNmyRxPIVg=;
 b=Qj2ctrNgfxZhydprA1JyHfjFBwXjW2yPW5wqQ+EQeF95KdAJ+md68osx
 sjeAzeyHOCMj/Zd2ERRitpD7vrOhGXe9hmzXrPB7OSfrpldcr2wyQYa5J
 3i46YQP3qPv1fubeZNUoLsx99K/2ii1NN46gPmSKIPi8e5Xf6JtPUi1hm
 a8JOcxoxlyzORot9Tk8G8UMXHI7ISC8ePG42y571ffNN8kmwlGemuBnYC
 xyuqYez+oeVw1p33asDukyWNbhWptg7tljhEYywj6jvz38R289ZBGoifB
 SoqGZbzFLx1PSvgudw0u3MCr0TFtMg61b2STeSqgFi3J9i9ULrKWTM51s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449690839"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="449690839"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 02:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002863293"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="1002863293"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 02:08:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 02:08:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 02:08:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 02:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT/qaSWrEqvub+NbXOX9ST2SP40WfVmwDIvhBo+yMv1BS3sZOyNZeIRyvZZ/GRqQ6Lw0aKe186eBCv594uL1rXx1Eg6Dy0nHNGBJQYRYnWXnpEql8frxLQWoSLYyrc/hXGmFf3MyEG8uE17YcRiNA2UkxuTbk3/twPWEsodX2/0UrFhhHvHxjp/vWZtTIiPoL8ES+c6hKpuyd0wNeGp8Rfjo68J/PbxXDyp4T+zIgUY7wKubivz1gcAZurllPHIeK7F2jeKUgOkX5Nd5a+Tdvbd+X5yERiU8VozEEQb9nu57kWYPLfY7v2CMG7N1R9o3s1yewRdFgACArvRMToqlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEaUJwJ1vnBcR6CUooWhuMRmRElFxkpuDcpIHWw5fiQ=;
 b=ZAyVM0XxEvyKkXvzCBJIF4BTiH/qarvwvHreihNCurFIVMH88tbFE4bqiceRGcuwhPrrGWjlZN5HMvfDiYNAtDGFlLh786KEtMoHD7H6l111teHW2AseJUaPR5ENmMZKlwECZ+lNsLqgq+o1MmVFPkSiv/JfflFiV8RH7+5Jti3PokBe3ZblerwNaCO8N3PHYwosi0j4YvcsAjOD1KkLVkSOJ4aL/dpEeN/R1g4tLTUajAFUJwkhwI1jlpPB+h3nE8nGviCSWuCS2+7okObAVZ+gRP+zhieZtrERHcAgA+6fQT8m9p5ixzQR7YaBDgbFOsaqtlhk13nPOtzKEf1JZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 09:08:12 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:08:12 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v6 3/3] drm/xe/hdcp: Define intel_hdcp_gsc_check_status
 in Xe
Thread-Index: AQHaAA+0OHmuYTyhF0ep4M3GzkWFBLBMIC3A
Date: Mon, 16 Oct 2023 09:08:12 +0000
Message-ID: <SJ1PR11MB612975CD085768069AF99676B9D7A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231016090139.850525-1-suraj.kandpal@intel.com>
 <20231016090139.850525-4-suraj.kandpal@intel.com>
In-Reply-To: <20231016090139.850525-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7457:EE_
x-ms-office365-filtering-correlation-id: aa5387d8-aab9-4dce-3cbf-08dbce276c60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yQj+Dk6unV/8vYhq7PyAospjk0Yx4xRg5/m8vY1I9TxneAZsOBN0wkPhMIdzO0izhSiPzclbvVlqTxAxtkLoVaSS1u9FTc6aNtIkYwrvtlGMJ2nBvzp3F1Uec3dHrymkFVRd/Ql5rm9NemrUOUS3T4KjH6d9u89mR2awKocPboU6wMTK7GNBQvPp8w+VamL4q38Ed370C6HFPlpFbEQ2xRR4EyT+7w4hx1gSVZI2qmiv8W2I4tR/QjGD+yR1S7cZyrJBSq0Aoj9wXlk993jvuofKVPDVz21LSj+M0ZGI00GyMJtn7ODcValgY40G6GU9KJfqq2ibz8XmNNVCygm46GotqzEb4VPgmV3Dob9gtcs2FN17eNRBI5ElOG7Aw4aU922yuNvneoGNmfnm0qh340HDBhnqEOmCAIWOL3nz7zyu3ikRQXmskU6/ImiY+eIBrSpheJT+qtUMlTFKIJowv14WY7NmGflf/iLuiCJGx1R3JjIEVjNeudvckUwwZgt6qWEKD8UVkiuT7Aio1yl1kqQtFj03imxlsSnGHo3RSWBMqszq6dHq2llQegPDBiNgjgLXv0P+VLdOBADQhDC5V9w0TrlMK6PlWapU5882PJUdGU6OE3ZQMHefRIKhtmao
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(76116006)(7696005)(53546011)(316002)(6506007)(9686003)(110136005)(66946007)(64756008)(66446008)(66476007)(66556008)(478600001)(71200400001)(107886003)(55016003)(52536014)(8676002)(8936002)(4326008)(41300700001)(26005)(86362001)(2906002)(38070700005)(5660300002)(83380400001)(122000001)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2L2Urlm8KQEdkSI+RkVDHNqo3CtRNN4LWi+zlm6uRo/lVLnv5d88yaXvCUXV?=
 =?us-ascii?Q?gqiZTDdLDZgOhpuJIvznWZSgUWrK37o63QL5SunKj2EWG2IYB6mJjG/o7ydC?=
 =?us-ascii?Q?xE+SYTH7bVv64wjxER2UtR03UMxufLN8NcQ3/5OXZn4J12HWb4GC+JfAb+7q?=
 =?us-ascii?Q?yF88Pa1J2N5FptC9fCqg4sEv4G/nyHh5TbNHa0u4Z4IDQLqtp8EUwHgpnLne?=
 =?us-ascii?Q?BAFcUYIMuDXP0CvU65ldIu7gkrQ6QuO4Z7w8RRih+vi38i4g9FwAsQYbXo+S?=
 =?us-ascii?Q?noEHm4pnws3KngPi9XRMQLDOF3BIhngTC/QJ10R6+K3lkXmD8W7z6QNDMQJ/?=
 =?us-ascii?Q?3st/6i5yKCfjRBhvu0Yv3oUM6bJ2ZYgJLN3E6xNXNlfwxJ2Jwi1r4iGqGzXZ?=
 =?us-ascii?Q?Gc005NNmmfI5/gWESUSsq40p7GMUrH/W0RgfjQQc53TO1cLnmE5159eWxqAO?=
 =?us-ascii?Q?cBSvzEYhtnyGiELo72eUf9vCO43GSiYrmKVCiqStNIErPzQfFwmxujbOILXp?=
 =?us-ascii?Q?lyndtVRLU8QsJqbQxExvOWOYKOPSibdcoqyJaJsr8j/CL7PHbGgh04Ec4Rnz?=
 =?us-ascii?Q?Z5kedxgXgWdDMCGnh5nFOnnTb4ryIdlbrvWlnhTjY+ae4EcZ4kkss8U8bN4X?=
 =?us-ascii?Q?1uiPPSgX2Vyt1jlp07RYw6x/GemTyJlyseikg+c4QrPeGHD6+j/L0SLmiip+?=
 =?us-ascii?Q?e06dIkvrUUkXozRVc5yHxqFTvMYIkj6nqn2a9OMP8If+MC9Jof59Mpz75n4h?=
 =?us-ascii?Q?ldSh3J1SMrEA3tkkFWUDDdTISHPb+cfNm4EuXqWYHozkmN8sN2DMG3u7fYNd?=
 =?us-ascii?Q?mAqJFRgUCD+2/rBhsuSwedelrqF3/uUnJ6NKvsWsawWEB+NX10g78GoXDqc5?=
 =?us-ascii?Q?Tc3ZVOA35tqM8b9+UbNtk6HxjzMtPAAe7B4PhX0O15AsiiU9504IfBjgzKpy?=
 =?us-ascii?Q?XMAhjmVl6eZw5lihad4hJZneIBg7TedxInlgbZHClsu403F1kcd1VSto/KZB?=
 =?us-ascii?Q?X0q1dJxIjMjqQPKy8CsUALha5j/WShuoUkzkgqHyO3uLWc9N/bjpIWckmBOg?=
 =?us-ascii?Q?aHKZ0ckAPkfzEUz3oykAGzvsO9g5xl9JJhYh62wT4DInyzW3wXBZOM1b7z5U?=
 =?us-ascii?Q?rfHtnDVx0aSzWv6lEoBJFCGE76XnPJl9yURM+9IswiU3lVHhuFFTD6pCni9p?=
 =?us-ascii?Q?bUJWslz3VCQRVps1WruJ0CwXHwDBiaFxn8YhhMbNMG5bwlsZEjLynBoKVQzr?=
 =?us-ascii?Q?UC71TAsns6nqfqQw72mx5PT6UN10Vm6uIVhWiCEfqNI3jvAtbjzF1sDErkCG?=
 =?us-ascii?Q?fKEdaDEYu99/QA5wUw/882Kzw3rwwt3rbYj6DUqwuy2dPkIgpBZBbkDm9kfv?=
 =?us-ascii?Q?orVtiZ2pM8RZzJg3NW1ofZYbTTKzIHmTZD+RqxY9CjX5rLlT/v7ACs8MQU9T?=
 =?us-ascii?Q?MXuaH90JfWBQXLIcI8SAkrR+zf+uutc1o4wqw5ldKoQxj6akgTnVFoQKPcAj?=
 =?us-ascii?Q?5bA3IY9gXI0oT7xD7rC7+DHLdiwAJN/kFc08awrzRgGBm6ytO0LMlEtr/QQ6?=
 =?us-ascii?Q?u6p7jDbbJcYDr/neW/mchDpq4GNTT1wg2Iko/HFmnVMvBiYndTit03fp6tWR?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5387d8-aab9-4dce-3cbf-08dbce276c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 09:08:12.0306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDKhoh6Gb2P9Zky8lqH9yMZi9O/GD5qQDTQsZSw4XjiNTbFKtWGQu16iE7u7FRS7NnsswXCSPCGmFXprtPhDjrCah8/fR2OBaYtplIcsMlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
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



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, October 16, 2023 2:32 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v6 3/3] drm/xe/hdcp: Define intel_hdcp_gsc_check_status i=
n
> Xe
>=20
> Define intel_hdcp_gsc_check_status in Xe to account for changes in i915 a=
nd
> Xe.
> intel_hdcp_check_status always returns false as gsc cs interface is not y=
et
> ported.
> intel_hdcp_gsc_cs_required always returns true as going forward gsc cs wi=
ll
> always be required by upcoming platforms
>=20
> --v5
> -Define intel_hdcp_gsc_cs_required()
>=20
> --v6
> -Explain reasons for the return values [Chaitanya]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 0453293af8ef..0f11a39333e2 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -6,6 +6,16 @@
>  #include "i915_drv.h"
>  #include "intel_hdcp_gsc.h"
>=20
> +bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915) {
> +	return true;
> +}
> +
> +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915) {
> +	return false;
> +}
> +
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915)  {
>  	drm_info(&i915->drm, "HDCP support not yet implemented\n");
> --
> 2.25.1

