Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF4FC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 09:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A664510E638;
	Tue,  5 Aug 2025 09:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Eny6VFfw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A6D10E638
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 09:36:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 231774472D;
 Tue,  5 Aug 2025 09:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF9CC4CEF0;
 Tue,  5 Aug 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754386562;
 bh=lEe2WUOUAiyV2EtxDT2hpWbaUPkE7R8d9MlGyqoAETQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Eny6VFfwQx1VDjHXJ5Iu5/KYBAGTuXb7W72bRcwB+ase138J7E72tvhzvMwIbCeJz
 HAVMr+0Zeg9ApBAiijR9kaJivjxwpEyDzJUKwrnw0JC1MGQ4Z9xs5fHewy6ORX185q
 kWFVh4lqUdKctdNUy5lzWUoTD3CXTj7XOxGdqpw5XzQD0u0cIaSCPEMYmg5i2xch1B
 NUAgl84ov89zw7Kp3OarQ33AZUDyHgn6Lm+UNsAH0mPIYnCMjJ5mIYF80wzB8pvRNd
 ct7W0C0gF63PjZYRsEEF6rDUuV/CC7+SKPlrHBcEVddHvSwSdROjdwXlONapCCjfCl
 9QQU4i5GN9uPQ==
Message-ID: <000ce3ca-1572-4cda-9cae-2e29c41a02cc@kernel.org>
Date: Tue, 5 Aug 2025 11:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/25] drm/gpuvm: Kill drm_gpuva_init()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Caterina Shablia <caterina.shablia@collabora.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-3-himal.prasad.ghimiray@intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250730130050.1001648-3-himal.prasad.ghimiray@intel.com>
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



On 7/30/25 3:00 PM, Himal Prasad Ghimiray wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> drm_gpuva_init() only has one internal user, and given we are about to
> add new optional fields, it only add maintenance burden for no real
> benefit, so let's kill the thing now.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

This also needs your Signed-off-by, when you handle the patch.
