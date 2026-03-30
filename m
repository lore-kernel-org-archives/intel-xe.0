Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E14F3D61E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 08:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662510E57C;
	Mon, 30 Mar 2026 08:31:46 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125F10E57C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 08:31:45 +0000 (UTC)
Received: from [192.168.10.94] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id EDC163F01D
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 10:31:42 +0200 (CEST)
Message-ID: <e8dc2c15-e11b-4e2c-a645-04650cda218b@hogyros.de>
Date: Mon, 30 Mar 2026 17:31:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe: Normalize double-underscore include guards to
 single-underscore
To: intel-xe@lists.freedesktop.org
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
 <20260317215732.2208976-12-shuicheng.lin@intel.com>
 <SA3PR11MB81183F59A452BF482C3338C9D052A@SA3PR11MB8118.namprd11.prod.outlook.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <SA3PR11MB81183F59A452BF482C3338C9D052A@SA3PR11MB8118.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

>> Six headers use __XE_<NAME>_H__ (double-underscore prefix and suffix) as
>> their include guards. Normalize them to the single-underscore _XE_<NAME>_H_
>> convention used by the rest of the xe codebase.

Single underscore followed by capital letter are reserved identifiers in C.

    Simon
